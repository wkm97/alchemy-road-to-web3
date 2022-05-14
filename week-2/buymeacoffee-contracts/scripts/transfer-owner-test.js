// scripts/transfer-owner.js

const hre = require("hardhat");
const abi = require("../artifacts/contracts/BuyMeACoffee.sol/BuyMeACoffee.json");

async function main(){
  const owner = await hre.ethers.getSigner();
  const contractABI = abi.abi;
  const contractAddress="0x761f1Be00aC40918780099f78E0f8E81de0786Cd";
  const transferTo = "0xF9dDc99C51E01b0F57c47168E9A24eee40d3Bb1D";

  const buyMeACoffee = new hre.ethers.Contract(contractAddress, contractABI, owner);

  console.log("BuyMeACoffee deployed to:", buyMeACoffee.address);
  await buyMeACoffee.connect(owner).transferOwner(transferTo);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });