// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyNft is ERC721 {
    uint256 s_counter = 0;
    mapping(uint256 => string) private s_tokenIdToUri;

    constructor() ERC721("Lina", "LN") {}

    // Anybody can mint their nft and make it look how they want
    function mintNft(string memory _tokenUri) public {
        s_tokenIdToUri[s_counter] = _tokenUri;
        // It is used to safely mint a new NFT and assign it to an address. This function ensures that the NFT is minted and the address receives the token in a secure manner (i.e., checking that the recipient is capable of receiving the token).
        _safeMint(msg.sender, s_counter);
        s_counter++;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }
}
