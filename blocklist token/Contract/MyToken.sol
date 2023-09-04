// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Blacklist.sol";

contract MyToken is ERC20, Ownable, Blacklist {
     address admin=msg.sender;
     uint public tokenPrice;
       constructor(uint _tokenPrice)
       ERC20("Anurag","ANG")
       {
         tokenPrice=_tokenPrice;
        _mint(msg.sender,5000* (10**18));

    }

     // Function to mint new tokens
    function mint(address account, uint256 amount) public onlyOwner {
        require(account != address(0), "Invalid address");
        require(amount > 0, "Amount must be greater than 0");
        _mint(account, amount);
    }

    // Function to burn token
    function burn(address useradd, uint256 amount) public {
        _burn(useradd, amount);
    }
function buyToken(uint noToken) public payable {

       require(!isBlacklisted(msg.sender), "You are blacklisted");
         
        uint256 requiredAmount = noToken * tokenPrice;
        require(msg.value == requiredAmount, "Amount is less");

        _transfer(admin, msg.sender, noToken);
    }

    function transfer(address to, uint256 amount) public virtual override returns (bool) {

        require(!isBlacklisted(msg.sender) && !isBlacklisted(to) , "You are blacklisted");
        address owne = _msgSender();
        _transfer(owne, to, amount);
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
        require(isBlacklisted(from) && !isBlacklisted(to), "You are blacklisted");
        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
        _transfer(from, to, amount);
        return true;
    }

}
 

