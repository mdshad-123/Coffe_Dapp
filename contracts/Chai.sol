// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0 <0.9.0;

contract Chai {
    struct Memo {
        string name;
        string message;
        uint timestamp;
        address from;
    }
    
    Memo[]  memos;  // Changed 'numbers' to 'memos' and made it public for easier access
    address payable  owner;  // Made owner public for visibility

    constructor() {
        owner = payable(msg.sender);
    }

    function buyChai(string memory name, string memory message) public payable {
        require(msg.value > 0, "Please pay more than 0 ETH");  // Corrected the 'require' statement
        owner.transfer(msg.value);
        memos.push(Memo(name, message, block.timestamp, msg.sender));
    }

    function getMemos() public view returns (Memo[] memory) {
        return memos;
    }
}