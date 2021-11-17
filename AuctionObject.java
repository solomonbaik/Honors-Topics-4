
public class AuctionObject {
//    itemImage (jpg)
	private Block auctionStartTime, auctionEndTime;
	private double minBid, minBidIncrement;
	private String hash, itemDescription;
	private Wallet wallet;
		
	public AuctionObject(double minBid, double minBidIncrement, String hash, Block auctionStartTime, Block auctionEndTime, Wallet wallet) throws Exception {
		this.minBid = minBid;
		this.minBidIncrement = minBidIncrement;
		this.hash = hash;
		this.auctionStartTime = auctionStartTime;
		this.auctionEndTime = auctionEndTime;
		this.wallet = wallet;
		
		this.wallet.add(0.01 * minBid);
		
		if(minBid < 0) throw new Exception();
		if(auctionStartTime.isMined() == true || auctionEndTime.isMined() == true) throw new Exception();
		if(wallet.getFunds() < minBid) throw new Exception("not enough money nerd");
		
	}
	
	public double getMinBidIncrement() {
		return minBidIncrement;
	}
	
	public void setMinBidIncrement(double d) {
		minBidIncrement = d;
	}
	
	public double getMinBid() {
		return minBid;
	}
	public void setMinBid(double d) {
		minBid = d;
	}
	

}
