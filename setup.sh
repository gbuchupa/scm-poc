

echo "Creating channel genesis block.."

# Create the channel
docker exec -e "CORE_PEER_LOCALMSPID=UpsCompanyMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/upsCompany.scmpoc.com/users/Admin@upsCompany.scmpoc.com/msp" -e "CORE_PEER_ADDRESS=peer0.upsCompany.scmpoc.com:7051" cli peer channel create -o orderer.scmpoc.com:7050 -c mychannel -f /etc/hyperledger/configtx/channel.tx


#sleep 5

echo "Channel genesis block created."

echo "peer0.upsCompany.scmpoc.com joining the channel..."
# Join peer0.upsCompany.scmpoc.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=UpsCompanyMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/upsCompany.scmpoc.com/users/Admin@upsCompany.scmpoc.com/msp" -e "CORE_PEER_ADDRESS=peer0.upsCompany.scmpoc.com:7051" cli peer channel join -b mychannel.block

#echo "peer0.upsCompany.scmpoc.com joined the channel"

echo "peer1.upsCompany.scmpoc.com joining the channel..."
# Join peer1.upsCompany.scmpoc.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=UpsCompanyMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/upsCompany.scmpoc.com/users/Admin@upsCompany.scmpoc.com/msp" -e "CORE_PEER_ADDRESS=peer1.upsCompany.scmpoc.com:7051" cli peer channel join -b mychannel.block

echo "peer1.upsCompany.scmpoc.com joined the channel"


echo "peer0.mfgCompany.scmpoc.com joining the channel..."

# Join peer0.mfgCompany.scmpoc.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=MfgCompanyMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/mfgCompany.scmpoc.com/users/Admin@mfgCompany.scmpoc.com/msp" -e "CORE_PEER_ADDRESS=peer0.mfgCompany.scmpoc.com:7051" cli peer channel join -b mychannel.block

echo "peer0.mfgCompany.scmpoc.com joined the channel"

echo "peer1.mfgCompany.scmpoc.com joining the channel..."

# Join peer1.mfgCompany.scmpoc.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=MfgCompanyMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/mfgCompany.scmpoc.com/users/Admin@mfgCompany.scmpoc.com/msp" -e "CORE_PEER_ADDRESS=peer1.mfgCompany.scmpoc.com:7051" cli peer channel join -b mychannel.block

echo "peer1.mfgCompany.scmpoc.com joined the channel"

echo "peer0.openTextCompany.scmpoc.com joining the channel..."
# Join peer0.openTextCompany.scmpoc.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=OpenTextCompanyMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/openTextCompany.scmpoc.com/users/Admin@openTextCompany.scmpoc.com/msp" -e "CORE_PEER_ADDRESS=peer0.openTextCompany.scmpoc.com:7051" cli peer channel join -b mychannel.block
sleep 5

echo "peer0.openTextCompany.scmpoc.com joined the channel"

echo "peer1.openTextCompany.scmpoc.com joining the channel..."
# Join peer1.openTextCompany.scmpoc.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=OpenTextCompanyMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/openTextCompany.scmpoc.com/users/Admin@openTextCompany.scmpoc.com/msp" -e "CORE_PEER_ADDRESS=peer1.openTextCompany.scmpoc.com:7051" cli peer channel join -b mychannel.block
sleep 5

echo "peer1.openTextCompany.scmpoc.com joined the channel"

echo "Installing scmpoc chaincode to peer0.upsCompany.scmpoc.com..."

# install chaincode
# Install code on upsCompany peer
docker exec -e "CORE_PEER_LOCALMSPID=UpsCompanyMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/upsCompany.scmpoc.com/users/Admin@upsCompany.scmpoc.com/msp" -e "CORE_PEER_ADDRESS=peer0.upsCompany.scmpoc.com:7051" cli peer chaincode install -n scmpoc -v 1.0 -p github.com/scmpoc/go -l golang

echo "Installed scmpoc chaincode to peer0.upsCompany.scmpoc.com"

echo "Installing scmpoc chaincode to peer1.upsCompany.scmpoc.com..."

# install chaincode
# Install code on upsCompany peer
docker exec -e "CORE_PEER_LOCALMSPID=UpsCompanyMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/upsCompany.scmpoc.com/users/Admin@upsCompany.scmpoc.com/msp" -e "CORE_PEER_ADDRESS=peer1.upsCompany.scmpoc.com:7051" cli peer chaincode install -n scmpoc -v 1.0 -p github.com/scmpoc/go -l golang

echo "Installed scmpoc chaincode to peer1.upsCompany.scmpoc.com"


echo "Installing scmpoc chaincode to peer0.mfgCompany.scmpoc.com...."

# Install code on mfgCompany peer
docker exec -e "CORE_PEER_LOCALMSPID=MfgCompanyMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/mfgCompany.scmpoc.com/users/Admin@mfgCompany.scmpoc.com/msp" -e "CORE_PEER_ADDRESS=peer0.mfgCompany.scmpoc.com:7051" cli peer chaincode install -n scmpoc -v 1.0 -p github.com/scmpoc/go -l golang

echo "Installed scmpoc chaincode to peer0.mfgCompany.scmpoc.com"

echo "Installing scmpoc chaincode to peer1.mfgCompany.scmpoc.com...."

# Install code on mfgCompany peer
docker exec -e "CORE_PEER_LOCALMSPID=MfgCompanyMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/mfgCompany.scmpoc.com/users/Admin@mfgCompany.scmpoc.com/msp" -e "CORE_PEER_ADDRESS=peer1.mfgCompany.scmpoc.com:7051" cli peer chaincode install -n scmpoc -v 1.0 -p github.com/scmpoc/go -l golang

sleep 5

echo "Installed scmpoc chaincode to peer1.mfgCompany.scmpoc.com"

echo "Installing scmpoc chaincode to peer0.openTextCompany.scmpoc.com..."
# Install code on openTextCompany peer
docker exec -e "CORE_PEER_LOCALMSPID=OpenTextCompanyMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/openTextCompany.scmpoc.com/users/Admin@openTextCompany.scmpoc.com/msp" -e "CORE_PEER_ADDRESS=peer0.openTextCompany.scmpoc.com:7051" cli peer chaincode install -n scmpoc -v 1.0 -p github.com/scmpoc/go -l golang

sleep 5

echo "Installed scmpoc chaincode to peer0.openTextCompany.scmpoc.com"

echo "Installing scmpoc chaincode to peer1.openTextCompany.scmpoc.com..."
# Install code on openTextCompany peer
docker exec -e "CORE_PEER_LOCALMSPID=OpenTextCompanyMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/openTextCompany.scmpoc.com/users/Admin@openTextCompany.scmpoc.com/msp" -e "CORE_PEER_ADDRESS=peer1.openTextCompany.scmpoc.com:7051" cli peer chaincode install -n scmpoc -v 1.0 -p github.com/scmpoc/go -l golang

sleep 5

echo "Installed scmpoc chaincode to peer1.openTextCompany.scmpoc.com"


echo "Instantiating scmpoc chaincode.."

docker exec -e "CORE_PEER_LOCALMSPID=UpsCompanyMSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/upsCompany.scmpoc.com/users/Admin@upsCompany.scmpoc.com/msp" -e "CORE_PEER_ADDRESS=peer0.upsCompany.scmpoc.com:7051" cli peer chaincode instantiate -o orderer.scmpoc.com:7050 -C mychannel -n scmpoc -l golang -v 1.0 -c '{"Args":[""]}' -P "OR ('UpsCompanyMSP.member','MfgCompanyMSP.member','OpenTextCompanyMSP.member')"

sleep 10

echo "Instantiated scmpoc chaincode."

echo "Following is the docker network....."

docker ps
