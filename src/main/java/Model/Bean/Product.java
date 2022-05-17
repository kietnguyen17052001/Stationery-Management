package Model.Bean;

public class Product {
	private int id;
	private String name;
	private float price;
	private int quantity;
	private String image;
	private String describe;

	public Product(int id, String name, float price, int quantity, String image, String describe) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
		this.image = image;
		this.describe = describe;
	}

	public Product() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

}
