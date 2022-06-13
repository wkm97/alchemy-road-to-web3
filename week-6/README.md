---
title: Connect APIs to your Smart Contracts using Chainlink
date: 2022-06-11
reference: https://docs.alchemy.com/alchemy/road-to-web3/weekly-learning-challenges/6.-how-to-build-a-staking-dapp
video: https://www.youtube.com/watch?v=aZRdaE8jxPk
---

# How to Build a Staking Dapp
## Summary
- Building with Scaffold-Eth
    - Hacking together frontends
    - Crafting Solidity "backends"
- Transferring ETH from wallets to smart contracts & vice versa
- Utilizing Solidity modifers

## Notes
- ExampleExternalContract is used to store inactive fund, but in my exercise. There will be no inactive fund (cannot understand the idea of storing inactive fund in another contract).
- For staking, the lock and unlock cycle can be reset using `Execute!` button.
- The interest calculation (non-linear) is referred to [solidity-interest-help](https://github.com/wolflo/solidity-interest-helper)


## Exercise
1. Update the interest mechanism in the Staker.sol contract so that you receive a "non-linear" amount of ETH based on the blocks between deposit and withdrawal
2. Allow users to deposit any arbitrary amount of ETH into the smart contract, not just 0.5 ETH.
3. Instead of using the vanilla ExampleExternalContract contract, implement a function in Staker.sol that allows you to retrieve the ETH locked up in ExampleExternalContract and re-deposit it back into the Staker contract.
    - Make sure to only "white-list" a single address to call this new function to gate its usage!
    - Make sure that you create logic/remove existing code to ensure that users are able to interact with the Staker contract over and over again! We want to be able to ping-pong from Staker -> ExampleExternalContract repeatedly!