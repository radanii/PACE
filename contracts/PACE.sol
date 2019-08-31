pragma solidity ^0.5.0;

import "browser/ERC20.sol";

interface ERC20 {

    function totalSupply() constant returns (uint _totalSupply);
    function balanceOf(address_owner) constant returns (uint balance);
    function transfer(address _to, uint _value) returns (bool success);
    function transferFrom(address _fron, address _tom uint _value) returns (bool success);
    function approve(address _owner, address spender) constant returns (uint);
    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);


contract PACE is ERC20 {
    string public constant symbol = "PACE";
    string public constant name "PACE Token";
    uint8 public constant decimals =18;

    uint private constant __totalSupply = 1000

    mapping (address => uint) private __balanceOf;

    // constant = value cannot chance
    function totalSupply() constant returns (uint _totalSupply) {
        _totalSupply = __totalSupply;
    }

    function balanceOf(address addr) constant returns (uint balance) {
         return __balanceOf[_addr];

    }

    function Transfer(address _to, uint _value) returns (bool success) {
        if (_value <= balanceOf(msg.sender)) {
            __balanceOf[msg.sender] -= _value;
            __balanceOf[_to] += _value;
            return true;
        }
        return false;

    }

}
