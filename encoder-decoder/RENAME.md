# 代码架构

主题：关于区块链链上解码的代码设计 代码语言：链下使用go,链上使用solidity

背景：我正在参与一个智能合约安全项目。我的上游项目 Midas 是一个强大的模糊测试工具，它能够自动化地发现智能合约中的漏洞。当 Midas 发现一个漏洞时，它会生成导致该漏洞的一系列交易调用步骤（Input Sequence）。

目前，Midas 将这个攻击序列包装成一个供人类阅读和执行的 Solidity 测试脚本 (.t.sol 文件)。

核心目标：是将这种多步骤的、手动的攻击复现过程，转变为单笔交易内自动化的原子操作。

具体来说，我需要：

1. 定义数据格式：设计一种标准化的 JSON 格式，用来精确描述 Midas 发现的攻击序列（即 Input Sequence）。

1. 实现执行引擎：开发一个链上 Bot 合约。这个合约能够接收并解析上述 JSON 格式的数据，然后在一笔交易（a single transaction）内，按顺序执行完整个攻击序列中的所有步骤。

最终实现的效果是：Midas 发现漏洞后，可以直接输出一个 JSON 文件，您的 Bot 合约拿到这个文件后，就能在链上立即、原子化地复现整个攻击。

## json定义

### 包含字段

*   **`bot_contract_address`** (`string`)
    *   **描述**: 执行此次攻击序列的 Bot 合约的地址。这是整个操作的起点。
    *   **示例**: `"0x1234567890123456789012345678901234567890"`

*   **`attack_name`** (`string`, 可选)
    *   **描述**: 本次攻击的一个人类可读的名称，方便归档和识别。
    *   **示例**: `"Re-entrancy attack on SimpleBank"`

*   **`calls`** (`array`)
    *   **描述**: 一个对象数组，包含了本次攻击需要执行的所有调用步骤，**严格按照执行顺序列出**。 

#### `calls` 数组中每个对象的结构

* **`hierarchy`** (`array of integers`)

  * **描述**: **调用层次**。它是一个表示当前调用在整个逻辑调用树中位置的路径。

    

    *   `[]`表示发起bot合约中的主函数的调用。
    *   `[1]` 表示第一个顶层调用。
    *   `[2]` 表示第二个顶层调用。
    *   `[2, 1]` 表示在第二个顶层调用的执行过程中引发的第一个子调用（例如在 fallback 中触发的调用）。
    *   `[2, 2]` 表示第二个顶层调用执行中引发的第二个子调用。

  * **作用**: 这个字段对于您的 Bot 合约至关重要，它可以帮助 Bot 理解当前执行的上下文，尤其是在处理重入等需要回调的复杂场景时。

* **`call_type`** (`string`)

  *   **描述**: 调用的 EVM 操作码类型。
  *   **可能的值**:
      *   `"CALL"`: 标准的外部调用。
      *   `"STATICCALL"`: 不会修改状态的调用。
      *   `"DELEGATECALL"`: 代理调用。
  *   **示例**: `"CALL"`

* **`from`** (`string`)

  *   **描述**: 本次调用的发起合约地址。
  *   **示例**: `"0xaabbccddeeffaabbccddeeffaabbccddeeffaabbcc"`

* **`target`** (`string`)

  *   **描述**: 本次调用的目标合约地址。
  *   **示例**: `"0xaabbccddeeffaabbccddeeffaabbccddeeffaabbcc"`

* **`value`** (`string`)

  *   **描述**: 本次调用所发送的以太币数量，**单位为 wei**。使用字符串格式以避免大数精度问题。
  *   **示例**: `"1000000000000000000"` (代表 1 ETH)

* **`calldata`** (`string`)

  *   **描述**: 完整的十六进制调用数据，以 `0x` 开头。它包含了 4 字节的函数选择器（function selector）和所有 ABI 编码后的参数。您的 Bot 合约可以直接使用这个数据发起调用，无需再进行编码。
  *   **示例**: `"0xa9059cbb000000000000000000000000deadbeefdeadbeefdeadbeefdeadbeefdeadbeef0000000000000000000000000000000000000000000000000000000000000001"` (代表 `transfer(address,uint256)`)

---

### 完整示例：一个典型的闪电贷 JSON

这个流程的 JSON 脚本如下：

```json
{
  "attack_name": "Aave Flashloan Arbitrage on Uniswap",
  "bot_contract_address": "0xdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef",
  "calls": [
    {
      "hierarchy": [],
      "call_type": call, 
      "target": "0xbotaddress...",
      "from": "address。。。。",
      "value": "0",
      "calldata":data......  
    },
    {
      "hierarchy": [1],
      忽略
    },
    {
      "hierarchy": [2],
	  忽略
    },
    {
      "hierarchy": [2, 1],
      忽略
    },
    {
      "hierarchy": [2, 1, 1],
      忽略
    },
    {
      "hierarchy": [2, 1, 2],
      忽略
    },
    {
      "hierarchy": [2, 1, 3],
      忽略
    },
    {
      "hierarchy": [3],
      忽略
    }
  ]
}
```

Bot 合约的执行逻辑将是:

1. 收到外部调用 []，启动执行引擎。
2. 按顺序查找 hierarchy 为 [1] 的动作，发现是 OUTBOUND，执行它。
3. 查找 [2]，发现是 OUTBOUND，执行它（调用 Aave 的 flashLoan）。
4. 此时 Bot 的控制权交给了 Aave 合约。
5. Aave 合约回调 Bot，Bot 捕获到这个 INBOUND 调用。
6. Bot 进入回调上下文，开始执行 hierarchy 前缀为 [2, 1] 的子序列：[2, 1, 1], [2, 1, 2], [2, 1, 3]。
7. 回调函数执行完毕并返回 true 给 Aave。
8. Aave 的 flashLoan 函数执行完毕，控制权交还给 Bot。
9. Bot 从中断处继续执行，查找 hierarchy: [3] 的动作，并执行。
10. 所有步骤执行完毕，整个交易结束。

## 单个调用的编码示例

发送给链上的单个调用的所有信息由CallInstruction结构体储存。

```go
// CallInstruction 是Solidity CallInstruction struct在Go语言中的镜像
type CallInstruction struct {
	CallType CallType       `json:"callType"`
	Target   common.Address `json:"target"`
	Value    *big.Int       `json:"value"`
	CallData []byte         `json:"callData"`
}
```

## 完整编码思路：

### 第一阶段：链下编码（“编译器”）

此阶段的目标是读取完整的交易 `trace`，并将其“编译”成两份核心数据，再转化为编码提供给链上合约使用。

**输入：** 完整的交易 `trace` 记录 (例如 [],[1],[2],[2,1],[2,1,1],[2,1,2],[2,1,3],[2,2],[2,2,1],[2,2,2],[2,2,3],[3])
**输出：**

1.  **父节点注册表数据**: 一个包含 `{调用哈希, 父节点ID}` 的键值对列表。
2.  **分组指令集**: 一个以 `父节点ID` 为键，`指令数组` 为值的集合。

**编码流程：**

1. **初始化:**

   *   创建一个临时的“父节点列表”：`parentNodeList = []`。
   *   创建一个用于存储最终结果的“分组指令集”：`groupedInstructions = {}`。
   *   初始化一个父节点ID计数器：`parentIdCounter = 1`。
   *   我们将主函数执行流程定义为第一个父节点，其ID固定为 `1`。
   *   将主流程（`[]`）作为第一个父节点加入列表。它的调用哈希是一个特殊值，比如 `bytes32(0)`。
       *   `parentNodeList.push({ 层次路径: [], 调用哈希: bytes32(0), ID: 1 })`
       *   `groupedInstructions[1] = []` // 为主流程准备一个空的指令数组
       *   `parentIdCounter++` // 计数器变为 2，为下一个父节点做准备

2. **第一遍遍历 - 识别所有父节点:**

   *   完整遍历一次 `trace`。
   *   如果一个调用的 `被调用合约` （target）是我们的Bot合约，那么这个调用就是一个“父节点”。
   *   计算这个调用的 `调用哈希 = keccak256(调用的input数据)`。
   *   从 `parentIdCounter` 分配一个全新的、唯一的ID给它。
   *   将这个父节点的信息（层次路径、调用哈希、ID）加入到 `parentNodeList` 中。
   *   在 `groupedInstructions` 中，为这个新的父节点ID创建一个空的指令数组：`groupedInstructions[ID] = []`。
   *   `parentIdCounter` 自增。

   *以[],[1],[2],[2,1],[2,1,1],[2,1,2],[2,1,3],[2,2],[2,2,1],[2,2,2],[2,2,3],[3]为例，此步骤结束后 `parentNodeList` 会是：*

   *   `{ 层次路径: [], 调用哈希: 0x0..., ID: 1 }`
   *   `{ 层次路径: [2,1], 调用哈希: keccak256(data_of_[2,1]), ID: 2 }`
   *   `{ 层次路径: [2,2], 调用哈希: keccak256(data_of_[2,2]), ID: 3 }`

3. **第二遍遍历 - 为指令分配归属:**

   *   再次完整遍历一次 `trace`。
   *   如果一个调用的 `发起合约` （from）是我们的Bot合约，那么这个调用就是一条需要编码的“指令”。
   *   **获取指令集**
       *   **定位父节点**：查看这条指令的层次路径（例如 `[2,2,2]`），找到它直接父调用的路径（即 `[2,2]`）。
       *   **查找父节点ID**：在第一步生成的 `parentNodeList` 中，查找 `层次路径` 与 `[2,2]` 匹配的条目。**获取其对应的ID**（在这个例子中是 `3`）。
       *   **创建并分组指令**：将这条指令（目标地址、金额、调用数据）打包成一个 `CallInstruction` 对象（打包方式参见单个调用编码说明），然后追加到 `groupedInstructions` 中ID为 `3` 的那个指令数组里。
           *   `groupedInstructions[3].push({ 指令信息 for [2,2,2] })`

4. **生成最终输出:**

   *   **父节点注册表数据**：从 `parentNodeList` 提取 `{调用哈希, ID}` 键值对。例如：`[{hash: 0x0..., id: 1}, {hash: hash_of_[2,1], id: 2}, {hash: hash_of_[2,2], id: 3}]`。这些数据将用于填充链上合约的 `parentRegistry` mapping。
   *   **分组指令集**：`groupedInstructions` 已经是最终形态，可以直接用于填充链上合约的 `groupedInstructions` mapping。

最后，我们需要将 父节点列表parentNodeList 和分组指令集groupedInstructions编码为十六进制编码发送到链上。

我们直接使用**ABI编码**实现将以上父节点列表parentNodeList 和分组指令集groupedInstructions转为编码上传到链上。

需要生成四个扁平数组，以储存父节点列表parentNodeList 和分组指令集groupedInstructions的信息然后ABI编码。

如下：

* `_invocationHashes`: 从 `parentNodeList` 提取所有 `调用哈希`。
* `_parentIds`: 从 `parentNodeList` 提取所有 `ID`。
* `_instructionParentIds` 和 `_allInstructions`: 遍历 `groupedInstructions` 的每个 `(id, instructions_array)` 对，对于 `instructions_array` 中的每个 `instruction`，将 `id` 添加到 `_instructionParentIds`，将 `instruction` 添加到 `_allInstructions`。

### 第二阶段：链上合约与执行（“通用解释器”）

首先我们针对刚刚的解码过程，完成**ABI解码**。

得到四个扁平数组（等价于父节点列表parentNodeList 和分组指令集groupedInstructions）。

这个版本只需要部署一次。所有的攻击数据都在一个函数调用中传入，执行完毕后会自动清理状态。

**Solidity 合约代码:**

```solidity
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
```

## 交易内容信息传输步骤

1. 多个单步骤交易
2. json
3. go中的父节点列表parentNodeList 和分组指令集groupedInstructions
4. 十六进制字符串
5. solidity中的四个扁平数组（等价于父节点列表parentNodeList 和分组指令集groupedInstructions）
6. 完整交易

## 我希望的几个环节

1. 首先需要获取json,并将其转为go中结构体CallInstruction结构体
2. 在链下依据CallInstruction结构体生成go中的父节点列表parentNodeList 和分组指令集groupedInstructions(这里的判断逻辑较为复杂,需要单个文件实现)
3. 将以上go中的父节点列表parentNodeList 和分组指令集groupedInstructions转为十六进制编码
4. 在链上将以上编码转为四个扁平数组（等价于父节点列表parentNodeList 和分组指令集groupedInstructions）
5. 部署

### 最终代码结构

```
attack-reproducer/
├── contract/
│   └── UniversalInterpreter.sol      # 链上解释器 实现环节:4 5
│
├── go-executor/
│   ├── main.go                       # Go程序主入口 (流程编排)实现环节: 1 3
│   ├── compiler.go                   # Go程序核心编译逻辑 实现环节:2
│   ├── go.mod                        # Go依赖管理
│   └── attack.json                   # 输入的攻击数据
│
├── scripts/
│   └── deploy.js                     # 合约部署脚本
│
├── hardhat.config.js                 # 部署配置文件
└── package.json                      # 项目依赖 (用于部署)
```

---

### 各部分功能详解

#### 1. `contract/` - 链上部分

*   **`UniversalInterpreter.sol` (链上解释器)**
    *   **功能**: 这是部署在区块链上的核心智能合约。它像一个小型虚拟机，接收并执行来自链下的指令。
    *   **职责**:
        *   包含一个 `executeAttack` 函数，作为执行入口。
        *   接收四个扁平数组形式的指令（由 EVM 自动从交易数据中解码得到）。
        *   根据指令，按顺序发起对其他合约的调用 (`call`)。
        *   管理执行状态，特别是处理由外部调用产生的回调（callback），并根据父节点信息继续执行后续指令。

#### 2. `go-executor/` - 链下部分

这是项目的“大脑”，负责处理所有链下逻辑。

*   **`main.go` (总指挥 / 流程编排器)**
    *   **功能**: 这是 Go 程序的入口，负责将所有步骤串联起来。
    *   **职责**:
        1.  **读取**: 读取 `attack.json` 文件，并将其内容解析到 Go 的结构体中。
        2.  **调用**: 将解析后的数据传递给 `compiler.go` 中的 `Compile` 函数，获取处理后的 `parentNodeList` 和 `groupedInstructions`。
        3.  **编码**: 将 `Compile` 函数返回的结果，通过 ABI 编码规则打包成可以发送给 `executeAttack` 函数的十六进制 `calldata`。
        4.  **发送**: 连接到以太坊节点（如 Infura, Alchemy），使用你的私钥签名，并将打包好的 `calldata` 作为交易发送给已部署的 `UniversalInterpreter` 合约。

*   **`compiler.go` (核心算法模块)**
    *   **功能**: 包含项目中最核心、最复杂的业务逻辑，但它本身是独立的、纯粹的。
    *   **职责**:
        *   接收 `main.go` 传入的原始 `CallInstruction` 列表。
        *   执行**两遍扫描算法**：
            *   第一遍：识别出所有的父节点（即会产生回调的调用）。
            *   第二遍：将所有的指令分配给正确的父节点。
        *   **输出**: 返回两个关键的数据结构：`parentNodeList` (父节点列表) 和 `groupedInstructions` (按父节点ID分组的指令集)。

*   **`attack.json` (输入数据)**
    *   **功能**: 你的原始输入，即 Midas 等工具生成的攻击序列的 JSON 文件。

#### 3. `scripts/` 和项目根目录 - 部署与配置

这部分是辅助工具，用于完成一次性的部署任务。

*   **`scripts/deploy.js` (部署工具)**
    *   **功能**: 一个简单的 JavaScript 脚本，用于将 `UniversalInterpreter.sol` 合约部署到区块链上。
    *   **职责**: 编译合约，连接到指定网络，发送部署交易，并打印出最终的合约地址。

*   **`hardhat.config.js` 和 `package.json` (项目配置)**
    *   **功能**: 为 `deploy.js` 脚本提供支持。
    *   **职责**: `package.json` 负责管理 Hardhat、Ethers.js 等依赖；`hardhat.config.js` 负责配置区块链网络信息（RPC URL）和部署者账户（私钥）。
