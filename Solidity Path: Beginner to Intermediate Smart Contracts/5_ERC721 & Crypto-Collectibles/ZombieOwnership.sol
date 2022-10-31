/*
balanceOf():-
        This function simply takes an address, and returns how many tokens that address owns.
ownerOf():-
       This function takes a token ID (in our case, a Zombie ID), and returns the address of the person who owns it.
*/

/*
Note that the ERC721 spec has 2 different ways to transfer tokens:

        function transferFrom(address _from, address _to, uint256 _tokenId) external payable;
                                                or
        function approve(address _approved, uint256 _tokenId) external payable;
        function transferFrom(address _from, address _to, uint256 _tokenId) external payable;

:- The first way is the token's owner calls transferFrom with his address as the _from parameter, 
the address he wants to transfer to as the _to parameter, and the _tokenId of the token he wants to transfer.

:-The second way is the token's owner first calls approve with the address he wants to transfer to, and the _tokenID . 
The contract then stores who is approved to take a token, usually in a mapping (uint256 => address). Then, when the owner 
or the approved address calls transferFrom, the contract checks if that msg.sender is the owner or is approved by the owner to take the token, 
and if so it transfers the token to him.

:-Notice that both methods contain the same transfer logic. In one case the sender of the token calls the transferFrom function;
in the other the owner or the approved receiver of the token calls it.

:-So it makes sense for us to abstract this logic into its own private function, _transfer, which is then called by transferFrom.
*/


pragma solidity >=0.5.0 <0.6.0;

import "./Zombieattack.sol";
import "./erc721.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {

  function balanceOf(address _owner) external view returns (uint256) {
    return ownerZombieCount[_owner];
  }

  function ownerOf(uint256 _tokenId) external view returns (address) {
    return zombieToOwner[_tokenId];
  }

  // Define _transfer() here
  function _transfer(address _from,address _to,uint256 _tokenId) private{
    ownerZombieCount[_to]++;
    ownerZombieCount[_from]--;
    zombieToOwner[_tokenId]=_to;
    emit Transfer(_from,_to,_tokenId);
  }

  function transferFrom(address _from, address _to, uint256 _tokenId) external payable {

  }

  function approve(address _approved, uint256 _tokenId) external payable {

  }
}

