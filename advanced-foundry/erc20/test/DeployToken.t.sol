// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {DeployToken} from "../script/DeployToken.s.sol";
import {GLDToken} from "../src/GLDToken.sol";

contract GLDTokenTest is Test {
    GLDToken gldToken;

    function setUp() external {
        DeployToken deployToken = new DeployToken();
        gldToken = deployToken.run();
    }

    function testIfContractNameIsCorrect() external view {
        string memory contractName = "Gold";
        assertEq(gldToken.name(), contractName);
    }
}
