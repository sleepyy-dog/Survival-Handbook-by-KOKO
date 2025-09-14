package utils

import (
	"bytes"
	"encoding/json"
	"fmt"
	"strings"

	"github.com/ethereum/go-ethereum/common"
)

// ReplaceAttackerAddress traverses a JSON byte slice representing an attack trace,
// and replaces all occurrences of an old address with a new address.
// This includes the 'bot_contract_address', 'from' fields, and occurrences
// within 'calldata' strings.
func ReplaceAttackerAddress(jsonData []byte, oldAddress common.Address, newAddress common.Address) ([]byte, error) {
	var data map[string]interface{}
	if err := json.Unmarshal(jsonData, &data); err != nil {
		return nil, fmt.Errorf("failed to unmarshal json: %w", err)
	}

	oldAddrStr := strings.ToLower(oldAddress.Hex()[2:])
	newAddrStr := strings.ToLower(newAddress.Hex()[2:])

	// Replace top-level bot_contract_address
	if botAddr, ok := data["bot_contract_address"].(string); ok {
		if common.HexToAddress(botAddr) == oldAddress {
			data["bot_contract_address"] = newAddress.Hex()
		}
	}

	// Replace fields within the 'calls' array
	if calls, ok := data["calls"].([]interface{}); ok {
		for _, callInterface := range calls {
			if call, ok := callInterface.(map[string]interface{}); ok {
				// Replace 'from' address
				if fromAddr, ok := call["from"].(string); ok {
					if common.HexToAddress(fromAddr) == oldAddress {
						call["from"] = newAddress.Hex()
					}
				}
				// Replace 'target' address
				if targetAddr, ok := call["target"].(string); ok {
					if common.HexToAddress(targetAddr) == oldAddress {
						call["target"] = newAddress.Hex()
					}
				}

				// Replace address within 'calldata'
				if calldata, ok := call["calldata"].(string); ok {
					// Ensure case-insensitive replacement for hex strings
					calldata = "0x" + strings.Replace(strings.ToLower(calldata[2:]), oldAddrStr, newAddrStr, -1)
					call["calldata"] = calldata
				}
			}
		}
	}

	// Marshal back to JSON. Use an encoder to prevent HTML escaping.
	var buf bytes.Buffer
	enc := json.NewEncoder(&buf)
	enc.SetEscapeHTML(false)
	if err := enc.Encode(data); err != nil {
		return nil, fmt.Errorf("failed to marshal json: %w", err)
	}

	// The encoder adds a newline, which we trim.
	return bytes.TrimSpace(buf.Bytes()), nil
}
