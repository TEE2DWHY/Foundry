// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script} from "../lib/forge-std/src/Script.sol";
import {GLDToken} from "../src/GLDToken.sol";

contract DeployToken is Script {
    uint256 INITIAL_SUPPLY = 10000 ether;

    function run() external returns (GLDToken) {
        vm.startBroadcast();
        GLDToken gldToken = new GLDToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return gldToken;
    }
}
