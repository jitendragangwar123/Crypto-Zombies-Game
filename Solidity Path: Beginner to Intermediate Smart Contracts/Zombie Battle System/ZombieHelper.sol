/*
payable Modifier:-
    payable functions are part of what makes Solidity and Ethereum so cool — they 
are a special type of function that can receive Ether.

contract OnlineStore {
  function buySomething() external payable {
    // Check to make sure 0.001 ether was sent to the function call:
    require(msg.value == 0.001 ether);
    // If so, some logic to transfer the digital item to the caller of the function:
    transferThing(msg.sender);
  }
}
*/

/*
// Assuming `OnlineStore` points to your contract on Ethereum:
OnlineStore.buySomething({from: web3.eth.defaultAccount, value: web3.utils.toWei(0.001)})
*/

/* withdraw:- 
        After you send Ether to a contract, it gets stored in the contract's Ethereum account, 
and it will be trapped there — unless you add a function to withdraw the Ether from the contract.

contract GetPaid is Ownable {
  function withdraw() external onlyOwner {
    address payable _owner = address(uint160(owner()));
    _owner.transfer(address(this).balance);
  }
}

:-We're using owner() and onlyOwner from the Ownable contract, assuming that was imported.

:-It is important to note that you cannot transfer Ether to an address unless that address is of type address payable.
But the _owner variable is of type uint160, meaning that we must explicitly cast it to address payable.
:-Once you cast the address from uint160 to address payable, you can transfer Ether to that address using the transfer function, 
and address(this).balance will return the total balance stored on the contract.
*/




pragma solidity >=0.5.0 <0.6.0;

import "./zombiefeeding.sol";

contract ZombieHelper is ZombieFeeding {

  uint levelUpFee = 0.001 ether;

  modifier aboveLevel(uint _level, uint _zombieId) {
    require(zombies[_zombieId].level >= _level);
    _;
  }

  // 1. Create withdraw function here
  function withdraw() external onlyOwner{
    address payable _owner=address(uint160(owner()));
    _owner.transfer(address(this).balance);
  }
  // 2. Create setLevelUpFee function here
  function setLevelUpFee(uint _fee) external onlyOwner{
    levelUpFee=_fee;
  }

  function levelUp(uint _zombieId) external payable {
    require(msg.value == levelUpFee);
    zombies[_zombieId].level++;
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
    uint[] memory result = new uint[](ownerZombieCount[_owner]);
    uint counter = 0;
    for (uint i = 0; i < zombies.length; i++) {
      if (zombieToOwner[i] == _owner) {
        result[counter] = i;
        counter++;
      }
    }
    return result;
  }

}
