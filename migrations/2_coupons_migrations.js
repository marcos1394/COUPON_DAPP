const Coupons = artifacts.require("Coupons");

module.exports = function (deployer) {
  deployer.deploy(Coupons);
};