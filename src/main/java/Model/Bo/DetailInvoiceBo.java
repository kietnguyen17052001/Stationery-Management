package Model.Bo;

import java.util.List;

import Model.Bean.Detail;
import Model.Dao.DetailInvoiceDao;

public class DetailInvoiceBo {
	DetailInvoiceDao dao = new DetailInvoiceDao();

	public List<Detail> getListDetail(int idInvoice) throws Exception {
		return dao.getListDetail(idInvoice);
	}

	public void delete(boolean isIdInvoice, int id, int idProduct) throws Exception {
		dao.delete(isIdInvoice, id, idProduct);
	}
}
