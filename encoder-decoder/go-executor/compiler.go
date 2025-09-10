package main

import (
	"crypto/sha256"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"math/big"
	"reflect"

	"github.com/ethereum/go-ethereum/common"
	"golang.org/x/crypto/sha3"
)

// CallType mirrors the Solidity enum
type CallType uint8

const (
	CALL CallType = iota
	DELEGATECALL
	STATICCALL
)

// CallInstruction mirrors the Solidity struct
type CallInstruction struct {
	CallType CallType       `json:"callType"`
	Target   common.Address `json:"target"`
	Value    *big.Int       `json:"value"`
	CallData []byte         `json:"callData"`
}

// JSONCall represents a single call from the input JSON
type JSONCall struct {
	Hierarchy   []int          `json:"hierarchy"`
	CallTypeStr string         `json:"call_type"`
	From        common.Address `json:"from"`
	Target      common.Address `json:"target"`
	ValueStr    string         `json:"value"`
	CallDataStr string         `json:"calldata"`
}

// AttackTrace represents the root of the input JSON
type AttackTrace struct {
	BotContractAddress common.Address `json:"bot_contract_address"`
	Calls              []JSONCall     `json:"calls"`
}

// ParentNode stores information about a node that is a parent (i.e., receives a callback)
type ParentNode struct {
	HierarchyPath []int
	InvocationHash [32]byte
	ID            uint64
}

// Compile processes the attack trace and generates the parent node list and grouped instructions.
func Compile(jsonData []byte, botAddress common.Address) (map[uint64][]CallInstruction, []ParentNode, error) {
	var trace AttackTrace
	if err := json.Unmarshal(jsonData, &trace); err != nil {
		return nil, nil, fmt.Errorf("failed to unmarshal json: %w", err)
	}
	
	botAddress = trace.BotContractAddress

	parentNodeList := []ParentNode{}
	groupedInstructions := make(map[uint64][]CallInstruction)
	parentIdCounter := uint64(1)

	// Add the main execution flow as the root parent
	parentNodeList = append(parentNodeList, ParentNode{
		HierarchyPath: []int{},
		InvocationHash: [32]byte{}, // Special value for main execution
		ID:            parentIdCounter,
	})
	groupedInstructions[parentIdCounter] = []CallInstruction{}
	parentIdCounter++

	// First pass: Identify all parent nodes
	for _, call := range trace.Calls {
		if call.Target == botAddress && len(call.Hierarchy) > 0 { // len > 0 to exclude the initial call to the bot
			calldata, err := hex.DecodeString(call.CallDataStr[2:])
			if err != nil {
				return nil, nil, fmt.Errorf("failed to decode calldata for hierarchy %v: %w", call.Hierarchy, err)
			}
			
			hash := keccak256(calldata)
			
			parentNodeList = append(parentNodeList, ParentNode{
				HierarchyPath: call.Hierarchy,
				InvocationHash: hash,
				ID:            parentIdCounter,
			})
			groupedInstructions[parentIdCounter] = []CallInstruction{}
			parentIdCounter++
		}
	}
	
	// Second pass: Assign instructions to their parent
	for _, call := range trace.Calls {
		if call.From == botAddress {
			parentHierarchy := []int{}
			if len(call.Hierarchy) > 1 {
				parentHierarchy = call.Hierarchy[:len(call.Hierarchy)-1]
			}
			
			var parentID uint64
			found := false
			for _, pNode := range parentNodeList {
				if reflect.DeepEqual(pNode.HierarchyPath, parentHierarchy) {
					parentID = pNode.ID
					found = true
					break
				}
			}

			if !found {
				return nil, nil, fmt.Errorf("could not find parent for instruction with hierarchy %v", call.Hierarchy)
			}

			// Create CallInstruction
			var ct CallType
			switch call.CallTypeStr {
			case "CALL":
				ct = CALL
			case "DELEGATECALL":
				ct = DELEGATECALL
			case "STATICCALL":
				ct = STATICCALL
			default:
				return nil, nil, fmt.Errorf("unknown call type: %s", call.CallTypeStr)
			}

			value := new(big.Int)
			value.SetString(call.ValueStr, 10)

			callData, err := hex.DecodeString(call.CallDataStr[2:])
			if err != nil {
				return nil, nil, fmt.Errorf("failed to decode calldata for instruction %v: %w", call.Hierarchy, err)
			}
			
			instruction := CallInstruction{
				CallType: ct,
				Target:   call.Target,
				Value:    value,
				CallData: callData,
			}
			
			groupedInstructions[parentID] = append(groupedInstructions[parentID], instruction)
		}
	}

	return groupedInstructions, parentNodeList, nil
}


func keccak256(data []byte) [32]byte {
    hasher := sha3.NewLegacyKeccak256()
    hasher.Write(data)
    var hash [32]byte
    hasher.Sum(hash[:0])
    return hash
}
