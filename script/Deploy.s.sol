// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/FundingPool.sol";
import "../src/Hypercert.sol";
import "../src/MockUSDC.sol";

contract HypercertScript is Script {
	Hypercert hypercert;
	FundingPool fundingPool;
	MockUSDC mockUSDC;

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        address addr = vm.addr(vm.envUint("PRIVATE_KEY"));
		hypercert = new Hypercert("https://something.com");
		mockUSDC = new MockUSDC("USDC", "USDC", addr, 100000000000);
		fundingPool = new FundingPool(address(hypercert), address(mockUSDC));
		hypercert.setPool(address(fundingPool));
        vm.stopBroadcast();
    }
}
