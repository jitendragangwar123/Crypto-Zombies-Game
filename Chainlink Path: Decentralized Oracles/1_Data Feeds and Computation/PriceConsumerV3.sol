/*
Tuple:- 
    A tuple is a way in Solidity to create a syntactic grouping of expressions.
for Example:- 
    contract feedPrice{
      function latestRoundData()
          external
          view
          returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
          );
         } 
          
Make Tuple for this function:- 
:-In order for us to assign variables to each return variable, we use the tuple syntax by grouping a list of variables in parentheses:-
 (uint80 roundId, int answer, uint startedAt, uint updatedAt, uint80 answeredInRound) = priceFeed.latestRoundData();
 
:-We can also rename the variables to anything that we please. For example, let's rename answer to price:- 
  (uint80 roundId, int price, uint startedAt, uint updatedAt, uint80 answeredInRound) = priceFeed.latestRoundData();
  
:-Additionally, if there are variables that we are not going to use, it's often best practice to leave them as blanks, like so:-
   (,int price,,,) = priceFeed.latestRoundData();
*/


pragma solidity ^0.6.7;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract PriceConsumerV3 {
  AggregatorV3Interface public priceFeed;

  constructor() public {
    priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
  }

  // Start here
  function getLatestPrice() public view returns(int){
      (,int price,,,)=priceFeed.latestRoundData();
      return price;
  }

}
