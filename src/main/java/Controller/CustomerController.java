package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model.Bean.Customer;
import Model.Bo.CustomerBo;

/**
 * Servlet implementation class CustomerController
 */
@WebServlet(name = "customers", urlPatterns = { "/customers" })
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Customer> customers = new ArrayList<Customer>();
		CustomerBo bo = new CustomerBo();
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		if (id != null) {
			try {
				bo.delete(Integer.parseInt(id));
				customers = bo.getListCustomer(content);
				String list = new Gson().toJson(customers);
				PrintWriter writer = response.getWriter();
				writer.println(list);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			if (content == null) {
				try {
					customers = bo.getListCustomer(null);
					request.setAttribute("customers", customers);
					request.getRequestDispatcher("customers.jsp").forward(request, response);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			} else {
				try {
					customers = bo.getListCustomer(content);
					String list = new Gson().toJson(customers);
					PrintWriter writer = response.getWriter();
					writer.println(list);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
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
