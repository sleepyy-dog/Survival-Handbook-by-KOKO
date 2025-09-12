require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.20",
  paths: {
    sources: "./contract",
  },
  networks: {
    hardhat: {
      forking: {
        url: "https://eth-mainnet.g.alchemy.com/v2/j1vzsS94GRoyprXYy3rFL-ftWLXujj0f",
      }
    },
    // mainnet: {
    //   url: "https://eth-mainnet.g.alchemy.com/v2/j1vzsS94GRoyprXYy3rFL-ftWLXujj0f",
    //   accounts: ["0xj1vzsS94GRoyprXYy3rFL-ftWLXujj0f"]
    // }
  }
};
