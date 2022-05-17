<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.Bean.Invoice"%>
<%@page import="Model.Bean.Customer"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Bean.Product"%>
<%@page import="Model.Bean.Detail"%>
<%@page import="java.util.List"%>
<%@page import="Model.Bean.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="utf-8">
<title>Invoices</title>


<meta name="description" content="----">

<meta name="keywords" content="Premium HTML Template">

<meta name="author" content="HTMLmate">

<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- css-include -->

<!-- boorstrap -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<!-- themify-icon.css -->
<link rel="stylesheet" type="text/css" href="css/themify-icons.css">
<!-- owl-carousel -->
<link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
<!-- light-box -->
<link rel="stylesheet" type="text/css" href="css/lightbox.css">
<!-- video css -->
<link rel="stylesheet" type="text/css" href="css/video.min.css">
<!-- menu.css -->
<link rel="stylesheet" type="text/css" href="css/menu.css">
<!-- style -->
<link rel="stylesheet" type="text/css" href="css/style.css">
<!-- responsive.css -->
<link rel="stylesheet" type="text/css" href="css/responsive.css">
<link rel="stylesheet" type="text/css" href="css/customer_style.css">

<style type="text/css">
</style>
</head>


<body>
	<%
	Account account = (Account) session.getAttribute("account");
	List<Invoice> invoices = (ArrayList<Invoice>) request.getAttribute("invoices");
	SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy");
	%>
	<div id="preloader"></div>
	<!-- Start of nav bar 
		============================================= -->
	<nav id="poppin-nav">
		<div id="nav-off"></div>
		<div id="header-logo-1" class="text-center">
			<a href="home"><img src="img/LOGO_CHATAM.png" alt="img"> <%
 if (account != null) {
 %> Admin <%=account.getDisplayName()%> <%
 } else {
 %> Khách hàng <%
 }
 %> </a>
		</div>
		<ul id="menu">
			<li class="has-submenu text-capitalize"><a href="home">Home
					Page </a></li>
			<%
			if (account == null) {
			%>
			<li><a href="rent">Product rental</a></li>
			<li><a href="contact.jsp">Contact</a></li>
			<li><a href="login_form.jsp">Login</a></li>
			<%
			} else {
			%>
			<li><a href="admin.jsp">User</a></li>
			<li><a href="customers">Customer</a></li>
			<li><a href="invoices">Invoice</a></li>
			<li><a href="logout">Log out</a></li>
			<%
			}
			%>
		</ul>
	</nav>
	<div id="menu-overlay"></div>
	<!-- End of nav bar 
		============================================= -->



	<!-- Start of header
		============================================= -->
	<header id="site-header" class="not-stuck">
		<div class="container">
			<div class="row">
				<div id="header-logo">
					<a href="home"><img src="img/LOGO_CHATAM.png" alt="img"></a>
				</div>
				<div id="menu-burger" class="pull-right not-stuck">
					<div id="menu-bar">
						<span class="icon-bar top"></span> <span class="icon-bar middle"></span>
						<span class="icon-bar bottom"></span>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Start of portfolio section
		============================================= -->
	<section id="portfolio" class="portfolio-section">
		<div class="container">
			<div class="header">
				<div class="title-page-management">
					<h2>Invoice Management</h2>
				</div>
				<div class="box-search-invoices">
					<input id="input-search-invoices" oninput="searchInvoice()"
						type="text" placeholder="Enter invoice id or name customer ..." />
					<div class="ti-search"></div>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Invoice ID</th>
							<th scope="col">Customer</th>
							<th scope="col">Hire time</th>
							<th scope="col">Total payment</th>
							<th scope="col" colspan="2"></th>
						</tr>
					</thead>
					<tbody id="tbody-invoices">
						<%
						int index = 1;
						for (Invoice invoice : invoices) {
						%>
						<tr>
							<th scope="row"><%=index++%></th>
							<td><%=invoice.getId()%></td>
							<td><%=invoice.getCustomer().getName()%></td>
							<td><%=dateFormat.format(invoice.getTime())%></td>
							<td><%=invoice.getTotalMoney()%></td>
							<td><a href="detail?id=<%=invoice.getId()%>"><img
									src="img/detail.png"></a></td>
							<td><button id="btn-delete-invoice"
									onClick="deleteInvoice(<%=invoice.getId()%>)">
									<img src="img/remove.png">
								</button></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<!--  /.conatiner -->
	</section>
	<!-- End of portfolio section
		============================================= -->

	<!-- Start of footer section
		============================================= -->
	<footer>
		<div class="footer-area footer-2">
			<div class="container">
				<div class="row">
					<div class="copy-right-area text-center">
						<div class="page-head-social-item ul-li">
							<ul class="page-head-social-list">
								<li><a href="#"><span class="ti-facebook"></span></a></li>
								<li><a href="#"><span class="ti-twitter-alt"></span></a></li>
								<li><a href="#"><span class="ti-google"></span></a></li>
								<li><a href="#"><span class="ti-instagram"></span></a></li>
							</ul>
							<!-- /.page-head-soghcial-list -->
						</div>
						<span>© Nhom4 </span>
					</div>
					<!-- //copy-right-area -->
				</div>
				<!--  /.container -->
			</div>
			<!--  /.row-->
		</div>
		<!--  /.footer-area -->
	</footer>
	<!-- End of footer section
		============================================= -->



	<!--  Js Library -->
	<script src="js/jquery-2.1.4.min.js"></script>
	<!-- Include  for bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Include isotope Js -->
	<script src="js/jquery.isotope.min.js"></script>
	<!-- Include lightbox -->
	<script src="js/lightbox.js"></script>
	<!-- Include circle-effect.js -->
	<script src="js/circle-effect.js"></script>
	<!-- Include Video js -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<!-- Include Owl-carousel -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- Include Counter up -->
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/waypoints.min.js"></script>



	<!-- Include script.js -->
	<script src="js/script.js"></script>
	<script src="js/invoice_script.js"></script>
</body>

</html>