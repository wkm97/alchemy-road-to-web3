const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("staker contract", function () {
  let StakerContract;

  beforeEach(async () => {
    StakerContract = await ethers.getContractFactory("Staker");
  });

  it("should convert ether to wei correctly", async function () {
    const staker = await StakerContract.deploy();
    const result = await staker.etherToWei(10);
    expect(Number(result)).to.equal(10000000000000000000);
  });
});
