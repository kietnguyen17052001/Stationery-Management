package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import Model.Bean.Product;
import Model.Bo.ProductBo;

/**
 * Servlet implementation class RentController
 */
@WebServlet(name = "rent", urlPatterns = { "/rent" })
public class RentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RentController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String value = request.getParameter("id");
		if (value != null) {
			int id = Integer.parseInt(value);
			ProductBo bo = new ProductBo();
			try {
				Product product = bo.getProduct(id);
				PrintWriter writer = response.getWriter();
				ObjectMapper mapper = new ObjectMapper();
				String json = mapper.writeValueAsString(product);
				writer.println(json);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			try {
				List<Product> products = new ProductBo().getListProduct(null);
				request.setAttribute("products", products);
				request.getRequestDispatcher("rent_product.jsp").forward(request, response);
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
	}
}
