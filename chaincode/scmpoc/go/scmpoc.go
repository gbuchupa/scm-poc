/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

/*
 * The sample smart contract for documentation topic:
 * Trade Finance Use Case - WORK IN  PROGRESS
 */

package main

import (
	//	"encoding/json"
	"encoding/json"
	"fmt"

	//	"strconv"
	//	"bytes"
	//	"time"

	"github.com/hyperledger/fabric/core/chaincode/shim"
	sc "github.com/hyperledger/fabric/protos/peer"
)

// Define the Smart Contract structure
type SmartContract struct {
}

type ASNStruct struct {
	ASNId       string `json:"asnId"`
	EDI940ID    string `json:"EDI940ID"`
	fileHash940 string `json:"fileHash940"`
	EDI945ID    string `json:"EDI945ID"`
	fileHash945 string `json:"fileHash945"`
	EDI856ID    string `json:"EDI856ID"`
	fileHash856 string `json:"fileHash856"`
}

func (s *SmartContract) Init(APIstub shim.ChaincodeStubInterface) sc.Response {
	return shim.Success(nil)
}

func (s *SmartContract) Invoke(APIstub shim.ChaincodeStubInterface) sc.Response {
	// Retrieve the requested Smart Contract function and arguments
	function, args := APIstub.GetFunctionAndParameters()
	// Route to the appropriate handler function to interact with the ledger appropriately
	if function == "submitEDI940" {
		return s.submitEDI940(APIstub, args)
	} else if function == "getEDI940" {
		return s.getEDI940(APIstub, args)
	} else if function == "submitEDI945" {
		return s.submitEDI945(APIstub, args)
	} else if function == "getEDI945" {
		return s.getEDI945(APIstub, args)
	} else if function == "submitEDI856" {
		return s.submitEDI856(APIstub, args)
	} else if function == "getEDI856" {
		return s.getEDI856(APIstub, args)
	} else if function == "submitPDF" {
		return s.submitPDF(APIstub, args)
	} else if function == "getHistory" {
		return s.getHistory(APIstub, args)
	}

	return shim.Error("Invalid Smart Contract function name.")
}

func (s *SmartContract) submitEDI940(APIstub shim.ChaincodeStubInterface, args []string) sc.Response {

	asnId := args[0]
	EDI940Id := args[1]
	fileHash := args[2]

	ICAsBytes, _ := APIstub.GetState(asnId)

	if ICAsBytes != nil {
		return shim.Error("ASN already already exists")
	}

	ASNObj := ASNStruct{ASNId: asnId, EDI940ID: EDI940Id, fileHash945: fileHash}
	ICBytes, err := json.Marshal(ASNObj)

	if err != nil {
		return shim.Error("Not able to parse values")
	}

	APIstub.PutState(asnId, ICBytes)
	fmt.Println("EDI940 Submitted -> ", ASNObj)

	return shim.Success(nil)
}

func (s *SmartContract) getEDI940(APIstub shim.ChaincodeStubInterface, args []string) sc.Response {

	asnId := args[0]

	ICAsBytes, _ := APIstub.GetState(asnId)

	return shim.Success(ICAsBytes)
}

func (s *SmartContract) submitEDI945(APIstub shim.ChaincodeStubInterface, args []string) sc.Response {
	asnId := args[0]
	EDI945Id := args[1]
	fileHash := args[2]

	ICAsBytes, _ := APIstub.GetState(asnId)

	if ICAsBytes == nil {
		return shim.Error("ASN already already exists")
	}

	ASNObj := ASNStruct{}
	err := json.Unmarshal(ICAsBytes, &ASNObj)
	if err != nil {
		return shim.Error(err.Error())
	}
	ASNObj.EDI945ID = EDI945Id
	ASNObj.fileHash945 = fileHash

	ICBytes, err := json.Marshal(ASNObj)
	if err != nil {
		return shim.Error("Not able to parse values")
	}

	APIstub.PutState(asnId, ICBytes)
	fmt.Println("EDI940 Submitted -> ", ASNObj)

	return shim.Success(nil)
}

func (s *SmartContract) getEDI945(APIstub shim.ChaincodeStubInterface, args []string) sc.Response {
	return shim.Success(nil)
}

func (s *SmartContract) submitEDI856(APIstub shim.ChaincodeStubInterface, args []string) sc.Response {
	asnId := args[0]
	EDI856Id := args[1]
	fileHash := args[2]

	ICAsBytes, _ := APIstub.GetState(asnId)

	if ICAsBytes == nil {
		return shim.Error("ASN already already exists")
	}

	ASNObj := ASNStruct{}
	err := json.Unmarshal(ICAsBytes, &ASNObj)
	if err != nil {
		return shim.Error(err.Error())
	}
	ASNObj.EDI856ID = EDI856Id
	ASNObj.fileHash856 = fileHash

	ICBytes, err := json.Marshal(ASNObj)
	if err != nil {
		return shim.Error("Not able to parse values")
	}

	APIstub.PutState(asnId, ICBytes)
	fmt.Println("EDI Submitted -> ", ASNObj)

	return shim.Success(nil)

}

func (s *SmartContract) getEDI856(APIstub shim.ChaincodeStubInterface, args []string) sc.Response {
	return shim.Success(nil)
}

func (s *SmartContract) submitPDF(APIstub shim.ChaincodeStubInterface, args []string) sc.Response {
	return shim.Success(nil)
}

func (s *SmartContract) getHistory(APIstub shim.ChaincodeStubInterface, args []string) sc.Response {
	return shim.Success(nil)
}

// The main function is only relevant in unit test mode. Only included here for completeness.
func main() {

	// Create a new Smart Contract
	err := shim.Start(new(SmartContract))
	if err != nil {
		fmt.Printf("Error creating new Smart Contract: %s", err)
	}
}
