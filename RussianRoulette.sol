// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.8.9;

contract RussianRoulette {
    address[] players;
    address[] losers;
    address creator;
    uint256 odds;
    uint256 playersTurn = 0;
    
    constructor(){
        creator = msg.sender;
    }
    
    function setOdds(uint256 oneInThisMany) public isOwner{
        odds = oneInThisMany;
    }
    
    function addPlayer(address Player) public hasLost(Player) isPlaying(Player){
        players.push(msg.sender);
    }
    
    function lose(address Player) private {
        losers.push(Player);
        delete players;
    }
    
    function random() view internal returns (uint) {
        uint randomnumber = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % odds;
        randomnumber = randomnumber + 1;
        return randomnumber;
    }
    
    function play() public {
        uint number = random();
        address nextplayer = players[playersTurn % players.length + 1];
        if(number == 1) lose(nextplayer);
        else playersTurn = playersTurn % players.length + 1;
    }
    
    function isALoser(address Player) public hasLost(Player){
        //lol
    }
    
    modifier hasLost(address Player) {
        bool found;
        for (uint i=0; i<losers.length; i++) {
            if (losers[i] == Player){
                found = true;
                break;
            }
        }
        require(found, "u lost already chump");
        _;
    }
    
    modifier isPlaying(address Player){
        require(playersTurn % 6 == 1, "already your turn"); //how to fix this?
        _;
    }
    
    modifier isOwner() {
        require(msg.sender == creator, "Caller is not owner");
        _;
    }
}
