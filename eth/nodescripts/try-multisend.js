
var provider = new Web3.providers.HttpProvider("http://localhost:7545");
var contract = require("truffle-contract");

var artifactor = require("truffle-artifactor");
artifactor.save({/*...*/}, "./MyContract.sol.js") // => a promise
 
// Later...
var MyContract = require("./MyContract.sol.js");

var MultiAirDropToken = artifacts.require("./MultiAirDropToken.sol");

MultiAirDropToken.setProvider(provider);

// Print the deployed version of MetaCoin.
// Note that getting the deployed version requires a promise, hence the .then.
MultiAirDropToken.deployed().then(function(instance) {
    console.log(instance);
  });
  
  // outputs:
  //
  // Contract
  // - address: "0xa9f441a487754e6b27ba044a5a8eb2eec77f6b92"
  // - allEvents: ()
  // - getBalance: ()
  // - getBalanceInEth: ()
  // - sendCoin: ()
  // ...