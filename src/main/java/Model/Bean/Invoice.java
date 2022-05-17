package Model.Bean;

public class Invoice {
	private int id;
	private Customer customer;
	private Object time;
	private float totalMoney;

	public Invoice(int id, Customer customer, Object time, float totalMoney) {
		this.id = id;
		this.setCustomer(customer);
		this.time = time;
		this.totalMoney = totalMoney;
	}

	public Invoice() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Object getTime() {
		return time;
	}

	public void setTime(Object time) {
		this.time = time;
	}

	public float getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(float totalMoney) {
		this.totalMoney = totalMoney;
	}

}
