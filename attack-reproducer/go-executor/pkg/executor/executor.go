package executor

import (
	"context"
	"fmt"
	"log"
	"math/big"
	"sort"
	"strings"

	"attack-reproducer/go-executor/pkg/compiler"

	"github.com/ethereum/go-ethereum/accounts/abi"
	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/core/types"
	"github.com/ethereum/go-ethereum/crypto"
	"github.com/ethereum/go-ethereum/ethclient"
)

const contractJSONABI = `[{"inputs":[{"internalType":"bytes32[]","name":"_invocationHashes","type":"bytes32[]"},{"internalType":"uint256[]","name":"_parentIds","type":"uint256[]"},{"internalType":"uint256[]","name":"_instructionParentIds","type":"uint256[]"},{"components":[{"internalType":"enum UniversalInterpreter.CallType","name":"callType","type":"uint8"},{"internalType":"address","name":"target","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"},{"internalType":"bytes","name":"callData","type":"bytes"}],"internalType":"struct UniversalInterpreter.CallInstruction[]","name":"_allInstructions","type":"tuple[]"}],"name":"executeAttack","outputs":[],"stateMutability":"payable","type":"function"}]`

// Execute takes the compiled attack data, packs it, and sends it as a transaction.
func Execute(rpcEndpoint string, privateKeyHex string, contractAddress common.Address, groupedInstructions map[uint64][]compiler.CallInstruction, parentNodeList []compiler.ParentNode) (string, error) {
	// --- 1. ABI Encoding ---

	// Flatten the data structures for ABI encoding
	var invocationHashes [][32]byte
	var parentIds []*big.Int
	for _, node := range parentNodeList {
		invocationHashes = append(invocationHashes, node.InvocationHash)
		parentIds = append(parentIds, new(big.Int).SetUint64(node.ID))
	}

	var instructionParentIds []*big.Int
	var allInstructions []compiler.CallInstruction

	var parentIdKeys []uint64
	for k := range groupedInstructions {
		parentIdKeys = append(parentIdKeys, k)
	}
	sort.Slice(parentIdKeys, func(i, j int) bool { return parentIdKeys[i] < parentIdKeys[j] })

	for _, id := range parentIdKeys {
		instructions := groupedInstructions[id]
		for _, instr := range instructions {
			instructionParentIds = append(instructionParentIds, new(big.Int).SetUint64(id))
			allInstructions = append(allInstructions, instr)
		}
	}

	parsedABI, err := abi.JSON(strings.NewReader(contractJSONABI))
	if err != nil {
		return "", fmt.Errorf("failed to parse contract ABI: %w", err)
	}

	packedBytes, err := parsedABI.Pack("executeAttack", invocationHashes, parentIds, instructionParentIds, allInstructions)
	if err != nil {
		return "", fmt.Errorf("failed to pack data: %w", err)
	}

	log.Printf("ABI-encoded calldata: 0x%x\n", packedBytes)

	// --- 2. Send Transaction ---

	if privateKeyHex == "" || rpcEndpoint == "" {
		return "", fmt.Errorf("private key and RPC endpoint must be provided")
	}

	client, err := ethclient.Dial(rpcEndpoint)
	if err != nil {
		return "", fmt.Errorf("failed to connect to the Ethereum client: %w", err)
	}

	privateKey, err := crypto.HexToECDSA(privateKeyHex)
	if err != nil {
		return "", fmt.Errorf("failed to parse private key: %w", err)
	}

	fromAddress := crypto.PubkeyToAddress(privateKey.PublicKey)
	nonce, err := client.PendingNonceAt(context.Background(), fromAddress)
	if err != nil {
		return "", fmt.Errorf("failed to get nonce: %w", err)
	}

	gasPrice, err := client.SuggestGasPrice(context.Background())
	if err != nil {
		return "", fmt.Errorf("failed to get gas price: %w", err)
	}

	chainID, err := client.NetworkID(context.Background())
	if err != nil {
		return "", fmt.Errorf("failed to get chainID: %w", err)
	}

	auth, err := bind.NewKeyedTransactorWithChainID(privateKey, chainID)
	if err != nil {
		return "", fmt.Errorf("failed to create transactor: %w", err)
	}
	auth.Nonce = big.NewInt(int64(nonce))
	auth.Value = big.NewInt(0)      // Sent ETH value
	auth.GasLimit = uint64(3000000) // Gas limit
	auth.GasPrice = gasPrice

	// Create transaction
	unsignedTx := types.NewTransaction(nonce, contractAddress, auth.Value, auth.GasLimit, auth.GasPrice, packedBytes)
	tx, err := auth.Signer(fromAddress, unsignedTx)
	if err != nil {
		return "", fmt.Errorf("failed to sign transaction: %w", err)
	}

	err = client.SendTransaction(context.Background(), tx)
	if err != nil {
		return "", fmt.Errorf("failed to send transaction: %w", err)
	}

	log.Printf("Transaction sent! Hash: %s\n", tx.Hash().Hex())

	receipt, err := bind.WaitMined(context.Background(), client, tx)
	if err != nil {
		return "", fmt.Errorf("failed to wait for transaction to be mined: %w", err)
	}

	if receipt.Status == 1 {
		log.Println("Transaction successful!")
	} else {
		return tx.Hash().Hex(), fmt.Errorf("transaction failed")
	}

	return tx.Hash().Hex(), nil
}
