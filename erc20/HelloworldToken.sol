pragma solidity 0.4.20;


/**
// A hello world token that can be created. Originally from https://github.com/charlesmarino1/simpleToken
// The token standard is unknown, but seems partially compatible with ERC20
// missing transferFrom, approve
// This contract does the following things
//
// 1. Create a token partically compatible with ERC20, meaning you can use many ERC20 compatible wallets with the
// token you created. Such as MetaMask.
// 2. Give all initial supply to the creator (you). Well now you can give it to anyone
// 3. Upon request, transfer the money from one address to another, and
 */
contract HelloWorldToken {
    /* Public variables of the token */
    string public standard = "Token 0.1";
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    /* This creates an array with all balances */
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    /* This generates a public event on the blockchain that will notify clients */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /* Initializes contract with initial supply tokens to the creator of the contract */
    function HelloWorldToken(
        uint256 initialSupply,
        string tokenName,
        uint8 decimalUnits,
        string tokenSymbol
    ) public {
        balanceOf[msg.sender] = initialSupply;
        // Give the creator all initial tokens
        totalSupply = initialSupply;
        // Update total supply
        name = tokenName;
        // Set the name for display purposes
        symbol = tokenSymbol;
        // Set the symbol for display purposes
        decimals = decimalUnits;
        // Amount of decimals for display purposes
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= _value);
        // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) revert();
        // Check for overflows
        balanceOf[msg.sender] -= _value;
        // Subtract from the sender
        balanceOf[_to] += _value;
        // Add the same to the recipient
        emit Transfer(msg.sender, _to, _value);
        // Notify anyone listening that this transfer took place
    }
}