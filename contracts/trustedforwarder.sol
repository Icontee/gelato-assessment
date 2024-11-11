// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TrustedForwarder {
    mapping(address => uint256) private _nonces;

    function getNonce(address from) public view returns (uint256) {
        return _nonces[from];
    }

    function forward(
        address to,
        bytes calldata data,
        uint256 nonce,
        bytes calldata signature
    ) external returns (bytes memory) {
        require(verify(from, nonce, signature), "Invalid signature");

        // Increment nonce for replay protection
        _nonces[from]++;

        // Forward the call
        (bool success, bytes memory returnData) = to.call(data);
        require(success, "Call failed");

        return returnData;
    }

    function verify(
        address from,
        uint256 nonce,
        bytes calldata signature
    ) internal view returns (bool) {
        // Implement signature verification logic here
        // This typically involves recovering the signer from the signature
    }
}
