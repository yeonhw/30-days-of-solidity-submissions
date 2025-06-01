// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;


contract Counter {
    uint256 count =0;



    function click() public {
        count++;
    }
}