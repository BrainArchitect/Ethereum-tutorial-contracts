/*
You'll notice that there are two different contracts in this code: "Mortal" and "Greeter". 
This is because Solidity (the high level contract language we are using) has inheritance, 
meaning that one contract can inherit characteristics of another. This is very useful to 
simplify coding as common traits of contracts don't need to be rewritten every time, and 
all contracts can be written in smaller, more readable chunks. So by just declaring that 
greeter is mortal you inherited all characteristics from the "mortal" contract and kept 
the greeter code simple and easy to read.

The inherited characteristic "mortal" simply means that the greeter contract can be killed 
by its owner, to clean up the blockchain and recover funds locked into it when the contract 
is no longer needed. Contracts in ethereum are, by default, immortal and have no owner, 
meaning that once deployed the author has no special privileges anymore. Consider this before 
deploying.
*/

contract Mortal {
    // Define variable owner of the type address:
    address owner;

    // This function is executed at initialization and sets the owner of the contract:
    function mortal() { 
    	owner = msg.sender; 
   	}

    // Function to recover the funds on the contract:
    function kill() {
    	if (msg.sender == owner) {
    		suicide(owner); 
    	}
    }
}

contract Greeter is Mortal {
    // Define variable greeting of the type string:
    string greeting;

    // This runs when the contract is executed:
    function greeter(string _greeting) public {
        greeting = _greeting;
    }

    // Main function:
    function greet() constant returns (string) {
        return greeting;
    }
}
