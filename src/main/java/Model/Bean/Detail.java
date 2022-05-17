package Model.Bean;

public class Detail {
	private int idInvoice;
	private Product product;
	private int quantity;
	private int time;
	private float intoMoney;
	private boolean status;

	public Detail(int idInvoice, Product product, int quantity, int time, float intoMoney, boolean status) {
		this.idInvoice = idInvoice;
		this.product = product;
		this.quantity = quantity;
		this.time = time;
		this.intoMoney = intoMoney;
		this.status = status;
	}

	public Detail() {
		// TODO Auto-generated constructor stub
	}

	public int getIdInvoice() {
		return idInvoice;
	}

	public void setIdInvoice(int idInvoice) {
		this.idInvoice = idInvoice;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public float getIntoMoney() {
		return intoMoney;
	}

	public void setIntoMoney(float intoMoney) {
		this.intoMoney = intoMoney;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}
