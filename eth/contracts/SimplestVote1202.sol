pragma solidity ^0.4.22;

import "./InterfaceErc1202.sol";


/**
  A simplest vote interface.
  (1) single issue
  (2) only 1 or 2 as the vote option
  (3) no voting time limit
  (4) each address can only vote once.
  (5) each address has the same weight.
 */
contract SimplestVote1202 is InterfaceErc1202 {

    mapping (uint => uint) private voteCounts;

    mapping (address => uint) public ballotOf;

    function weightOf(address addr) public returns (uint weight) {
        return 1;
    }

    function getStatus() public view returns (bool isOpen) {
        return true; // always open
    }

    function setStatus(bool isOpen) public returns (bool success) {
        require(false); // always reject status change in this implementation
    }

    function weightedVoteCountsOf(uint option) public view returns (uint count) {
        return voteCounts(option);
    }

    function winningOption() public view returns (uint option) {
        if (voteCounts[1] >= voteCounts[2]) {
            return 1;
        } else {
            return 2;
        }
    }

    function vote(uint option) returns (bool success) {
        require(option == 1 || option == 2, "vote option has to be 1 or 2.");
        require(ballotOf[msg.sender] == 0, "The sender has casted ballots."); // no re-vote
        ballotOf[msg.sender] = option;
        voteCounts[option] = voteCounts[option] + 1;
        emit OnVote(msg.sender, option);
        return true;
    }

    event OnVote(address indexed _from, uint _value);
    event OnStatusChange(bool newIsOpen);
}