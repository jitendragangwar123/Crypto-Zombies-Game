/*
Overflow and Underflow:-
      Let's say we have a uint8, which can only have 8 bits. That means the largest number we can store is binary 11111111 
(or in decimal, 2^8 - 1 = 255).
Take a look at the following code. What is number equal to at the end?

uint8 number = 255;
number++;

In this case, we've caused it to overflow — so number is counterintuitively now equal to 0 even though we increased it. 
(If you add 1 to binary 11111111, it resets back to 00000000, like a clock going from 23:59 to 00:00).

An underflow is similar, where if you subtract 1 from a uint8 that equals 0, it will now equal 255 (because uints are unsigned, 
and cannot be negative).

*/

/* SafeMath library:-
            SafeMath library, we'll use the syntax using SafeMath for uint256. The SafeMath library has 4 functions — add, sub, mul, and div. 
And now we can access these functions from uint256 as follows:

            using SafeMath for uint256;
            uint256 a = 5;
            uint256 b = a.add(3); // 5 + 3 = 8
            uint256 c = a.mul(2); // 5 * 2 = 10
*/

pragma solidity >=0.5.0 <0.6.0;

import "./Ownable.sol";
// 1. Import here
import "./SafeMath.sol"

contract ZombieFactory is Ownable {

  // 2. Declare using safemath her
  uising SafeMath for uint256;

  event NewZombie(uint zombieId, string name, uint dna);

  uint dnaDigits = 16;
  uint dnaModulus = 10 ** dnaDigits;
  uint cooldownTime = 1 days;

  struct Zombie {
    string name;
    uint dna;
    uint32 level;
    uint32 readyTime;
    uint16 winCount;
    uint16 lossCount;
  }

  Zombie[] public zombies;

  mapping (uint => address) public zombieToOwner;
  mapping (address => uint) ownerZombieCount;

  function _createZombie(string memory _name, uint _dna) internal {
    uint id = zombies.push(Zombie(_name, _dna, 1, uint32(now + cooldownTime), 0, 0)) - 1;
    zombieToOwner[id] = msg.sender;
    ownerZombieCount[msg.sender]++;
    emit NewZombie(id, _name, _dna);
  }

  function _generateRandomDna(string memory _str) private view returns (uint) {
    uint rand = uint(keccak256(abi.encodePacked(_str)));
    return rand % dnaModulus;
  }

  function createRandomZombie(string memory _name) public {
    require(ownerZombieCount[msg.sender] == 0);
    uint randDna = _generateRandomDna(_name);
    randDna = randDna - randDna % 100;
    _createZombie(_name, randDna);
  }

}
