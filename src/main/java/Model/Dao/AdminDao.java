package Model.Dao;

import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;

import Model.Bean.Account;

public class AdminDao {
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

	public Account changeNameAccount(Account account, String name) throws Exception {
		Connection connection = connectDatabase.getConnection();
		Account accountUpdate = account;
		String query = "Update account set Display_name = ? where Acc_id = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setString(1, name);
		statement.setInt(2, account.getId());
		statement.executeUpdate();
		accountUpdate.setDisplayName(name);
		return accountUpdate;
	}

	public Account changePasswordAccount(Account account, String curPassword, String newPassword) throws Exception {
		Connection connection = connectDatabase.getConnection();
		Account accountUpdate = null;
		if (!account.getPassword().equals(encrypt(curPassword))) {
			return accountUpdate;
		} else {
			String query = "Update account set MatKhau = ? where Acc_id = ?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, encrypt(newPassword));
			statement.setInt(2, account.getId());
			statement.executeUpdate();
			accountUpdate = account;
			accountUpdate.setPassword(encrypt(newPassword));
		}
		return accountUpdate;
	}
}
