// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.8.9;
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract Auction{
    uint256 highestBid;
    address highestBidder; 
    IERC721 public nft;
    uint public nftId;
    address payable public seller;
    address public winner;
    mapping(address => uint) public bids;
    uint public startAt;
    uint public expiresAt;


    
    constructor(address _nft, uint _nftId) {
        seller = payable(msg.sender);
        nft = IERC721(_nft);
        nftId = _nftId;
        startAt = block.timestamp;
        expiresAt = block.timestamp + 10 hours;
    }
    
    function setNFT(address _nft, uint _nftId) public {
        nft = IERC721(_nft);
        nftId = _nftId;
    }
    
    function inputBid(uint newBid) public timeLeft{
        if(bids[msg.sender] < newBid){
            bids[msg.sender] = newBid;
            setHighestBid(newBid, msg.sender);
        }
   }
    
    function getHighestBid() public view returns (uint256)  {
        return highestBid;
    }
    
    function getHighestBidder() public view returns (address) {
        return highestBidder;
    }
    
    function setHighestBid(uint256 _highestBid, address _highestBidder) private {
        highestBid = _highestBid;
        highestBidder = _highestBidder;
    }
    
    function endAuction() internal {
        win();
    }
    
    function win() public payable timeLeft{
        winner = msg.sender;
        nft.safeTransferFrom(address(this), msg.sender, nftId); //or address(this) instead of seller?
        seller.transfer(msg.value);

        emit PrintWin(msg.sender, msg.value);
    }
    
    modifier timeLeft(){
        require(block.timestamp < expiresAt, "auction expired");
        _;
    }
    
    event PrintWin(address winner, uint256 amount);
    
    
    
}
