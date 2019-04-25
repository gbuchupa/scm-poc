## Prerequisits for machine setup
1. Run download_dependencies.sh to fetch docker fabric images, golang, etc..,

## CA certificate generation and docker changes
*** In this usecase CA's are already generated. 

The generation Certificates are part of, creation of genesis block are in script generate.sh. We **do not have to run** the script (as it is already done and comitted).

## Start the Hyperledger Fabric Network 

1. cd scm-poc
2. ./start.sh (with this you will start docker-compose.yml up -d )

## Setup the Hyperledger Fabric Network

1. cd scm-poc
2. ./setup.sh (With this you will create the channel genesis block, add the peer0 to the channel created and instantiate chaincode.) 

## Chaincode changes
Basic chain code is compiled and comitted.

Compiling chain code:
1. Changes the chaincode in /home/paperspace/scm-poc/chaincode/scmpoc/go
2. Compile using command : go build
  - In case of shim error, follow instructions as per https://www.edureka.co/community/29076/hyperledger-cannot-compile-chaincode-cannot-package-error
    $ cd $GOPATH/src/github.com
    $ mkdir hyperledger
    $ cd hyperledger
    $ git clone http://gerrit.hyperledger.org/r/fabric.git

## Stop the network

1. cd scm-poc
2. ./stop.sh



