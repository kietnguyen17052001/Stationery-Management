package Model.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Model.Bean.Customer;
import Model.Bean.Detail;
import Model.Bean.Invoice;

public class CustomerDao {
	ConnectDatabase connectDatabase = new ConnectDatabase();

	public List<Customer> getListCustomer(String content) throws Exception {
		List<Customer> customers = new ArrayList<Customer>();
		Customer customer = null;
		Connection connection = connectDatabase.getConnection();
		String query = (content == null || content.equals("")) ? "Select * from khachhang"
				: "Select * from khachhang where TenKH like ? or SoDienThoai like ?";
		PreparedStatement statement = connection.prepareStatement(query);
		if (content != null && !content.equals("")) {
			statement.setString(1, "%" + content + "%");
			statement.setString(2, "%" + content + "%");
		}
		ResultSet set = statement.executeQuery();
		while (set.next()) {
			customer = new Customer();
			customer.setId(set.getInt(1));
			customer.setName(set.getString(2));
			customer.setCmnd(set.getString(3));
			customer.setPhone(set.getString(4));
			customer.setAddress(set.getString(5));
			customer.setGender(set.getString(6));
			customers.add(customer);
		}
		return customers;
	}

	public Customer getCustomer(boolean isId, String content) throws Exception {
		Customer customer = null;
		Connection connection = connectDatabase.getConnection();
		String query = isId ? "Select * from khachhang where MaKH = ? " : "Select * from khachhang where CMND = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		if (isId) {
			statement.setInt(1, Integer.parseInt(content));
		} else {
			statement.setString(1, content);
		}
		ResultSet set = statement.executeQuery();
		while (set.next()) {
			customer = new Customer();
			customer.setId(set.getInt(1));
			customer.setName(set.getString(2));
			customer.setCmnd(set.getString(3));
			customer.setPhone(set.getString(4));
			customer.setAddress(set.getString(5));
			customer.setGender(set.getString(6));
		}
		return customer;
	}

	public void create(Customer customer) throws Exception {
		Connection connection = connectDatabase.getConnection();
		String query = "Insert into khachhang(tenKH, CMND, SoDienThoai, DiaChi, GioiTinh) values(?,?,?,?,?)";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setString(1, customer.getName());
		statement.setString(2, customer.getCmnd());
		statement.setString(3, customer.getPhone());
		statement.setString(4, customer.getAddress());
		statement.setString(5, customer.getGender());
		statement.executeUpdate();
	}

	public void delete(int idCustomer) throws Exception {
		Connection connection = connectDatabase.getConnection();
		InvoiceDao invoiceDao = new InvoiceDao();
		DetailInvoiceDao detailInvoiceDao = new DetailInvoiceDao();
		List<Invoice> invoices = invoiceDao.getListInvoiceByIdCustomer(idCustomer);
		List<Detail> details = null;
		for (Invoice invoice : invoices) {
			details = detailInvoiceDao.getListDetail(invoice.getId());
			for (Detail detail : details) {
				detailInvoiceDao.delete(true, detail.getIdInvoice(), 0);
			}
			invoiceDao.delete(invoice.getId());
		}
		String query = "Delete from khachhang where MaKH = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setInt(1, idCustomer);
		statement.executeUpdate();
	}

	public boolean isHasCustomer(Customer customer) throws Exception {
		Connection connection = connectDatabase.getConnection();
		String query = "Select * from khachhang where CMND = ?";
		PreparedStatement statement = connection.prepareStatement(query);
		statement.setString(1, customer.getCmnd());
		return statement.executeQuery().next();
	}
}
