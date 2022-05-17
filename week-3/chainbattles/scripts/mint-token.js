const hre = require("hardhat");

async function main() {
    const [owner, other] = await hre.ethers.getSigners();
    const ChainBattles = await hre.ethers.getContractFactory("ChainBattles");
    const chainBattles = await ChainBattles.deploy();

    await chainBattles.deployed();
    console.log("Contract deployed to:", chainBattles.address);

    await chainBattles.connect(owner).mint();
    const tokenId = 1;
    const uri = await chainBattles.connect(owner).getTokenURI(tokenId);
    console.log("=== Token URI ===")
    console.log(uri);
    const character = await chainBattles.connect(owner).generateCharacter(tokenId);
    console.log("=== Character SVG ===")
    console.log(character)
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });