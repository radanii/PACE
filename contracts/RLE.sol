pragma solidity ^0.5.8;

  // Zuerst müssen die Funktionen des Interface in konkrete Angaben des Tokens umgesetzt werden
  // constant = value cannot chance
  // msg.sender = Die Adresse, die momentan mit dem Smart Contract interagiert

interface ERC20_Interface {

      function totalSupply() pure external returns (uint _totalSupply);
    function balanceOf(address _owner) pure external returns (uint balance);
    function transfer(address _to, uint _value) external returns (bool success);
    function transferFrom(address _from, address _to, uint _value) external returns (bool success);
    function approve(address _owner, address spender) pure external returns (uint);
    function allowance(address _owner, address _spender) pure external returns (uint remaining);
    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);

}


contract RLE {

    string public constant symbol = "RLE";
    string public constant name = "RLE_Coin";
    uint8 public constant decimals = 18;
    uint public INITIAL_SUPPLY = 12000;


    uint private constant __totalSupply = 1000000;

    // die Balance eines Users wird mit der Adresse gleichgesetzt
    mapping (address => uint) private __balanceOf;

    //erlauben das jemand den Token eines anderen verschieben kann
    mapping (address => mapping (address => uint)) private __allowance;

    //Der Ersteller des Smart Contract hat die Kontrolle über den total Supply
    //Damit wird verhindert das sich jemand auf irgendeiner Weise eigene Tokens erstellen kann
    function RLE_Coin() public {
      __balanceOf[msg.sender] = __totalSupply;

    }


    //Maximale Anzahl der Token = 1000
    function totalSupply() pure public returns (uint _totalSupply) {
        _totalSupply = __totalSupply;
    }

    //Hier wird der Ort für das Speichern des Balance angegeben
    function balanceOf(address _addr) view public returns (uint balance) {
         return __balanceOf[_addr];

    }

    // Es wird geprüft ob genug Balance für einen Transfer vorhanden ist.
    function transfer(address _to, uint _value) public returns (bool success) {
        if (_value > 0 && _value <= balanceOf(msg.sender)) {
            __balanceOf[msg.sender] -= _value;
            __balanceOf[_to] += _value;
            return true;
        }
        return false;

    }

    //Wir erlauben das jemand auf Befehl Tokens unserer Wallet transferiert
    function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
      if  (__allowance[_from][msg.sender] > 0 &&
          _value >0 &&
          __allowance[_from][msg.sender] >= _value) {
          __balanceOf[_from] -= _value;
          __balanceOf[_to] += _value;
            return true;
          }
            return false;
          }

    //Hiermit wird die Erlaubnis erteilt, dass jemand den Token eines anderen verschieben kann
    function approve(address _spender, uint _value) public returns (bool success) {
        __allowance[msg.sender][_spender] = _value;
        return true;
    }

    // 1: Es wird erst geprüft ob der Besitzer und derjenige der den Smart Contract aufruft durch allowance klargestellt ist
    // 2: Könnte allerdings probleme bringen, wenn der User undefiniert ist --> owner, msg.sender
    // 3: Derjenige hat dann die Rechte Token zu transferieren
    function allowance(address _owner, address _spender) view public returns (uint remaining) {
      return __allowance[_owner][_spender];
       {



        }
    }

}
