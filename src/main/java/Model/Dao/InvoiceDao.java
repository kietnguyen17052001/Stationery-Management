package Model.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Model.Bean.Customer;
import Model.Bean.Detail;
import Model.Bean.Invoice;

public class InvoiceDao {
	ConnectDatabase connectDatabase = new ConnectDatabase();
	DetailInvoiceDao detailInvoiceDao = new DetailInvoiceDao();

	public List<Invoice> getListInvoice(String content) throws Exception {
		List<Invoice> invoices = new ArrayList<Invoice>();
		CustomerDao customerDao = new CustomerDao();
		Invoice invoice = null;
		Connection connection = connectDatabase.getConnection();
		String query = (content == null || content.equals("")) ? "Select * from quanlydonhang"
				: "Select * from quanlydonhang inner join khachhang on quanlydonhang.MaKH = khachhang.MaKH where khachhang.TenKH like ? or quanlydonhang.MaDH like ?";
		PreparedStatement statement = connection.prepareStatement(query);
		if (content != null && !content.equals("")) {
			statement.setString(1, "%" + content + "%");
			statement.setString(2, "%" + content + "%");
		}
		ResultSet set = statement.executeQuery();
		while (set.next()) {
			invoice = new Invoice();
			invoice.setId(set.getInt(1));
			invoice.setCustomer(customerDao.getCustomer(true, String.valueOf(set.getInt(2))));
			invoice.setTime(set.getObject(3));
			invoice.setTotalMoney(set.getFloat(4));
			invoices.add(invoice);
		}
		return invoices;
	}

	public List<Invoice> getListInvoiceByIdCustomer(int idCustomer) throws Exception {
		List<Invoice> invoices = new ArrayList<Invoice>();
		CustomerDao customerDao = new CustomerDao();
		Invoice invoice = null;
		Connection connection = connectDatabase.getConnection();
		String query = "Select * from quanlydonhang where MaKH = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setInt(1, idCustomer);
		ResultSet set = statement.executeQuery();
		while (set.next()) {
			invoice = new Invoice();
			invoice.setId(set.getInt(1));
			invoice.setCustomer(customerDao.getCustomer(true, String.valueOf(set.getInt(2))));
			invoice.setTime(set.getObject(3));
			invoice.setTotalMoney(set.getFloat(4));
			invoices.add(invoice);
		}
		return invoices;
	}

//	public void deleteInvoiceByIdCustomer(int idCustomer) throws Exception {
//		Connection connection = connectDatabase.getConnection();
//		String query = "Delete from quanlydonhang where MaKH = ?";
//		PreparedStatement statement = connection.prepareStatement(query);
//		statement.setInt(1, idCustomer);
//		statement.executeUpdate();
//	}

	public void saveInvoice(Customer customer, List<Detail> details) throws Exception {
		Connection connection = connectDatabase.getConnection();
		String query = "Insert into quanlydonhang(MaKH, ThoiGianThue, TongCong) values(?,?,?)";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setInt(1, customer.getId());
		statement.setObject(2, new Date());
		statement.setFloat(3, totalMoneyInvoice(details));
		statement.executeUpdate();
		query = "Select * from quanlydonhang Order By MaDH desc Limit 1";
		statement = connection.prepareStatement(query);
		ResultSet set = statement.executeQuery();
		int idInvoice = 0;
		while (set.next()) {
			idInvoice = set.getInt(1);
		}
		for (Detail detail : details) {
			if (!detail.isStatus()) {
				detail.setIdInvoice(idInvoice);
				detailInvoiceDao.saveDetailInvoice(detail);
			}
		}
	}

	public void delete(int idInvoice) throws Exception {
		Connection connection = connectDatabase.getConnection();
		DetailInvoiceDao detailInvoiceDao = new DetailInvoiceDao();
		for (Detail detail : detailInvoiceDao.getListDetail(idInvoice)) {
			detailInvoiceDao.delete(true, idInvoice, 0);
		}
		String query = "Delete from quanlydonhang where MaDH = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setInt(1, idInvoice);
		statement.executeUpdate();
	}

	public float totalMoneyInvoice(List<Detail> details) {
		float totalMoney = 0;
		for (Detail detail : details) {
			if (!detail.isStatus()) {
				totalMoney += detail.getIntoMoney();
			}
		}
		return totalMoney;
	}

}
