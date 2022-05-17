package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model.Bean.Detail;
import Model.Bo.DetailInvoiceBo;

/**
 * Servlet implementation class DetailInvoiceController
 */
@WebServlet(name = "detail", urlPatterns = { "/detail" })
public class DetailInvoiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DetailInvoiceController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idInvoice = request.getParameter("idInvoice");
		String idProduct = request.getParameter("idProduct");
		if (idInvoice != null && idProduct != null) {
			DetailInvoiceBo bo = new DetailInvoiceBo();
			try {
				bo.delete(false, Integer.parseInt(idInvoice), Integer.parseInt(idProduct));
				List<Detail> details = bo.getListDetail(Integer.parseInt(idInvoice));
				String list = new Gson().toJson(details);
				PrintWriter writer = response.getWriter();
				writer.println(list);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			int id = Integer.parseInt(request.getParameter("id"));
			try {
				DetailInvoiceBo bo = new DetailInvoiceBo();
				List<Detail> details = bo.getListDetail(id);
				request.setAttribute("details", details);
				request.getRequestDispatcher("invoice_detail.jsp").forward(request, response);
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
