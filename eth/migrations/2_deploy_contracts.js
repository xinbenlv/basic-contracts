var MultiAirDropToken = artifacts.require("MultiAirDropToken");

module.exports = function(deployer) {
  deployer.deploy(MultiAirDropToken, 1000000000000, 'MultiAirDropToken', 0, 'MAD');
  // uint256 initialSupply,
  // string tokenName,
  // uint8 decimalUnits,
  // string tokenSymbol
};
