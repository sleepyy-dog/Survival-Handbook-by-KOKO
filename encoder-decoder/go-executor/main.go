package main

import (
	"context"
	"fmt"
	"io/ioutil"
	"log"
	"math/big"
	"strings"

	"github.com/ethereum/go-ethereum/accounts/abi"
	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/core/types"
	"github.com/ethereum/go-ethereum/crypto"
	"github.com/ethereum/go-ethereum/ethclient"
)

const contractJSONABI = `[{"inputs":[{"internalType":"bytes32[]","name":"_invocationHashes","type":"bytes32[]"},{"internalType":"uint256[]","name":"_parentIds","type":"uint256[]"},{"internalType":"uint256[]","name":"_instructionParentIds","type":"uint256[]"},{"components":[{"internalType":"enum UniversalInterpreter.CallType","name":"callType","type":"uint8"},{"internalType":"address","name":"target","type":"address"},{"internalType":"uint256","name":"value","type":"uint256"},{"internalType":"bytes","name":"callData","type":"bytes"}],"internalType":"struct UniversalInterpreter.CallInstruction[]","name":"_allInstructions","type":"tuple[]"}],"name":"executeAttack","outputs":[],"stateMutability":"payable","type":"function"}]`

func main() {
	// --- 1. Read and Compile ---
	botAddress := common.HexToAddress("0xdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef")

	jsonData, err := ioutil.ReadFile("attack.json")
	if err != nil {
		log.Fatalf("Failed to read attack.json: %v", err)
	}

	groupedInstructions, parentNodeList, err := Compile(jsonData, botAddress)
	if err != nil {
		log.Fatalf("Failed to compile attack data: %v", err)
	}

	// --- 2. ABI Encoding ---

	// Flatten the data structures for ABI encoding
	var invocationHashes [][32]byte
	var parentIds []*big.Int
	for _, node := range parentNodeList {
		invocationHashes = append(invocationHashes, node.InvocationHash)
		parentIds = append(parentIds, new(big.Int).SetUint64(node.ID))
	}

	var instructionParentIds []*big.Int
	var allInstructions []CallInstruction
	// Iterate sorted keys for deterministic output

	var parentIdKeys []uint64
	for k := range groupedInstructions {
		parentIdKeys = append(parentIdKeys, k)
	}
	// sort.Slice(parentIdKeys, func(i, j int) bool { return parentIdKeys[i] < parentIdKeys[j] })

	for _, id := range parentIdKeys {
		instructions := groupedInstructions[id]
		for _, instr := range instructions {
			instructionParentIds = append(instructionParentIds, new(big.Int).SetUint64(id))
			allInstructions = append(allInstructions, instr)
		}
	}

	parsedABI, err := abi.JSON(strings.NewReader(contractJSONABI))
	if err != nil {
		log.Fatalf("Failed to parse contract ABI: %v", err)
	}

	packedBytes, err := parsedABI.Pack("executeAttack", invocationHashes, parentIds, instructionParentIds, allInstructions)
	if err != nil {
		log.Fatalf("Failed to pack data: %v", err)
	}

	fmt.Printf("ABI-encoded calldata: 0x%x\n", packedBytes)

	// --- 3. Send Transaction ---

	// Replace with your details
	privateKeyHex := "ac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80" // e.g. "ac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"
	rpcEndpoint := "http://127.0.0.1:8545"                                              // e.g. "http://127.0.0.1:8545"
	contractAddress := common.HexToAddress("0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0")

	if privateKeyHex == "YOUR_PRIVATE_KEY" {
		log.Println("--- SKIPPING TRANSACTION SEND ---")
		log.Println("Please replace YOUR_PRIVATE_KEY, YOUR_RPC_ENDPOINT and YOUR_CONTRACT_ADDRESS in main.go")
		return
	}

	client, err := ethclient.Dial(rpcEndpoint)
	if err != nil {
		log.Fatalf("Failed to connect to the Ethereum client: %v", err)
	}

	privateKey, err := crypto.HexToECDSA(privateKeyHex)
	if err != nil {
		log.Fatalf("Failed to parse private key: %v", err)
	}

	fromAddress := crypto.PubkeyToAddress(privateKey.PublicKey)
	nonce, err := client.PendingNonceAt(context.Background(), fromAddress)
	if err != nil {
		log.Fatalf("Failed to get nonce: %v", err)
	}

	gasPrice, err := client.SuggestGasPrice(context.Background())
	if err != nil {
		log.Fatalf("Failed to get gas price: %v", err)
	}

	chainID, err := client.NetworkID(context.Background())
	if err != nil {
		log.Fatalf("Failed to get chainID: %v", err)
	}

	auth, err := bind.NewKeyedTransactorWithChainID(privateKey, chainID)
	if err != nil {
		log.Fatalf("Failed to create transactor: %v", err)
	}
	auth.Nonce = big.NewInt(int64(nonce))
	auth.Value = big.NewInt(0)      // Sent ETH value
	auth.GasLimit = uint64(3000000) // Gas limit
	auth.GasPrice = gasPrice

	// Create transaction
	unsignedTx := types.NewTransaction(nonce, contractAddress, auth.Value, auth.GasLimit, auth.GasPrice, packedBytes)
	tx, err := auth.Signer(fromAddress, unsignedTx)
	if err != nil {
		log.Fatalf("Failed to sign transaction: %v", err)
	}

	err = client.SendTransaction(context.Background(), tx)
	if err != nil {
		log.Fatalf("Failed to send transaction: %v", err)
	}

	fmt.Printf("Transaction sent! Hash: %s\n", tx.Hash().Hex())

	receipt, err := bind.WaitMined(context.Background(), client, tx)
	if err != nil {
		log.Fatalf("Failed to wait for transaction to be mined: %v", err)
	}

	if receipt.Status == 1 {
		fmt.Println("Transaction successful!")
	} else {
		fmt.Println("Transaction failed!")
	}
}
