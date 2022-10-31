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

import "./Zombiehelper.sol";

contract ZombieAttack is ZombieHelper {
  uint randNonce = 0;
  uint attackVictoryProbability = 70;

  function randMod(uint _modulus) internal returns(uint) {
    randNonce++;
    return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
  }

  function attack(uint _zombieId, uint _targetId) external ownerOf(_zombieId) {
    Zombie storage myZombie = zombies[_zombieId];
    Zombie storage enemyZombie = zombies[_targetId];
    uint rand = randMod(100);
    if (rand <= attackVictoryProbability) {
      myZombie.winCount++;
      myZombie.level++;
      enemyZombie.lossCount++;
      feedAndMultiply(_zombieId, enemyZombie.dna, "zombie");
    } // start here
    else{
      myZombie.lossCount++;
      enemyZombie.winCount++;
      _triggerCooldown(myZombie);
    }
  }
}

