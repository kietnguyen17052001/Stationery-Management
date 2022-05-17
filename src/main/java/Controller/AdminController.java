package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Model.Bean.Account;
import Model.Bean.MessageBox;
import Model.Bo.AdminBo;

/**
 * Servlet implementation class AdminController
 */
@WebServlet(name = "admin", urlPatterns = { "/admin" })
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("newName");
		AdminBo bo = new AdminBo();
		HttpSession session = request.getSession();
		Account account = (Account) session.getAttribute("account");
		MessageBox messageBox = null;
		if (name != null) {
			try {
				account = bo.changeNameAccount(account, name);
				session.setAttribute("account", account);
				messageBox = new MessageBox(true, "Change name successfully");
				String data = new Gson().toJson(messageBox);
				PrintWriter writer = response.getWriter();
				writer.println(data);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			String curPassword = request.getParameter("currentPassword");
			String newPassword = request.getParameter("newPassword");
			String data = null;
			try {
				account = bo.changePasswordAccount(account, curPassword, newPassword);
				if (account == null) {
					messageBox = new MessageBox(false, "Current password is incorrect");
					data = new Gson().toJson(messageBox);
				} else {
					session.setAttribute("account", account);
					messageBox = new MessageBox(true, "Change password successfully");
					data = new Gson().toJson(messageBox);
				}
				PrintWriter writer = response.getWriter();
				writer.println(data);
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
