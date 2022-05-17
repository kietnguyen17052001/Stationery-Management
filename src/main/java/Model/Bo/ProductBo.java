package Model.Bo;

import java.util.List;

import Model.Bean.Product;
import Model.Dao.ProductDao;

public class ProductBo {
	ProductDao dao = new ProductDao();

	public Product getProduct(int id) throws Exception {
		return dao.getProduct(id);
	}

	public List<Product> getListProduct(String content) throws Exception {
		return dao.getListProduct(content);
	}
	
	public void decreaseQuantity(Product product, int quantity) throws Exception{
		dao.decreaseQuantity(product, quantity);
	}
}
