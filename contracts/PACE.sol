pragma solidity ^0.4.0;

  // Zuerst müssen die Funktionen des Interface in konkrete Angaben des Tokens umgesetzt werden
  // constant = value cannot chance
  // msg.sender = Die Adresse, die momentan mit dem Smart Contract interagiert


import "ERC20_Interface.sol"

contract PACE is ERC20 {
    string public constant symbol = "RLE";
    string public constant name = "RLE_Coin";
    uint8 public constant decimals = 18;


    uint private constant __totalSupply = 1000;

    // die Balance eines Users wird mit der Adresse gleichgesetzt
    mapping (address => uint) private __balanceOf;

    //erlauben das jemand den Token eines anderen verschieben kann
    mapping (address => mapping (address => uint)) private __allowance;

    //Der Ersteller des Smart Contract hat die Kontrolle über den total Supply
    //Damit wird verhindert das sich jemand auf irgendeiner Weise eigene Tokens erstellen kann
    function RLE_Coin() {
      __balanceOf[msg.sender] = __totalSupply;

    }


    //Maximale Anzahl der Token = 1000
    function totalSupply() constant returns (uint _totalSupply) {
        _totalSupply = __totalSupply;
    }

    //Hier wird der Ort für das Speichern des Balance angegeben
    function balanceOf(address _addr) constant returns (uint balance) {
         return __balanceOf[addr];

    }

    // Es wird geprüft ob genug Balance für einen Transfer vorhanden ist.
    function transfer(address _to, uint _value) returns (bool success) {
        if (_value > 0 && _value <= balanceOf(msg.sender)) {
            __balanceOf[msg.sender] -= _value;
            __balanceOf[_to] += _value;
            return true;
        }
        return false;

    }

    //Wird erlauben das jemand auf Befehl Tokens unserer Wallet transferiert
    function transferFrom(address _from, address _to uint _value) returns (bool success); {
      if  (__allowances[_from][msg.sender] > 0 &&
          _value >0 &&
          __allowances[_from][msg.sender] >= _value) {
          __balanceOf[_from] -= _value;
          __balanceOf[_to] += _value;
            return true;
          }
            return false
          }

    //Hiermit wird Erlaubnis erteilt, dass jemand den Token eines anderen verschieben kann
    function approve(address _owner, address spender) constant returns (uint); {
      __allowance[msg.sender][_spender] = _value;
      return true;
      }

    // 1: Es wird erst geprüft ob der Besitzer und derjenige der den Smart Contract aufruft durch allowance klargestellt ist
    // 2: Könnte allerdings probleme bringen, wenn der User undefiniert ist --> owner, msg.sender
    // 3: Derjenige hat dann die Rechte Token zu transferieren
    function allowance(address _owner; address _spender) constant returns (uint remaining); {
      return __allowances[_owner][_spender];
       {




}
