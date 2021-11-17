
public class Block {
	private String address;
	private boolean mined;
	
	public Block(String address, boolean mined) {
		this.address = address;
		this.mined = mined;
	}
	
	public String getAddress() {
		return address;
	}
	
	public boolean isMined() {
		return mined;
	}
}
