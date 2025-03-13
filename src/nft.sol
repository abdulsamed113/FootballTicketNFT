// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.1.0) (token/ERC721/ERC721.sol)

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFT is ERC721 {
    uint256 private  s_tokenCounter;

    constructor() ERC721("Tutankhamun", "TUT") {
        s_tokenCounter = 0;
    }
}
