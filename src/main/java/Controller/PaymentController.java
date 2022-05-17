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

import Model.Bean.Customer;
import Model.Bean.Detail;
import Model.Bean.Product;
import Model.Bo.CustomerBo;
import Model.Bo.InvoiceBo;
import Model.Bo.ProductBo;

/**
 * Servlet implementation class PaymentController
 */
@WebServlet(name = "payment", urlPatterns = { "/payment" })
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PaymentController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		String id = request.getParameter("id");
		List<Detail> cart = (ArrayList<Detail>) session.getAttribute("cart");
		if (customer == null) {
			if (id != null) {
				for (Detail detail : cart) {
					if (Integer.parseInt(id) == detail.getProduct().getId()) {
						session.setAttribute("detail", detail);
						break;
					}
				}
			}
			request.getRequestDispatcher("payment_page.jsp").forward(request, response);
		} else {
			List<Detail> details = new ArrayList<Detail>();
			InvoiceBo bo = new InvoiceBo();
			ProductBo productBo = new ProductBo();
			if (id != null) {
				for (Detail detail : cart) {
					if (Integer.parseInt(id) == detail.getProduct().getId()) {
						details.add(detail);
						break;
					}
				}
			} else {
				details = cart;
			}
			try {
				bo.saveInvoice(customer, details);
				Product product = null;
				for (Detail detail : details) {
					detail.setStatus(true);
					product = productBo.getProduct(detail.getProduct().getId());
					productBo.decreaseQuantity(product, detail.getQuantity());
				}
				session.setAttribute("cart", cart);
				request.getRequestDispatcher("cart.jsp").forward(request, response);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmnd = request.getParameter("cmnd");
		Customer customer = null;
		CustomerBo bo = new CustomerBo();
		ProductBo productBo = new ProductBo();
		HttpSession session = request.getSession();
		List<Detail> cart = (ArrayList<Detail>) session.getAttribute("cart");
		try {
			customer = bo.getCustomer(false, cmnd);
			Detail detail = (Detail) session.getAttribute("detail");
			if (customer == null) {
				customer = new Customer();
				customer.setName(request.getParameter("name"));
				customer.setPhone(request.getParameter("phone"));
				customer.setCmnd(cmnd);
				customer.setAddress(request.getParameter("address"));
				customer.setGender(request.getParameter("gender"));
				bo.create(customer);
				customer = bo.getCustomer(false, cmnd);
			}
			session.setAttribute("customer", customer);
			List<Detail> details = new ArrayList<Detail>();
			if (detail != null) {
				details.add(detail);
			} else {
				details = cart;
			}
			InvoiceBo invoiceBo = new InvoiceBo();
			invoiceBo.saveInvoice(customer, details);
			Product product = null;
			for (Detail d : details) {
				d.setStatus(true);
				product = productBo.getProduct(d.getProduct().getId());
				productBo.decreaseQuantity(product, d.getQuantity());
			}
			session.setAttribute("cart", cart);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
