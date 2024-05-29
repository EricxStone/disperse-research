module.exports = {
  solidity: {
    compilers: [
      {
        version: "0.4.25"
      }
    ],
  },
  networks: {
    sepolia: {
      url: "https://1rpc.io/sepolia",
      accounts:
        process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    }
  },
  gasReporter: {
    enabled: process.env.REPORT_GAS !== undefined,
    currency: "USD",
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY,
  },
};
