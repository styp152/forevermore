// Fetch the Storage contract data from the Storage.json file
var MarriageNotary = artifacts.require("MarriageNotary");

// JavaScript export
module.exports = function(deployer) {
    // Deployer is the Truffle wrapper for deploying
    // contracts to the network

    // Deploy the contract to the network
    deployer.deploy(MarriageNotary);
}
