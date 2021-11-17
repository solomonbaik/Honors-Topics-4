import java.util.ArrayList;

public class User {
	private String walletID;
	private ArrayList<AuctionObject> currentAuctionsSelling;
	private ArrayList<AuctionObject> currentBids;
	
	public User(String walletID) {
		this.walletID = walletID;
		currentAuctionsSelling = new ArrayList<AuctionObject>();
		currentBids = new ArrayList<AuctionObject>();
	}
	
	public void bid(double price, AuctionObject AuctionObject) throws Exception {
		if(AuctionObject == null) throw new NullPointerException("no auction exists");
		if(price < AuctionObject.getMinBid()) throw new Exception("bid more money, chump");
		if(price < AuctionObject.getMinBidIncrement()) throw new Exception("bid more money, chump");
		
		AuctionObject.setMinBid(price);
		currentBids.add(AuctionObject);
	}
	
	public void createNewAuction(double minBid, double minBidIncrement, String hash, Block auctionStartTime, Block auctionEndTime, Wallet wallet) throws Exception {
		AuctionObject auction = new AuctionObject(minBid, minBidIncrement, hash, auctionStartTime, auctionEndTime, wallet);
		
	}
	
}
