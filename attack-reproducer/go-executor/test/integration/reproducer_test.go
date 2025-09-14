package integration

import (
	"context"
	"encoding/json"
	"io/ioutil"
	"log"
	"os/exec"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	"attack-reproducer/go-executor/pkg/compiler"
	"attack-reproducer/go-executor/pkg/executor"
	"attack-reproducer/go-executor/pkg/utils"

	"github.com/ethereum/go-ethereum/accounts/abi"
	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/crypto"
	"github.com/ethereum/go-ethereum/ethclient"
)

const (
	hardhatNodeURL = "http://127.0.0.1:8545"
	// testFixturePath will be calculated dynamically.
	// contractArtifactPath will be calculated dynamically.
	testPrivateKey = "ac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80"
)

var (
	historicalAttacker    = common.HexToAddress("0xdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef")
	placeholderBotAddress = common.HexToAddress("0x0000000000000000000000000000000000000000")
	contractArtifactPath  = ""
	testFixturePath       = ""
)

func TestMain(m *testing.M) {
	// Dynamically set the project root and artifact path.
	_, b, _, _ := runtime.Caller(0)
	basepath := filepath.Dir(b)
	// go-executor/test/integration -> go-executor -> root
	projectRoot := filepath.Join(basepath, "..", "..", "..")
	contractArtifactPath = filepath.Join(projectRoot, "artifacts", "contract", "UniversalInterpreter.sol", "UniversalInterpreter.json")
	testFixturePath = filepath.Join(projectRoot, "go-executor", "test", "fixtures", "historical_attack.json")

	m.Run()
}

func TestReproducerIntegration(t *testing.T) {
	t.Log("Setting up test environment: starting Hardhat node...")
	cmd, err := startHardhatNode()
	if err != nil {
		t.Fatalf("Failed to start Hardhat node: %v", err)
	}
	defer func() {
		t.Log("Tearing down test environment: stopping Hardhat node...")
		if err := stopProcess(cmd); err != nil {
			t.Errorf("Failed to stop Hardhat node: %v", err)
		}
	}()

	time.Sleep(10 * time.Second)

	t.Log("Deploying UniversalInterpreter contract...")
	client, err := ethclient.Dial(hardhatNodeURL)
	if err != nil {
		t.Fatalf("Failed to connect to Hardhat node: %v", err)
	}

	ourBotAddress, err := deployContract(client)
	if err != nil {
		t.Fatalf("Failed to deploy contract: %v", err)
	}
	t.Logf("Contract deployed at: %s", ourBotAddress.Hex())

	t.Log("Preparing attack data...")
	originalJSON, err := ioutil.ReadFile(testFixturePath)
	if err != nil {
		t.Fatalf("Failed to read test fixture: %v", err)
	}

	privateKey, _ := crypto.HexToECDSA(testPrivateKey)
	testAddress := crypto.PubkeyToAddress(privateKey.PublicKey)

	modifiedJSON, err := utils.ReplaceAttackerAddress(originalJSON, historicalAttacker, testAddress)
	if err != nil {
		t.Fatalf("Failed to replace attacker address: %v", err)
	}
	modifiedJSON, err = utils.ReplaceAttackerAddress(modifiedJSON, placeholderBotAddress, ourBotAddress)
	if err != nil {
		t.Fatalf("Failed to replace bot address: %v", err)
	}
	t.Log("Attack data prepared successfully.")

	t.Log("Compiling and executing attack...")
	groupedInstructions, parentNodeList, err := compiler.Compile(modifiedJSON, ourBotAddress)
	if err != nil {
		t.Fatalf("Failed to compile attack data: %v", err)
	}

	txHash, err := executor.Execute(hardhatNodeURL, testPrivateKey, ourBotAddress, groupedInstructions, parentNodeList)
	if err != nil {
		t.Fatalf("Failed to execute transaction: %v", err)
	}

	t.Logf("Transaction sent with hash: %s. Waiting for receipt...", txHash)
	receipt, err := client.TransactionReceipt(context.Background(), common.HexToHash(txHash))
	if err != nil {
		t.Fatalf("Failed to get transaction receipt: %v", err)
	}

	if receipt.Status != 1 {
		t.Errorf("Expected transaction to succeed, but it failed. Status: %d", receipt.Status)
	} else {
		t.Log("✅ Assertion successful: Transaction was mined and succeeded!")
	}
}

func startHardhatNode() (*exec.Cmd, error) {
	// Dynamically set the project root for hardhat.
	_, b, _, _ := runtime.Caller(0)
	basepath := filepath.Dir(b)
	projectRoot := filepath.Join(basepath, "..", "..", "..")

	cmd := exec.Command("npx", "hardhat", "node")
	cmd.Dir = projectRoot
	err := cmd.Start()
	return cmd, err
}

func deployContract(client *ethclient.Client) (common.Address, error) {
	artifact, err := ioutil.ReadFile(contractArtifactPath)
	if err != nil {
		return common.Address{}, err
	}
	var contractData struct {
		ABI      json.RawMessage `json:"abi"`
		Bytecode string          `json:"bytecode"`
	}
	if err := json.Unmarshal(artifact, &contractData); err != nil {
		return common.Address{}, err
	}
	parsedABI, err := abi.JSON(strings.NewReader(string(contractData.ABI)))
	if err != nil {
		return common.Address{}, err
	}
	bytecode := common.FromHex(contractData.Bytecode)

	privateKey, err := crypto.HexToECDSA(testPrivateKey)
	if err != nil {
		return common.Address{}, err
	}
	chainID, err := client.NetworkID(context.Background())
	if err != nil {
		return common.Address{}, err
	}
	auth, err := bind.NewKeyedTransactorWithChainID(privateKey, chainID)
	if err != nil {
		return common.Address{}, err
	}
	auth.GasLimit = uint64(3000000)
	auth.GasPrice, _ = client.SuggestGasPrice(context.Background())

	address, tx, _, err := bind.DeployContract(auth, parsedABI, bytecode, client)
	if err != nil {
		return common.Address{}, err
	}

	log.Printf("Contract deployment transaction sent: %s", tx.Hash().Hex())
	_, err = bind.WaitMined(context.Background(), client, tx)
	if err != nil {
		return common.Address{}, err
	}

	return address, nil
}
