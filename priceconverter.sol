// SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library priceconverter
{
     function getPrice() public view returns(uint256){
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = pricefeed.latestRoundData();
        return uint(price*1e10);
    }

    function getconversion(uint256 ethamount) public view returns(uint256){
       uint256 ethprice = getPrice();
        uint256 ethamountinUSD = (ethprice*ethamount) / 1e18;
        return ethamountinUSD;
    }
}