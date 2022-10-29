/*
Why is gas necessary?
:- When you execute a function, every single node on the network needs to run 
   that same function to verify its output —thousands of nodes verifying every function 
   execution is what makes Ethereum decentralized,and its data immutable and censorship-resistant.
*/

/*
Struct packing to save gas?
:-using uint8 instead of uint (uint256) won't save you any gas.
:-If you have multiple uints inside a struct, using a smaller-sized uint when possible will 
  allow Solidity to pack these variables together to take up less storage.
:-For example:
        struct NormalStruct {
          uint a;
          uint b;
          uint c;
        }

        struct MiniMe {
          uint32 a;
          uint32 b;
          uint c;
        }

        // `mini` will cost less gas than `normal` because of struct packing
        NormalStruct normal = NormalStruct(10, 20, 30);
        MiniMe mini = MiniMe(10, 20, 30); 
 */
 
 /*
 :-A struct with fields uint c; uint32 a; uint32 b; will cost less gas than a struct with
   fields uint32 a; uint c; uint32 b; because the uint32 fields are clustered together.
 */
 
 /*
 Time Uint:- 
 :-The variable now will return the current unix timestamp of the latest block.
 :-Solidity also contains the time units seconds, minutes, hours, days, weeks and years. 
   These will convert to a uint of the number of seconds in that length of time. So 1 minutes is 60, 
   1 hours is 3600 (60 seconds x 60 minutes), 1 days is 86400 (24 hours x 60 minutes x 60 seconds), etc.
 */

pragma solidity >=0.5.0 <0.6.0;

import "./ownable.sol";

contract ZombieFactory is Ownable {

    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    //Define `cooldownTime` here
    uint cooldownTime=1 days; //one day

    struct Zombie {
        string name;
        uint dna;
        uint32 level;
        uint32 readyTime;
    }

    Zombie[] public zombies;

    mapping (uint => address) public zombieToOwner;
    mapping (address => uint) ownerZombieCount;

    function _createZombie(string memory _name, uint _dna) internal {
        //typecasting the readyTime
        uint id = zombies.push(Zombie(_name, _dna,1,uint32(now+cooldownTime))) - 1;
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
