rm -R crypto-config/*

/home/paperspace/scm-poc/bin/cryptogen generate --config=crypto-config.yaml

rm config/*

/home/paperspace/scm-poc/bin/configtxgen -profile ProperTOrgOrdererGenesis -outputBlock ./config/genesis.block

/home/paperspace/scm-poc/bin/configtxgen -profile ProperTOrgChannel -outputCreateChannelTx ./config/channel.tx -channelID mychannel
