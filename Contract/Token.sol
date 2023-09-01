// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.9.0) (token/ERC20/ERC20.sol)

pragma solidity ^0.8.20;
import "./ERC20.sol";
import "./Ownable.sol";

contract MyToken is ERC20, Ownable {

    constructor()ERC20("Anurag","ANG") Ownable(msg.sender) {

        _mint(msg.sender,50000* (10**18));
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

}