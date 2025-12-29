// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract ICO is ERC20,Ownable {
    constructor(address initialOwner) ERC20("IneuronCoin", "INC") Ownable(initialOwner) {
        _mint(msg.sender, 1000000);
    }

    function mint(address account, uint amt)public onlyOwner returns (bool) {
        require(account != address(this) && amt != uint(0), "ERC20: Function mint invalid input");
        _mint(account,amt);
        return true;  
    }

    function burn(address account, uint amt)public onlyOwner returns (bool) {
        require(account != address(this) && amt != uint(0), "ERC20: Function burn invalid input");
        _burn(account,amt); 
    }

}