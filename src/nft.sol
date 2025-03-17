// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract NFT is ERC721, Ownable {
    error BasicNft__TokenUriNotFound();

    mapping(uint256 => string) private s_tokenIdToUri;
    uint256 private s_tokenCounter;

    constructor() ERC721("Ticket", "Tic") Ownable(msg.sender) {
        s_tokenCounter = 0;
    }

    function mintNft(string calldata tokenUri) public onlyOwner {
        uint256 newTokenId = s_tokenCounter;
        s_tokenIdToUri[newTokenId] = tokenUri;
        _safeMint(msg.sender, newTokenId);
        s_tokenCounter = newTokenId + 1;
    }
    

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        if (ownerOf(tokenId) == address(0)) {
            revert BasicNft__TokenUriNotFound();
        }
        return s_tokenIdToUri[tokenId];
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
}
