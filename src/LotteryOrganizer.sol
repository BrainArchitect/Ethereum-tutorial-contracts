/*
This is the LotteryOrganizer contract. It allows the creator of the contract to set up a lottery,
that people can join by buying their ticket. After the number of available tickets have been bought,
the lottery stops accepting any more buyers and determines the winner.
*/

contract LotteryOrganizer { 

    address creator;
    Lottery lottery;
    bool lotteryActive;
    string[] participants;
    
    struct Lottery
    {
        uint noOfTickets;
        uint ticketPrice;
        string winner;
    }
    
    function LotteryOrganizer()
    {
        creator = msg.sender;
        lotteryActive = false;
    }
    
    function createNewLottery(uint _noOfTickets, uint _ticketPrice) 
    {
        if (msg.sender != creator || lotteryActive) {
            throw;
        }
    
        lottery = Lottery ({
            noOfTickets : _noOfTickets,
            ticketPrice : _ticketPrice,
            winner : ""
        });
    }
    
    function buyTicket(string _name) {
        participants.push(_name);
        lottery.noOfTickets--;
        if (lottery.noOfTickets == 0) {
            pickWinner();
        }
    }
    
    function kill()
    { 
        if (msg.sender == creator)
        {
            // Kill this contract and send any remaining funds back to creator.
            suicide(creator);  
        }
    }
    
    function pickWinner() {
        lotteryActive = false;
        uint number = generateRandomNumber(0, lottery.noOfTickets);
        lottery.winner = participants[number];
    }
    
    function generateRandomNumber(uint start, uint end) returns (uint winningNumber){
        return 1;
    }
}