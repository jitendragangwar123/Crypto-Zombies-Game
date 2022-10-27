pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {

    /*declare the event
    event IntegersAdded(uint x, uint y, uint result);
    function add(uint _x, uint _y) public returns (uint) {
      uint result = _x + _y;
      // fire an event to let the app know the function was called:
      emit IntegersAdded(_x, _y, result);
      return result;
    }*/
    
    event NewZombie(uint zombieId, string name, uint dna);


    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    
    /*
      struct Person {
      uint age;
      string name;
    }

    Person[] public people;
    // create a New Person:
    Person satoshi = Person(172, "Satoshi");

    // Add that person to the Array:
    people.push(satoshi);
    //One line solution
    people.push(Person(16, "Vitalik"));

    */

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;
    
   //functions are public by default. 
    function _createZombie(string memory _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna))-1;
        // and fire it here
        emit NewZombie(id, _name, _dna);

    }
    
    /*
    Ethereum has the hash function keccak256 built in, which is a version of SHA3. 
    A hash function basically maps an input into a random 256-bit hexadecimal number.
    */
    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}



/*Typecasting
uint8 a = 5;
uint b = 6;
// throws an error because a * b returns a uint, not uint8:
uint8 c = a * b;
// we have to typecast b as a uint8 to make it work:
uint8 c = a * uint8(b);
*/
