package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Bean.Detail;
import Model.Bean.Product;
import Model.Bo.ProductBo;

/**
 * Servlet implementation class CartController
 */
@WebServlet(name = "cart", urlPatterns = { "/cart" })
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public static List<Detail> cart = null;
	public HttpSession session = null;

	public CartController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session = request.getSession();
		String req = request.getParameter("del");
		if (req != null) {
			int idProduct = Integer.parseInt(request.getParameter("del"));
			cart = (ArrayList<Detail>) session.getAttribute("cart");
			for (Detail detail : cart) {
				if (detail.getProduct().getId() == idProduct) {
					cart.remove(detail);
					break;
				}
			}
			session.setAttribute("cart", cart);
		} else {
			session.removeAttribute("cart");
		}
		request.getRequestDispatcher("cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("product"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int time = Integer.parseInt(request.getParameter("time"));
		try {
			Product product = new ProductBo().getProduct(id);
			Detail detail = new Detail();
			detail.setProduct(product);
			detail.setQuantity(quantity);
			float intoMoney = (time > 3)
					? (product.getPrice() + ((product.getPrice() / quantity) * 10 / 100) * (time - 3))
					: product.getPrice() * quantity;
			detail.setTime(time);
			detail.setIntoMoney(intoMoney);
			detail.setStatus(false);
			session = request.getSession();
			cart = (ArrayList<Detail>) session.getAttribute("cart");
			if (cart == null) {
				cart = new ArrayList<Detail>();
				cart.add(detail);
			} else {
				boolean hasProduct = false;
				for (Detail d : cart) {
					if (d.getProduct().getId() == product.getId()) {
						hasProduct = true;
						if (d.isStatus() == false) {
							d.setQuantity(d.getQuantity() + quantity);
							d.setTime(d.getTime() + time);
							d.setIntoMoney(d.getIntoMoney() + intoMoney);
						} else {
							cart.add(detail);
						}
						break;
					}
				}
				if (!hasProduct) {
					cart.add(detail);
				}
			}
			session.setAttribute("cart", cart);
			List<Product> products = new ProductBo().getListProduct(null);
			request.setAttribute("products", products);
			request.getRequestDispatcher("rent_product.jsp").forward(request, response);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
