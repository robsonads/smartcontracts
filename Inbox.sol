contract Inbox {
   string public message;

   int public total;

   //constructorx
   function Inbox( string initMensagem ) public{
       message = initMensagem;
   }

   function setMessage(string newMsg) public{
       message = newMsg;
   }

   function setValor(int valor) public{
       total = valor * 2;

   }
}