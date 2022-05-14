// scripts/transfer-owner.js

const hre = require("hardhat");
const abi = require("../artifacts/contracts/BuyMeACoffee.sol/BuyMeACoffee.json");

async function main(){
  const owner = await hre.ethers.getSigner();
  const contractABI = abi.abi;
  const contractAddress="0x761f1Be00aC40918780099f78E0f8E81de0786Cd";
  const transferTo = "0xC19Fde25d1483563afA7494978c09f9652Ff23Bc";

  const buyMeACoffee = new hre.ethers.Contract(contractAddress, contractABI, owner);
  
  // transfer ownership to other account address
  await buyMeACoffee.connect(owner).transferOwner(transferTo);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });