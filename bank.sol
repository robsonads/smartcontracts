pragma solidity 0.4.0;

contract BankContract {
 //
    uint private balance;
    address public owner;

    event DepositEvent (uint amount, uint balance);
    event WithdrawtEvent (uint amount, uint balance);

    function BankContract(){
        owner = msg.sender;
    }

    function deposit () public payable {
        balance += msg.value;
        DepositEvent(msg.value, balance);
    }

    function emprestimo(uint valor){
        balance -= valor;
        DepositEvent(msg.value, balance);
    }

    function withdraw (uint amount) public {
        if(msg.sender == owner && balance >= amount){
            balance -= amount;

            if(!msg.sender.send(amount)){
                balance += amount;
            }else{
                WithdrawtEvent(amount, balance);
            }
        }
    }

    function getBalance() public returns (uint){
        return balance;
    }

}