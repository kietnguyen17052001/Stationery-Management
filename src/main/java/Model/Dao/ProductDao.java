package Model.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.Bean.Product;

public class ProductDao {
	ConnectDatabase connectDatabase = new ConnectDatabase();

	public Product getProduct(int id) throws Exception {
		Product product = null;
		Connection connection = connectDatabase.getConnection();
		String query = "Select * from sanpham where MaSP = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setInt(1, id);
		ResultSet set = statement.executeQuery();
		while (set.next()) {
			product = new Product();
			product.setId(set.getInt(1));
			product.setName(set.getString(2));
			product.setPrice(set.getFloat(3));
			product.setQuantity(set.getInt(4));
			product.setImage(set.getString(5));
			product.setDescribe(set.getString(6));
		}
		return product;
	}

	public List<Product> getListProduct(String content) throws Exception {
		List<Product> products = new ArrayList<>();
		Product product = null;
		Connection connection = connectDatabase.getConnection();
		String query = (content == null || content.equals("")) ? "Select * from sanpham" : "Select * from sanpham where TenSanPham like ?";
		PreparedStatement statement = connection.prepareStatement(query);
		if (content != null && !content.equals("")) {
			statement.setString(1, "%" + content + "%");
		}
		ResultSet set = statement.executeQuery();
		while (set.next()) {
			product = new Product();
			product.setId(set.getInt(1));
			product.setName(set.getString(2));
			product.setPrice(set.getFloat(3));
			product.setQuantity(set.getInt(4));
			product.setImage(set.getString(5));
			product.setDescribe(set.getString(6));
			products.add(product);
		}
		return products;
	}

	public void decreaseQuantity(Product product, int quantity) throws Exception {
		Connection connection = connectDatabase.getConnection();
		String query = "Update sanpham set SoLuongSP = ? where MaSP = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setFloat(1, product.getQuantity() - quantity);
		statement.setInt(2, product.getId());
		statement.executeUpdate();
	}

}
