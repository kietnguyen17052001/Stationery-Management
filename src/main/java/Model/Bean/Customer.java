package Model.Bean;

public class Customer {
	private int id;
	private String name;
	private String cmnd;
	private String gender;
	private String phone;
	private String address;

	public Customer(int id, String name, String cmnd, String gender, String phone, String address) {
		this.id = id;
		this.name = name;
		this.cmnd = cmnd;
		this.setGender(gender);
		this.phone = phone;
		this.address = address;
	}

	public Customer() {
		// TODO Auto-generated constructor stub
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

	public String getCmnd() {
		return cmnd;
	}

	public void setCmnd(String cmnd) {
		this.cmnd = cmnd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

}
