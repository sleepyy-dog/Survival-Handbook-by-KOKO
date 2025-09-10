const { ethers } = require("hardhat");

async function main() {
  const UniversalInterpreter = await ethers.getContractFactory("UniversalInterpreter");
  console.log("Deploying UniversalInterpreter...");
  const contract = await UniversalInterpreter.deploy();
  await contract.waitForDeployment();
  const contractAddress = await contract.getAddress();
  console.log("UniversalInterpreter deployed to:", contractAddress);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
