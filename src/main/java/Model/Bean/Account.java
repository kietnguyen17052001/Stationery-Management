package Model.Bean;

public class Account {
	private int id;
	private String username;
	private String displayName;
	private String password;
	private int typeAccount;

	public Account(int id, String username, String displayName, String password, int typeAccount) {
		this.id = id;
		this.username = username;
		this.displayName = displayName;
		this.password = password;
		this.typeAccount = typeAccount;
	}

	public Account() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getDisplayName() {
		return displayName;
	}

	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getTypeAccount() {
		return typeAccount;
	}

	public void setTypeAccount(int typeAccount) {
		this.typeAccount = typeAccount;
	}

}
