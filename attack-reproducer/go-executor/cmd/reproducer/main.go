package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"os"

	"attack-reproducer/go-executor/pkg/compiler"
	"attack-reproducer/go-executor/pkg/executor"

	"github.com/ethereum/go-ethereum/common"
)

func main() {
	jsonFilePath := flag.String("json", "", "Path to the attack.json file")
	rpcEndpoint := flag.String("rpc", "http://127.0.0.1:8545", "RPC endpoint of the Ethereum node")
	privateKey := flag.String("pk", "", "Private key to send the transaction")
	flag.Parse()

	if *jsonFilePath == "" {
		log.Println("Error: -json flag is required")
		flag.Usage()
		os.Exit(1)
	}
	if *privateKey == "" {
		log.Println("Error: -pk flag is required")
		flag.Usage()
		os.Exit(1)
	}

	// --- 1. Read and Compile ---
	log.Println("Reading and compiling attack data...")
	jsonData, err := ioutil.ReadFile(*jsonFilePath)
	if err != nil {
		log.Fatalf("Failed to read attack json file: %v", err)
	}

	botAddress, err := extractBotAddress(jsonData)
	if err != nil {
		log.Fatalf("Failed to extract bot address from json: %v", err)
	}

	groupedInstructions, parentNodeList, err := compiler.Compile(jsonData, botAddress)
	if err != nil {
		log.Fatalf("Failed to compile attack data: %v", err)
	}
	log.Println("Compilation successful.")

	// --- 2. Execute Transaction ---
	log.Printf("Executing transaction via %s...", *rpcEndpoint)
	txHash, err := executor.Execute(*rpcEndpoint, *privateKey, botAddress, groupedInstructions, parentNodeList)
	if err != nil {
		log.Fatalf("Failed to execute transaction: %v", err)
	}

	log.Printf("Transaction successfully sent. Hash: %s\n", txHash)
}

func extractBotAddress(jsonData []byte) (common.Address, error) {
	var data map[string]interface{}
	if err := json.Unmarshal(jsonData, &data); err != nil {
		return common.Address{}, err
	}

	addressStr, ok := data["bot_contract_address"].(string)
	if !ok {
		return common.Address{}, fmt.Errorf("bot_contract_address not found or not a string in json")
	}

	return common.HexToAddress(addressStr), nil
}
