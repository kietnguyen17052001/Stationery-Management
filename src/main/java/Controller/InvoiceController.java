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

import Model.Bean.Invoice;
import Model.Bo.InvoiceBo;

/**
 * Servlet implementation class InvoiceController
 */
@WebServlet(name = "invoices", urlPatterns = { "/invoices" })
public class InvoiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InvoiceController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Invoice> invoices = new ArrayList<Invoice>();
		InvoiceBo bo = new InvoiceBo();
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		if (id != null) {
			try {
				bo.delete(Integer.parseInt(id));
				invoices = bo.getListInvoice(content);
				String list = new Gson().toJson(invoices);
				PrintWriter writer = response.getWriter();
				writer.println(list);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			if (content == null) {
				try {
					invoices = bo.getListInvoice(null);
					request.setAttribute("invoices", invoices);
					request.getRequestDispatcher("invoices.jsp").forward(request, response);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			} else {
				try {
					invoices = bo.getListInvoice(content);
					String list = new Gson().toJson(invoices);
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
