// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


contract CourseCoins {

    address public minter;
    mapping(address => uint) public balances;
    
    uint public limite = 1024;

    constructor() {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insuficient balance!");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
    }

}