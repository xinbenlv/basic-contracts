pragma solidity ^0.4.22;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";


/**
  A simplest vote interface.
  (1) single issue
  (2) only TRUE or FALSE
  (3) no voting time limit
  (4) each address has the same weight.
 */
contract SimplestVote {


    mapping(address => bool) public ballots;
    mapping(bool => uint256) public counts;

    /* Send coins */
    function vote(bool value) public {
        ballots[msg.sender] = value;
    }

    function getResult() public view returns(bool result) {
        return counts[true] >= counts[false];
    }

}