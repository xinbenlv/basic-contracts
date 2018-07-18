var SimplestVote = artifacts.require("SimplestVote");

module.exports = function(deployer) {
  deployer.deploy(SimplestVote);
  // uint256 initialSupply,
  // string tokenName,
  // uint8 decimalUnits,
  // string tokenSymbol
};
