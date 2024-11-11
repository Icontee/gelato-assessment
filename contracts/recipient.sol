// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@gelatonetwork/relay-context/contracts/ERC2771Recipient.sol";

contract MyRecipient is ERC2771Recipient {
    uint256 public counter;

    constructor(address trustedForwarder) {
        _setTrustedForwarder(trustedForwarder);
    }

    function increment() external {
        // Use _msgSender() instead of msg.sender to get the original sender's address
        counter++;
    }

    function getCounter() external view returns (uint256) {
        return counter;
    }
}
