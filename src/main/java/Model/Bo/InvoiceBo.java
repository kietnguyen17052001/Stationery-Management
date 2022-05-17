package Model.Bo;

import java.util.List;

import Model.Bean.Customer;
import Model.Bean.Detail;
import Model.Bean.Invoice;
import Model.Dao.InvoiceDao;

public class InvoiceBo {
	InvoiceDao dao = new InvoiceDao();

	public List<Invoice> getListInvoice(String content) throws Exception {
		return dao.getListInvoice(content);
	}

	public void saveInvoice(Customer customer, List<Detail> details) throws Exception {
		dao.saveInvoice(customer, details);
	}

	public void delete(int idInvoice) throws Exception {
		dao.delete(idInvoice);
	}
}
