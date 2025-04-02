// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.18;

contract ClickCounter {

    uint256 count;

    constructor() {
        count = 0;
    }

    function clickincrement (uint256 _increment) public {
        count += _increment;
    }

    function clickdecrement (uint256 _decrement) public {
        count -= _decrement;
    }

    function totalcount() public view returns (uint256) {
        return count;
    }


}