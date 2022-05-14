// scripts/transfer-owner.js

const hre = require("hardhat");

async function main(){
  // Get the example accounts we'll be working with.
  const owner = await hre.ethers.getSigner();

  // We get the contract to deploy.
  const BuyMeACoffee = await hre.ethers.getContractFactory("BuyMeACoffee");
  const buyMeACoffee = await BuyMeACoffee.deploy();

  // Deploy the contract.
  await buyMeACoffee.deployed();
  console.log("BuyMeACoffee deployed to:", buyMeACoffee.address);
  await buyMeACoffee.connect(owner).transferOwner("0xF9dDc99C51E01b0F57c47168E9A24eee40d3Bb1D");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });