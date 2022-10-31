/*
Random number generation via keccak256 :-
            The best source of randomness we have in Solidity is the keccak256 hash function.
            // Generate a random number between 1 and 100:
            uint randNonce = 0;
            uint random = uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % 100;
            randNonce++;
            uint random2 = uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % 100;
            
:-take the timestamp of now, the msg.sender, and an incrementing nonce (a number that is only ever used once, 
  so we don't run the same hash function with the same input parameters twice).
*/

/*
    Once a node has solved the PoW, the other nodes stop trying to solve the PoW, 
verify that the other node's list of transactions are valid, and then accept the block
and move on to trying to solve the next block.

*/

pragma solidity >=0.5.0 <0.6.0;

import "./zombiehelper.sol";

contract ZombieAttack is ZombieHelper {
  uint randNonce = 0;
  // Create attackVictoryProbability here
  uint attackVictoryProbability=70;

  function randMod(uint _modulus) internal returns(uint) {
    randNonce++;
    return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
  }

  // Create new function here
  function attack(uint _zombieId,uint _targetId)external{
    
  }
}
