/*
balanceOf():-
        This function simply takes an address, and returns how many tokens that address owns.
ownerOf():-
       This function takes a token ID (in our case, a Zombie ID), and returns the address of the person who owns it.
*/


pragma solidity >=0.5.0 <0.6.0;

import "./Zombieattack.sol";
import "./erc721.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {

  function balanceOf(address _owner) external view returns (uint256) {
    // 1. Return the number of zombies `_owner` has here
    return ownerZombieCount[_owner];

  }

  function ownerOf(uint256 _tokenId) external view returns (address) {
    // 2. Return the owner of `_tokenId` here
    return zombieToOwner[_tokenId];
  }

  function transferFrom(address _from, address _to, uint256 _tokenId) external payable {

  }

  function approve(address _approved, uint256 _tokenId) external payable {

  }
}
