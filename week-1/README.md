---
title: How to develop an NFT Smart Contract (ERC721) with Alchemy
date: 2022-05-12
reference: https://docs.alchemy.com/alchemy/guides/how-to-develop-an-nft-smart-contract-erc721-with-alchemy
---

# How to develop an NFT Smart Contract (ERC721) with Alchemy
## Summary
- How to write and modify the smart contract using OpenZeppelin and Remix
- Get free Rinkeby ETH using rinkebyfaucet.com
- Deploy it on the Ethereum Rinkeby testnet blockchain to save on gas fees
- Host the NFT tokens metadata on IPFS using Filebase.
- Mint an NFT and visualize it on OpenSea

## Notes
- [OpenZeppelin wizard](https://docs.openzeppelin.com/contracts/4.x/wizard) for quick start code generation.
- Remix is a solidity online IDE.
- NFTs metadata
    - OpenSea use the `tokenURI` method in ERC721URIStorage to get URI
    - URI will point to the hosted metadata
    - metadata will be used in frontend of marketplace



## Exercise
1. Modify your smart contract, `demo.sol` to allow users to only mint only up to a certain number of NFTs.

## Misc
- [NFT image](https://ipfs.filebase.io/ipfs/bafybeihyvhgbcov2nmvbnveunoodokme5eb42uekrqowxdennt2qyeculm)