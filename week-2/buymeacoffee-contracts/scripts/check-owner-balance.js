// scripts/check-balance.js

const hre = require("hardhat");

async function main() {
  const owner = await hre.ethers.getSigner();
  const balanceBigInt = await hre.waffle.provider.getBalance(owner.address);
  const balance = hre.ethers.utils.formatEther(balanceBigInt);

  console.log("Account address:", owner.address);
  console.log("Account balance:", balance);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });