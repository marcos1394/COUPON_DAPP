const Coupons = artifacts.require("Coupons");

const assert = require("assert");

contract("Coupons", (accounts) => {
  const buyerAccount = accounts[1];
  const couponID = 0;

  it("should allow a user to buy a coupon", async () => {
    const instance = await Coupons.deployed();
    const availableCoupon = await instance.coupons(couponID);
    await instance.buyCoupon(couponID, {
      from: buyerAccount,
      value: availableCoupon.price,
    });
    const updatedCoupon = await instance.coupons(couponID);
    assert.equal(
      updatedCoupon.owner,
      buyerAccount,
      "The buyer owns the coupon"
    );
  });
});