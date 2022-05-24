---
title: How to build "Buy Me a Coffee" DeFi dapp
date: 2022-05-12
reference: https://docs.alchemy.com/alchemy/tutorials/how-to-build-buy-me-a-coffee-defi-dapp
discordMessage: https://discord.com/channels/735965332958871634/964536098267217951/973056934053838858
---

# How to build "Buy Me a Coffee" DeFi dapp
## Summary
- Use the Hardhat development environment to build, test, and deploy our smart contract.
- Connect your MetaMask wallet to the Goerli test network using an Alchemy rpc endpoint.
- Get free Goerli ETH from goerlifaucet.com.
- Use Ethers.js to interact with your deployed smart contract.
- Build a frontend website for your decentralized application with Replit.

## Notes
- `indexed` keyword for logged `events` for address filtering
- `msg` variable
- `block` variable
- use `hardhat.config.js` for network configuration

## Exercise
1. Allow your smart contract to update the withdrawal address.
2. Allow your smart contract to buyLargeCoffee for 0.003 ETH, and create a button on the frontend website that shows a "Buy Large Coffee for 0.003ETH" button.
