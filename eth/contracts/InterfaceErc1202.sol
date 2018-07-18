
/**
 * - Single issue
 * - Single selection
 *
 * Discussion:
 *   1. Each address has a weight determined by other input decided by the actual implementation
 *      which is suggested to be set upon the initialization
 *   2. Is there certain naming convention to follow?
 */
interface InterfaceErc1202 {

    function ballotOf(address addr) public view returns (uint option);
    function weightOf(address addr) public view returns (uint weight);

    function getStatus() public view returns (bool isOpen);
    function setStatus(bool isOpen) public returns (bool success);

    function weightedVoteCountsOf(uint option) public view returns (uint count);
    function winningOption() public view returns (uint option);

    // Vote with an option. The caller needs to handle success or not
    function vote(uint option) returns (bool success);

    event OnVote(address indexed _from, uint _value);
    event OnStatusChange(bool newIsOpen);
}