// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

error ManualToken__InsufficientAmount();
error ManualToken__InvalidAddress();

contract ManualToken {
    mapping(address => uint256) private s_balances;

    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    function totalSupply() public pure returns (uint256) {
        return 1000000000;
    }

    function transfer(
        address _to,
        uint256 _value
    ) public returns (bool success) {
        uint256 senderBalance = s_balances[msg.sender];
        if (_value > senderBalance) {
            revert ManualToken__InsufficientAmount();
        }
        if (_to == address(0)) {
            revert ManualToken__InvalidAddress();
        }
        s_balances[msg.sender] -= _value;
        s_balances[_to] += _value;
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return s_balances[_owner];
    }
}
