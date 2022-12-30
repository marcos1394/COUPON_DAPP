// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

uint256 constant totalCoupons = 30;

contract Coupons{
    address public owner =msg.sender;

    struct Coupon{
        uint256 id;
        uint256 price;
        address owner;

    }

    Coupon[totalCoupons] public coupons;

    constructor(){
        for(uint256 i=0; i<totalCoupons; i++){
            coupons[i].price = 1e17;//0.1eth
            coupons[i].owner = address(0x0);
            coupons[i].id = i;
        }
    }

    function buyCoupon(uint256 _index) external payable {
        require(_index<totalCoupons&&_index>=0);
        require(coupons[_index].owner == address(0x0));
        require(msg.value >= coupons[_index].price);
        coupons[_index].owner = msg.sender;
        
    }
}