// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelfDestructingContract {
    function collect() public payable returns(uint) {
        return address(this).balance;
    }

    function selfDestroy() public {
    address payable addr = payable(0x20f27567430D76F03f333CBa8E59e930c780025E);
    selfdestruct(addr);
}
}