pragma solidity ^0.5.0;

import "browser/ERC20.sol";

interface ERC20 {

    function totalSupply() constant returns (uint _totalSupply);
    function balanceOf(address_owner) constant returns (uint balance);
    function transfer(address _to, uint _value) returns (bool success);
    function transferFrom(address _from, address _to uint _value) returns (bool success);
    function approve(address _owner, address spender) constant returns (uint);
    function allowance(address _owner; address _spender) constant returns (uint remaining);
    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);
