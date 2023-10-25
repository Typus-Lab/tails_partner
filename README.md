# tails_partner

### Get PartnetKey from Typus Team

`export TAILS_PARTNER_KEY=<object_id>`

### Publish your example (or just using your own package)

`export REGISTRY=0x9b5772c50b5ecc4e8452700001b67a67132b5621fbbfa0a7cc2a781c6d5fb335`
`export PACKAGE=0x95c958ce771ea5f72e21e443a09dcb8c5ff0e74682c95b5632987039c17c1bed`

### Typus Registry on Testnet

`export TYPUS_REGISTRY=0xab38e28deede7c50995b8d97bf19f69543e850fc34265e13a8021b7e85845e80`

### Store PartnetKey

`sui client call --package $PACKAGE --module example --function add_tails_partner_key --args $REGISTRY $TAILS_PARTNER_KEY --gas-budget 1000000000`

### Run example_1 (with nft staking already)

`sui client call --package $PACKAGE --module example --function example_1 --args $REGISTRY $TYPUS_REGISTRY --gas-budget 1000000000`

### Success Result

https://suiexplorer.com/txblock/7N8YhidGiwphkXfcgh51KQo1LcAapbNFoNHXuQFiYuU7?network=testnet
