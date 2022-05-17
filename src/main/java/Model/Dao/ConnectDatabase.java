package Model.Dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDatabase {
	private static final String url = "jdbc:mysql://localhost:3306/quanlychothuesanpham";
	private static final String username = "root";
	private static final String password = "5071"; // password login mysql

	public Connection getConnection() throws Exception{
		return DriverManager.getConnection(url, username, password);
	}
}
