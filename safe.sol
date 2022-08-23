// I want to create a smart contract that acts a ethereum safe

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Commencing with the smart contract -->
contract Safe {
    address payable public beneficiary;
    uint256 public releaseTime;

    constructor(address payable _beneficiary, uint256 _releaseTime) payable {
        require(_releaseTime > block.timestamp);
        beneficiary = _beneficiary;
        releaseTime = _releaseTime;
    }

    //This checks if the stipulated time has been reached
    modifier timeCheck() {
        require(
            block.timestamp >= releaseTime,
            "Time hasn't been exhausted yet"
        );
        _;
    }

    //This function handles the release of the funds
    function release() public timeCheck {
        address(beneficiary).transfer(address(this).balance);
    }
}
