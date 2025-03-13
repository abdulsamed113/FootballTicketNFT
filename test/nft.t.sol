// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.1.0) (token/ERC721/ERC721.sol)

pragma solidity ^0.8.20;

import {Test} from "lib/forge-std/src/Test.sol";
import {NFT} from "src/nft.sol";
import {DeployNFT} from "script/nft.s.sol";

contract NFTTest is Test {
    DeployNFT public newdeployNft;
    NFT public newNftContract;
    string private constant link =
        "https://bafybeib3g67c3aieim35q7pq6cq7yzn45kqjinsvtqdqkejpu3ljywz4be.ipfs.dweb.link?filename=wallpaperflare.com_wallpaper.jpg";

    function setUp() public {
        newdeployNft = new DeployNFT();
        newNftContract = newdeployNft.run();
    }

    function testonsymbolandname() public view {
        string memory input = "Tutankhamun";
        require(
            keccak256(abi.encodePacked(input)) == keccak256(abi.encodePacked(newNftContract.name())),
            "Name does not match"
        );
    }

    function testExpectSymbolAndNameRevert() public {
        string memory expectedName = "empty";
        vm.expectRevert();
        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(newNftContract.name())));
    }
}
