// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {DeployToken} from "../script/DeployToken.s.sol";
import {GLDToken} from "../src/GLDToken.sol";

contract GLDTokenTest is Test {
    GLDToken gldToken;
    address tade = makeAddr("tade");
    address eniola = makeAddr("eniola");
    uint256 TRANSFER_AMOUNT = 0.0001 ether;

    function setUp() external {
        DeployToken deployToken = new DeployToken();
        gldToken = deployToken.run();
    }

    function testIfContractNameIsCorrect() external view {
        string memory contractName = "Gold";
        assertEq(gldToken.name(), contractName);
    }

    function testIfContractSymbolIsCorrect() external view {
        string memory CONTRACT_SYMBOL = "GLD";
        assertEq(gldToken.symbol(), CONTRACT_SYMBOL);
    }

    function testThatAddressIsFunded() external {
        address owner = gldToken.owner();
        uint256 previousReceiverBalance = gldToken.balanceOf(eniola);
        console.log(gldToken.balanceOf(owner));
        vm.prank(owner);
        gldToken.transfer(eniola, TRANSFER_AMOUNT);
        uint256 newUserBalance = gldToken.balanceOf(eniola);
        assertEq(newUserBalance, previousReceiverBalance + TRANSFER_AMOUNT);
    }

    function testThatTransferWorks() external {
        uint256 AMOUNT_TO_SEND = 100000;
        address owner = gldToken.owner();
        vm.prank(owner);
        gldToken.mint(tade, TRANSFER_AMOUNT);
        uint256 prevBalance = gldToken.balanceOf(tade);
        vm.prank(tade);
        gldToken.transfer(eniola, AMOUNT_TO_SEND);
        uint256 newBalance = gldToken.balanceOf(tade);
        assertEq(newBalance, prevBalance - AMOUNT_TO_SEND);
        console.log(gldToken.balanceOf(eniola));
    }
}
