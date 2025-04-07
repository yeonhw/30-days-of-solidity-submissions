// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;


interface IERC20 {
    function transfer(address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract SendSomeToken{

    // Build a contract to send tokens 
    // (digital assets) to other users. 
    // You'll learn how to transfer tokens 
    // between addresses, understand gas fees 
    // (the cost of using the blockchain; 
    // using payable), and make sure everything 
    // is done correctly (using require for validation). 
    // It's like sending digital money to a friend,
    // showing how to manage token transfers and handle
    // gas
    
    address public sender;

    // Initializing the sender to be the deployer 
    // of the smart contract

    constructor() {
        sender = msg.sender;
    }


    // Allow this contract to receive Ether
    receive() external payable {}

   // Function to check the token balance of this contract
    function getTokenBalance(address _tokenAddress) public view returns (uint256) {
        return IERC20(_tokenAddress).balanceOf(address(this));
    }


    modifier onlyOwner(){
        require(msg.sender == sender, "Only the owner can send tokens");
        _;
    }

     // Send ERC-20 tokens to a recipient
    function sendTokenToReceiver(
        address _tokenAddress, 
        address _to, 
        uint256 _amount
    ) external onlyOwner {
        require(_to != address(0), "Invalid recipient address");
        require(_amount > 0, "Amount must be greater than zero");

        IERC20 token = IERC20(_tokenAddress);

        // Check if the contract has enough tokens
        require(token.balanceOf(address(this)) >= _amount, "Insufficient token balance in contract");

        // Transfer the token
        bool sent = token.transfer(_to, _amount);
        require(sent, "Token transfer failed");
    }

}