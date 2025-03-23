// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

error GLDToken__NotOwner();

contract GLDToken is ERC20 {
    address public owner;

    constructor(uint256 initialSupply) ERC20("Gold", "GLD") {
        owner = msg.sender;
        _mint(msg.sender, initialSupply);
    }

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert GLDToken__NotOwner();
        }
        _;
    }

    function mint(address _receiver, uint256 _amount) public onlyOwner {
        _mint(_receiver, _amount);
    }
}
