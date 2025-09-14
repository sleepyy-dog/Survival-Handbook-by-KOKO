const { ethers } = require("hardhat");

async function main() {
  console.log("Deploying UniversalInterpreter contract...");

  const ContractFactory = await ethers.getContractFactory("UniversalInterpreter");
  const contract = await ContractFactory.deploy();
  await contract.waitForDeployment();
  const contractAddress = await contract.getAddress();

  console.log("✅ UniversalInterpreter deployed to:", contractAddress);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
