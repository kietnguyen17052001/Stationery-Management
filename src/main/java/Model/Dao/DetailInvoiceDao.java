package Model.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.Bean.Detail;

public class DetailInvoiceDao {
	ConnectDatabase connectDatabase = new ConnectDatabase();

	public void saveDetailInvoice(Detail detail) throws Exception {
		Connection connection = connectDatabase.getConnection();
		String query = "Insert into quanlydonhangchitiet(MaDH, MaSP, ThanhTien, SoLuong, ThoiGianThue) values(?,?,?,?,?)";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setInt(1, detail.getIdInvoice());
		statement.setInt(2, detail.getProduct().getId());
		statement.setFloat(3, detail.getIntoMoney());
		statement.setInt(4, detail.getQuantity());
		statement.setInt(5, detail.getTime());
		statement.executeUpdate();
	}

	public List<Detail> getListDetail(int idInvoice) throws Exception {
		Connection connection = connectDatabase.getConnection();
		ProductDao productDao = new ProductDao();
		List<Detail> details = new ArrayList<Detail>();
		Detail detail = null;
		String query = "Select * from quanlydonhangchitiet where MaDH = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setInt(1, idInvoice);
		ResultSet set = statement.executeQuery();
		while (set.next()) {
			detail = new Detail();
			detail.setIdInvoice(set.getInt(1));
			detail.setProduct(productDao.getProduct(set.getInt(2)));
			detail.setIntoMoney(set.getFloat(3));
			detail.setQuantity(set.getInt(4));
			detail.setTime(set.getInt(5));
			details.add(detail);
		}
		return details;
	}

	public void delete(boolean isIdInvoice, int id, int idProduct) throws Exception {
		List<Detail> details = getListDetail(id);
		if (!isIdInvoice) {
			if (details.size() == 1) {
				InvoiceDao invoiceDao = new InvoiceDao();
				invoiceDao.delete(id);
			}
		} else {
			Connection connection = connectDatabase.getConnection();
			String query = isIdInvoice ? "Delete from quanlydonhangchitiet where MaDH = ?"
					: "Delete from quanlydonhangchitiet where MaDH = ? and MaSP = ?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, id);
			if (!isIdInvoice) {
				statement.setInt(2, idProduct);
			}
			statement.executeUpdate();
		}
	}
}
