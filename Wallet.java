
public class Wallet {
	private String address;
	private double funds;
		
	public Wallet(String address, double funds) {
		this.address = address;
		this.funds = funds;
	}
	
	public double getFunds() {
		return funds;
	}
	
	public void add(double d) {
		funds += d;
	}
}
