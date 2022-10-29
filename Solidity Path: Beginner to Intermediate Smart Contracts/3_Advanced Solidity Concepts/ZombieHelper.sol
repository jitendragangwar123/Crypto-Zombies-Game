/*
// A mapping to store a user's age:
mapping (uint => uint) public age;

// Modifier that requires this user to be older than a certain age:
modifier olderThan(uint _age, uint _userId) {
  require(age[_userId] >= _age);
  _;
}

// Must be older than 16 to drive a car (in the US, at least).
// We can call the `olderThan` modifier with arguments like so:
function driveCar(uint _userId) public olderThan(16, _userId) {
  // Some function logic
}

*/

/*
calldata:- 
         calldata is somehow similar to memory, but it's only available to external functions.
*/

/*
storage:-
      In Solidity, this is way cheaper than using storage if it's in an external view function, 
      since view functions don't cost your users any gas.
*/

/*
:- view functions don't cost any gas when they're called externally by a user.
:- If a view function is called internally from another function in the same contract that is 
   not a view function, it will still cost gas. This is because the other function creates a transaction 
   on Ethereum, and will still need to be verified from every node. So view functions are only free when they're called externally.
*/


/*
pragma solidity >=0.5.0 <0.6.0;

import "./Zombiefeeding.sol";

contract ZombieHelper is ZombieFeeding {

  modifier aboveLevel(uint _level, uint _zombieId) {
    require(zombies[_zombieId].level >= _level);
    _;
  }

  function changeName(uint _zombieId, string calldata _newName) external aboveLevel(2, _zombieId) {
    require(msg.sender == zombieToOwner[_zombieId]);
    zombies[_zombieId].name = _newName;
  }

  function changeDna(uint _zombieId, uint _newDna) external aboveLevel(20, _zombieId) {
    require(msg.sender == zombieToOwner[_zombieId]);
    zombies[_zombieId].dna = _newDna;
  }

  function getZombiesByOwner(address _owner) external view returns(uint[] memory) {
    // Start here
    uint[] memory result= new uint[](ownerZombieCount[_owner]);
    return result;
  }

}
*/

/*
:- 
memory arrays must be created with a length argument (in this example, 3). They currently 
cannot be resized like storage arrays can with array.push(), although this may be changed in a future version of Solidity.


function getArray() external pure returns(uint[] memory) {
  // Instantiate a new array in memory with a length of 3
  uint[] memory values = new uint[](3);
  // Put some values to it
  values[0] = 1;
  values[1] = 2;
  values[2] = 3;
  return values;
}
*/
