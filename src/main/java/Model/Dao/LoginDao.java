package Model.Dao;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Model.Bean.Account;

public class LoginDao {
	ConnectDatabase connectDatabase = new ConnectDatabase();

	// encrypt password
	public String encrypt(String password) throws Exception {
		StringBuilder sbuilder = new StringBuilder();
		MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
		mDigest.update(password.getBytes());
		byte[] b = mDigest.digest();
		for (byte _b : b) {
			sbuilder.append(Integer.toHexString(0xFF & _b));
		}
		return sbuilder.toString();
	}

	// get account
	public Account getAccount(String username, String password) throws Exception {
		Account account = null;
		Connection connection = connectDatabase.getConnection();
		String query = "Select * from account where Username = ? and MatKhau = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setString(1, username);
		statement.setString(2, encrypt(password));
		ResultSet set = statement.executeQuery();
		while (set.next()) {
			account = new Account();
			account.setId(set.getInt(1));
			account.setUsername(set.getString(2));
			account.setDisplayName(set.getString(3));
			account.setPassword(set.getString(4));
			account.setTypeAccount(set.getInt(5));
		}
		return account;
	}
}
