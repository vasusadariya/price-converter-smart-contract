// SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;
import {priceconverter} from "./priceconverter.sol";


contract fundme {
    using priceconverter for uint256;
    uint256 public minimumUSD = 5e18;
    address[] public funders;
      mapping(address => uint256) public addresstofunder;

    function fund() public payable {
        require(msg.value.getconversion() >= minimumUSD,"didn't send enough eth");
        funders.push(msg.sender);
        addresstofunder[msg.sender] = addresstofunder[msg.sender] + msg.value;
    }   
}