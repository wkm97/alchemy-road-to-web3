---
title: How to Make NFTs with On-Chain Metadata - Hardhat and JavaScript
date: 2022-05-17
reference: https://docs.alchemy.com/alchemy/road-to-web3/weekly-learning-challenges/3.-how-to-make-nfts-with-on-chain-metadata-hardhat-and-javascript
discordMessage: https://discord.com/channels/735965332958871634/975501846863032340/975922620862173214
---

# How to Make NFTs with On-Chain Metadata - Hardhat and JavaScript
## Summary
- How to store NFTs metadata on chain
- What is Polygon and why it's important to lower Gas fees.
- How to deploy on Polygon Mumbai
- How to process and store on-chain SVG images and JSON objects
- How to modify your metadata based on your interactions with the NFT

## Notes
- READ LATER: https://www.one37pm.com/nft/what-are-layer-2-solutions-and-why-are-they-important
- `bytes` type, a dynamically sized array of up to 32 bytes where you can store strings, and integers.
- `abi.encodePacked()` to concatenate string
- pseudo-random snippet
    ```javascript
    function randMod(uint256 _modulus) internal returns (uint256) {
        randNonce++;
        return
            uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, randNonce))) %
            _modulus;
    }
    ```


## Exercise
1. create character struct
    - give character attribute using pseudo-random