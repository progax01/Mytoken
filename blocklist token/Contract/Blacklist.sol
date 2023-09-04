// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/access/Ownable.sol";

contract Blacklist {


  mapping(address => bool) private _blacklist;

  event Blacklisted(address indexed user);


  event Unblacklisted(address indexed user);


  function blacklist(address user) public {
 
    require(!_blacklist[user], "User is already blacklisted");

    _blacklist[user] = true;


    emit Blacklisted(user);
  }


  function unblacklist(address user) public  {

    require(_blacklist[user], "User is not blacklisted");


    _blacklist[user] = false;


    emit Unblacklisted(user);
  }


  function isBlacklisted(address user) public view returns (bool) {
    return _blacklist[user];
  }

}
