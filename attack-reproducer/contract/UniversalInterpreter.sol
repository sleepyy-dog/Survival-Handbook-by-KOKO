// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// 引入OpenZeppelin的ReentrancyGuard来防止重入攻击
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title UniversalInterpreter (Singleton Version)
 * @author Your Name
 * @notice 这是一个通用的、可重用的单例合约，用于原子化地复现多步骤交易序列。
 * 它通过在一个函数调用中加载、执行并清理状态，来支持包含复杂回调（如闪电贷）的攻击。
 */
contract UniversalInterpreter is ReentrancyGuard {

    // --- 状态定义 ---

    enum CallType { CALL, DELEGATECALL, STATICCALL }

    struct CallInstruction {
        CallType callType; 
        address target;
        uint256 value;
        bytes callData;
    }

    // 常量：定义主函数执行流程的父节点ID，固定为1
    uint256 public constant MAIN_EXECUTION_ID = 1;

    // --- 事件 ---
    event AttackExecutionStarted(address indexed executor);
    event InstructionExecuted(address indexed executor, uint256 indexed parentId, uint256 instructionIndex, bool success);
    event UnknownCallbackReceived(address indexed initiator, bytes data);

    // --- 临时状态存储 ---
    // 为了支持多用户并发使用和回调，我们将状态与交易发起者地址关联起来。

    // 结构: executor_address => keccak256(msg.data) => parentId
    mapping(address => mapping(bytes32 => uint256)) private userParentRegistry;

    // 结构: executor_address => parentId => CallInstruction[]
    mapping(address => mapping(uint256 => CallInstruction[])) private userGroupedInstructions;

    // --- 合约生命周期 ---

    /**
     * @dev 构造函数为空，因为这是一个单例合约，只部署一次，不包含初始状态。
     */
    constructor() {}

    // --- 主执行逻辑 ---

    /**
     * @notice 攻击复现的唯一入口点。
     * @dev 此函数在一个原子交易中完成加载、执行和清理所有指令。
     *      它使用 `storage` 来临时存储上下文，以便 `fallback` 函数可以正确处理回调。
     *      使用 `nonReentrant` 修饰符防止对该入口点的重入攻击。
     * @param _invocationHashes 所有父节点（回调入口）的调用哈希
     * @param _parentIds 对应的父节点ID
     * @param _instructionParentIds 每条指令归属的父节点ID
     * @param _allInstructions 所有指令的扁平化集合
     */
    function executeAttack(
        bytes32[] memory _invocationHashes,
        uint256[] memory _parentIds,
        uint256[] memory _instructionParentIds,
        CallInstruction[] memory _allInstructions
    ) external payable nonReentrant {
        address executor = msg.sender;
        emit AttackExecutionStarted(executor);

        // --- 1. 加载阶段：将指令数据临时写入 storage ---
        // 这是必要的，以便在回调期间（fallback）可以访问到上下文。
        for (uint256 i = 0; i < _invocationHashes.length; i++) {
            userParentRegistry[executor][_invocationHashes[i]] = _parentIds[i];
        }

        for (uint256 i = 0; i < _allInstructions.length; i++) {
            uint256 parentId = _instructionParentIds[i];
            userGroupedInstructions[executor][parentId].push(_allInstructions[i]);
        }

        // --- 2. 执行阶段：从主流程开始执行 ---
        _executeInstructionGroup(executor, MAIN_EXECUTION_ID);

        // --- 3. 清理阶段：删除临时存储的数据以回收Gas ---
        // 这是保持合约无状态和高效的关键步骤。
        for (uint256 i = 0; i < _invocationHashes.length; i++) {
            delete userParentRegistry[executor][_invocationHashes[i]];
        }
        
        // 为了完全清理 groupedInstructions，我们需要知道所有唯一的 parentId。
        // 简单起见，我们直接遍历 _instructionParentIds，重复的删除操作会被忽略。
        // 在生产环境中，可以要求传入一个唯一的 parentId 数组以优化此处的 Gas。
        for (uint256 i = 0; i < _instructionParentIds.length; i++) {
            delete userGroupedInstructions[executor][_instructionParentIds[i]];
        }
    }

    /**
     * @dev fallback 函数处理所有来自外部合约的回调。
     *      它通过 `tx.origin` 来识别原始交易发起者，并从其临时存储中查找上下文。
     *      注意：此处使用 `tx.origin` 是安全的，因为我们仅用它来定位状态，而非用于授权。
     */
    fallback() external payable {
        address initiator = tx.origin; // 识别本次交易的原始发起者
        bytes32 invocationHash = keccak256(msg.data);

        uint256 parentId = userParentRegistry[initiator][invocationHash];

        if (parentId == 0) {
            emit UnknownCallbackReceived(initiator, msg.data);
            revert("Interpreter: Unknown callback");
        }

        _executeInstructionGroup(initiator, parentId);
    }

    // --- 内部辅助函数 ---

    /**
     * @dev 内部函数，用于执行一个特定父节点ID下的所有指令。
     * @param _executor 原始交易发起者的地址
     * @param _parentId 要执行的指令组的父节点ID
     */
    function _executeInstructionGroup(address _executor, uint256 _parentId) private {
        // 使用 `storage` 关键字创建一个指向存储的指针，这比复制到内存更节省Gas
        CallInstruction[] storage callsToExecute = userGroupedInstructions[_executor][_parentId];

        for (uint256 i = 0; i < callsToExecute.length; i++) {
            CallInstruction memory currentCall = callsToExecute[i];
            bool success;

            if (currentCall.callType == CallType.CALL) {
                (success, ) = currentCall.target.call{value: currentCall.value}(currentCall.callData);
            } else if (currentCall.callType == CallType.DELEGATECALL) {
                require(currentCall.value == 0, "DELEGATECALL cannot carry value");
                (success, ) = currentCall.target.delegatecall(currentCall.callData);
            } else if (currentCall.callType == CallType.STATICCALL) {
                require(currentCall.value == 0, "STATICCALL cannot carry value");
                (success, ) = currentCall.target.staticcall(currentCall.callData);
            }

            emit InstructionExecuted(_executor, _parentId, i, success);
            require(success, "Interpreter: External call failed");
        }
    }
}
