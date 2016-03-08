/**
This is the respective to the "Hello world" example of any other language.
**/
contract Greeter {

	// Define variable owner of the type address
    address owner;
    // Define variable greeting of the type string
    string greeting;
        
    // This runs when the contract is executed
    function Greeter(string _greeting) public {
        owner = msg.sender;
        greeting = _greeting;
    }

    // Main function
    function greet() constant returns (string) {
        return greeting;
    }

    // Function to recover the funds on the contract
    function kill() { 
    	if (msg.sender == owner) {
    		suicide(owner); 
    	}
   	}
}