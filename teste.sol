pragma solidity 0.4.24;

//Interface Regulatorx
interface Regulator {
    function checkValue(uint amount) external returns (bool);
    function loan() external returns (bool);
}

contract Bank is Regulator {
    uint private value;
    address private owner;
    
    struct Teste {
        uint idade;
    }
    
    constructor(uint amount) public {
        value = amount;
        owner = msg.sender;
    }
    
    modifier ownerFunc{
         require(owner == msg.sender);
         _; //prossiga
    }
    
    function deposit(uint amount) public ownerFunc {
        value += amount;
    }
    
    function withDraw(uint amount) public ownerFunc {
        if (checkValue(amount)) {
            value -= amount;
        }
    }
    
    function balance() public view returns (uint) {
        return value;
    }
    
    function checkValue(uint amount) public returns (bool) {
        return value >= amount;
    }
    
    function loan() public returns (bool) {
        return value > 0;
    }
}

contract MyFirstContract is Bank(10) {
    string private name;
    uint private age;
    
    function setName(string newName) public {
        name = newName;
    }
    
    function getName() public view returns (string) {
        return name;
    }
    
    function setAge(uint newAge) public {
        age = newAge;
    }
    
    function getAge() public view returns (uint) {
        return age;
    }
}