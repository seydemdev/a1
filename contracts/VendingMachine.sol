// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract VendingMachine {

    address public immutable owner;

    mapping(address => uint256) public donutBalances;

    constructor() {
        owner = msg.sender;
        donutBalances[address(this)] = 100;
    }

    function getVendingMachineBalance() external view returns (uint256) {
        return donutBalances[address(this)];
    }

    function restock(uint256 amount) external {
        require(msg.sender == owner, "Not owner");
        donutBalances[address(this)] += amount;
    }

    function purchase(uint256 amount) external payable {
        require(msg.value >= amount * 1 ether, "Need to pay at least 1 ETH");
        require(donutBalances[address(this)] >= amount, "Not enough donuts in stock");
        donutBalances[address(this)] -= amount;
        donutBalances[msg.sender] += amount;
    }
}
