contract LotteryOrganizer { 

    address creator;
    Lottery[] public lotteries;
    
    struct Lottery
    {
        uint noOfTickets;
        uint ticketPrice;
        bool active;
        address winner;
    }
    
    function LotteryOrganizer() public
    {
        creator = msg.sender;
    }
    
    function createNewLottery(uint _noOfTickets, uint _ticketPrice) 
    {
        if (msg.sender != creator) {
            throw;
        }
        
        for (uint i = 0; i < lotteries.length; ++i) {
            var foundActive = false;
            if () {
                
            }
        }
        
        lotteries.push(
            Lottery ({
                noOfTickets : _noOfTickets,
                ticketPrice : _ticketPrice,
                active : true,
                winner : 0
            }));
    }
    
    function kill()
    { 
        if (msg.sender == creator)
        {
            // Kill this contract and send any remaining funds back to creator.
            suicide(creator);  
        }
    }
}