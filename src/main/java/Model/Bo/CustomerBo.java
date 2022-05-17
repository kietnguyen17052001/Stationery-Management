package Model.Bo;

import java.util.List;

import Model.Bean.Customer;
import Model.Dao.CustomerDao;

public class CustomerBo {
	CustomerDao dao = new CustomerDao();

	public List<Customer> getListCustomer(String content) throws Exception {
		return dao.getListCustomer(content);
	}

	public Customer getCustomer(boolean isId, String cmnd) throws Exception {
		return dao.getCustomer(isId, cmnd);
	}

	public void create(Customer customer) throws Exception {
		dao.create(customer);
	}

	public void delete(int idCustomer) throws Exception {
		dao.delete(idCustomer);
	}

	public boolean isHasCustomer(Customer customer) throws Exception {
		return dao.isHasCustomer(customer);
	}
}
