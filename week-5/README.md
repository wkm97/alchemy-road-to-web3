---
title: Connect APIs to your Smart Contracts using Chainlink
date: 2022-05-31
reference: https://docs.alchemy.com/alchemy/road-to-web3/weekly-learning-challenges/5.-connect-apis-to-your-smart-contracts-using-chainlink
video: https://www.youtube.com/watch?v=hNdXSMKLDi4&list=PLMj8NvODurfEYLsuiClgikZBGDfhwdcXF&index=7
github: https://github.com/zeuslawyer/chainlink-dynamic-nft-alchemy
---

# Connect APIs to your Smart Contracts using Chainlink
## Summary
- Use chainlink keeper
- Use chainlink oracle price feed
- Use chainlink verifiable random function (vrf)

## Notes
- Remember to host the asset in IPFS yourself by modifying the image url in .json files.
- VRF, request and fullfill randomness is 2 different phase.

## Deploy Step
- Deploy Bull&Bear.sol to rinkeby, parameter: 60, 0xECe365B379E1dD183B20fc5f022230C044d51404, 0x6168499c0cFfCaCD319c818142124B7A15E857ab
- subscription_id for vrf on Bull&Bear.sol
- safe mint

## Exercise
Update the NFT contract code to make the following happen:

- track the current market trend (hint: use an enum like `enum MarketTrend{BULL, BEAR}`)
- update `performUpkeep` so that it tracks the latest market trend based on the `getLatestPrice()` and if there is a price change, it calls another function (eg `requestRandomnessForNFTUris()`) that initiates the process of calling a [Chainlink VRF V2 Coordinator](https://docs.chain.link/docs/get-a-random-number/) for a random number.
- implement `fulfillRandomWords()` as per the VRF documentation

A suggested implementation of the assignment at [link](https://github.com/zeuslawyer/chainlink-dynamic-nft-alchemy/tree/randomness)