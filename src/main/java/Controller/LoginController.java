package Controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Bean.Account;
import Model.Bean.Detail;
import Model.Bean.Product;
import Model.Bo.LoginBo;
import Model.Bo.ProductBo;

/**
 * Servlet implementation class LoginController
 */
@WebServlet(name = "home", urlPatterns = { "/home" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			List<Product> products = new ProductBo().getListProduct(null);
			HttpSession session = request.getSession();
			request.setAttribute("products", products);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username == null || password == null) {
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
		LoginBo bo = new LoginBo();
		try {
			Account account = bo.getAccount(username, password);
			if (account != null) {
				HttpSession session = request.getSession();
				session.setAttribute("account", account);
				List<Product> products = new ProductBo().getListProduct(null);
				request.setAttribute("products", products);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("login_form.jsp").forward(request, response);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
