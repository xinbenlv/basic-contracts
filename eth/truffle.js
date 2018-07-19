/*
 * NB: since truffle-hdwallet-provider 0.0.5 you must wrap HDWallet providers in a 
 * function when declaring them. Failure to do so will cause commands to hang. ex:
 * ```
 * mainnet: {
 *     provider: function() { 
 *       return new HDWalletProvider(mnemonic, 'https://mainnet.infura.io/<infura-key>') 
 *     },
 *     network_id: '1',
 *     gas: 4500000,
 *     gasPrice: 10000000000,
 *   },
 */

const HDWalletProvider = require("truffle-hdwallet-provider-privkey");
const privateKey = process.env.PRIVATE_KEY;
console.assert(privateKey, 'Please set private key by `export PRIVATE_KEY=<your private key>`');
const infura_apikey = process.env.INFURA_APIKEY;
console.assert(infura_apikey, 'Please set private key by `export INFURA_APIKEY=<your infura API key>`');

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*", // Match any network id
    },
    ropsten: {
      provider: new HDWalletProvider(privateKey, "https://ropsten.infura.io/"+infura_apikey),
      network_id: 3,
      gas: 4500000,
      gasPrice: 20000000000,
    }
  },
};
