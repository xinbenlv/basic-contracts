pragma solidity ^0.4.22;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";


/**
// A token that supports batch transaction to multiple addresses

Deploy: 1 - Ropsten, 0x330FfAA810f7873271C4B274975011E7E8f60C40
2.
 */
contract MultiAirDropToken {
    using SafeMath for uint256;
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
    event TransferMulti(address indexed from, address[] indexed to, uint256 value);
    event Transfer5(address indexed from, address[] indexed to, uint256 value);
    event Transfer20(address indexed from, address[] indexed to, uint256 value);

    /* Initializes contract with initial supply tokens to the creator of the contract */
    constructor(
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
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
    }

    /* Send coins */
    function transferMulti(address[] _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= (_value * _to.length));

        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_to.length * _value);
        for (uint i = 0; i<_to.length; i++) {
            balanceOf[_to[i]] = balanceOf[_to[i]].add(_value);
        }
        emit TransferMulti(msg.sender, _to, _value);
    }

        /* Send coins */
    function transfer5(address[] _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= (_value * 5));

        balanceOf[msg.sender] = balanceOf[msg.sender].sub(5 * _value);
        balanceOf[_to[0]] = balanceOf[_to[0]].add(_value);
        balanceOf[_to[1]] = balanceOf[_to[1]].add(_value);
        balanceOf[_to[2]] = balanceOf[_to[2]].add(_value);
        balanceOf[_to[3]] = balanceOf[_to[3]].add(_value);
        balanceOf[_to[4]] = balanceOf[_to[4]].add(_value);
        emit Transfer5(msg.sender, _to, _value);
    }

    function transfer20(address[] _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= (_value * 20));

        balanceOf[msg.sender] = balanceOf[msg.sender].sub(20 * _value);
        balanceOf[_to[1]] = balanceOf[_to[1]].add(_value);
        balanceOf[_to[2]] = balanceOf[_to[2]].add(_value);
        balanceOf[_to[3]] = balanceOf[_to[3]].add(_value);
        balanceOf[_to[4]] = balanceOf[_to[4]].add(_value);
        balanceOf[_to[5]] = balanceOf[_to[5]].add(_value);
        balanceOf[_to[6]] = balanceOf[_to[6]].add(_value);
        balanceOf[_to[7]] = balanceOf[_to[7]].add(_value);
        balanceOf[_to[8]] = balanceOf[_to[8]].add(_value);
        balanceOf[_to[9]] = balanceOf[_to[9]].add(_value);
        balanceOf[_to[10]] = balanceOf[_to[10]].add(_value);
        balanceOf[_to[11]] = balanceOf[_to[11]].add(_value);
        balanceOf[_to[12]] = balanceOf[_to[12]].add(_value);
        balanceOf[_to[13]] = balanceOf[_to[13]].add(_value);
        balanceOf[_to[14]] = balanceOf[_to[14]].add(_value);
        balanceOf[_to[15]] = balanceOf[_to[15]].add(_value);
        balanceOf[_to[16]] = balanceOf[_to[16]].add(_value);
        balanceOf[_to[17]] = balanceOf[_to[17]].add(_value);
        balanceOf[_to[18]] = balanceOf[_to[18]].add(_value);
        balanceOf[_to[19]] = balanceOf[_to[19]].add(_value);
        balanceOf[_to[20]] = balanceOf[_to[20]].add(_value);

        emit Transfer20(msg.sender, _to, _value);
    }
}
