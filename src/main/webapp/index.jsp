<%@page import="Model.Bean.Detail"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.Bean.Product"%>
<%@page import="Model.Bean.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="utf-8">
<title>Home</title>


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
<style type="text/css">
#numProduct {
	position: absolute;
	background-color: red;
	color: white;
	width: 20px;
	height: 20px;
	font-weight: bold;
	text-align: center;
	border-radius: 50%;
	top: 0%;
	right: 0%;
	text-align: center;
}

#home-btn-search {
	border: 1px solid silver;
	border-radius: 5px;
	padding: 5px;
}
</style>
</head>


<body>
	<%
	Account account = (Account) session.getAttribute("account");
	List<Product> products = (ArrayList<Product>) request.getAttribute("products");
	List<Detail> cart = (ArrayList<Detail>) session.getAttribute("cart");
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
				<div
					style="float: right; display: flex; justify-content: space-around;">
					<%
					if (account == null) {
					%>
					<div style="margin-right: 50px; position: relative;">
						<a href="cart.jsp"><img src="img/cart.png" width="50"
							height="50"></a>
						<p id="numProduct">
							<%
							if (cart == null || cart.size() == 0) {
							%>
							0
							<%
							} else {
							%>
							<%=cart.size()%>
							<%
							}
							%>
						</p>
					</div>
					<%
					}
					%>
					<div id="menu-burger" class="pull-right not-stuck">
						<div id="menu-bar">
							<span class="icon-bar top"></span> <span class="icon-bar middle"></span>
							<span class="icon-bar bottom"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- End of header
		============================================= -->





	<!-- Start of page head section
		============================================= -->
	<section id="page-head" class="page-head-section">
		<div class="page-head-overlay"></div>
		<div id="page-head-effect" class="page-head-effect">
			<canvas id="demo-canvas"></canvas>
		</div>
		<!-- // page-head-style -->
		<div class="container">
			<div class="row">
				<div class="banner-content">
					<div class="page-head-content">
						<div class="page-head-title text-capitalize pb40">
							<h1>Home Page</h1>
							<span class="descrip">Home</span>
						</div>
						<!-- //title -->

						<div class="page-head-social">
							<div class="social-title text-uppercase">
								<span>Nhom4</span>
							</div>
							<!-- //title -->
							<div class="page-head-social-item ul-li">
								<ul class="page-head-social-list">
									<li><a href="#"><span class="ti-facebook"></span></a></li>
									<li><a href="#"><span class="ti-twitter-alt"></span></a></li>
									<li><a href="#"><span class="ti-google"></span></a></li>
									<li><a href="#"><span class="ti-instagram"></span></a></li>
								</ul>
								<!-- /.page-head-social-list -->
							</div>
							<!-- /.page-head-social-item -->
						</div>
						<!-- /.page-head-social -->
					</div>
					<!-- /.page-head-content -->
				</div>
			</div>
			<!--  /.row-->
		</div>
		<!--  /.container -->
	</section>
	<!-- End of page head section
		============================================= -->
	<!-- Start of portfolio section
		============================================= -->
	<section id="portfolio" class="portfolio-section">
		<div class="container">
			<div class="row">
				<div class="portfolio-content">
					<div class="portfolio-tab pb55">
						<div id="filters" class="button-group pb45">
							<button class="tab-button active" data-filter="*">
								All<span>13</span>
							</button>
							<input oninput="searchProducts()" type="search"
								id="home-btn-search" class="home-btn-search"
								placeholder="Input product name..." />
						</div>
						<!-- /tab-button -->

						<div class="portfolio-tab-text-pic row">
							<div id="posts">
								<%
								for (Product product : products) {
								%>
								<div id="<%=product.getId()%>" class="item item-grid">
									<div class="item-wrap">
										<div class="work-item">
											<div class="work-pic">
												<img src="<%=product.getImage()%>" alt="image">
											</div>
											<div class="hover-content">
												<div class="hover-text text-center">
													<a href="${product.image}" data-lightbox="roadtrip"><span
														class="ti-fullscreen"></span></a>
												</div>
												<div class="project-description text-uppercase ul-li">
													<h3>
														<a href="#"><%=product.getName()%></a>
													</h3>
													<ul class="project-catagorry text-capitalize">
														<li><a href="product?id=<%=product.getId()%>">See
																detail</a></li>
														<br>
														<li><a href="#"><%=product.getPrice()%>VNĐ </a></li>
														<br>
														<li><a href="#"> <%
 if (product.getQuantity() > 0) {
 %>Stocking<%
 } else {
 %>Sold out<%
 }
 %>
														</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
								<%
								}
								%>
							</div>
							<!--//posts-->
						</div>
						<!--//portfolio-tab-text-pic-->
					</div>
					<!--//portfolio-tab-->


					<div class="poppin-more text-uppercase text-center">
						<div class="more-btn">
							<a href="#">MORE</a>
						</div>
					</div>
					<!-- //.more -->

				</div>
				<!--//portfolio-content -->
			</div>
			<!--  /.row -->
		</div>
		<!--  /.conatiner -->
	</section>
	<!-- End of portfolio section
		============================================= -->




	<!-- Start of newsletter section
		============================================= -->
	<section id="newsletter" class="newsletter-section">
		<div class="page-head-overlay"></div>
		<div class="container">
			<div class="row">
				<div class="newsletter-section-content">
					<div class="newsletter-title pb75">
						<h2 class="deep-black">Subscribe On My Newsletter</h2>
					</div>

					<div class="newsletter-form">
						<form action="#" class="input-group">
							<input type="email" class="form-control"
								placeholder="Enter Your Email"> <span
								class="input-group-addon">
								<button type="submit">
									<span class="deep-black ti-arrow-right"></span>
								</button>
							</span>
						</form>
					</div>
				</div>
				<!-- //.newsletter-section-content -->

			</div>
			<!--  /.row -->
		</div>
		<!--  /.conatainer -->
	</section>
	<!-- End of newsletter section
		============================================= -->




	<!-- Start of our service section
		============================================= -->
	<section id="service" class="service-section pt90 pb40">
		<div class="container">
			<div class="row">
				<div class="section-title text-capitalize deep-black pb75">
					<h2>Our latest blog</h2>
				</div>
				<!-- //title -->

				<div class="latest-blog-content">
					<div class="row">

						<div class="col-md-4">
							<div class="latest-blog-text-pic">
								<div class="latest-blog-img mb10">
									<img src="img/3.jpg" alt="img">
									<div class="blog-meta mt20 ul-li">
										<ul class="meta-list">
											<li><a href="#">April 16, 2021 / </a></li>
											<li><a href="#"> Nhom4 / </a></li>
											<li><a href="#">News</a></li>
										</ul>
									</div>
								</div>
								<!-- //.latest-blog-img -->

								<div class="latest-blog-text">
									<div class="blog-head">
										<h2>
											<a href="#">The champion of the Female Student Volleyball
												Tournament called name of Faculty of Tourism</a>
										</h2>
									</div>
									<!-- //.blog-head -->
									<div class="blog-details mt15">
										<p>Excepteur sint occaecat cupidatat nonmaly proident,
											sunt.</p>
									</div>
									<!-- //.blog-details -->
									<div class="blog-read-more text-capitalize pull-left">
										<a href="#">read more<span class="ti-arrow-right"></span></a>
									</div>
									<!-- //.blog-read-more -->

									<div class="latest-blog-comments text-capitalize pull-right">
										<a href="#"><span class="ti-comments"> 5 Comments</span></a>
									</div>
									<!-- //.latest-blog-comments -->
								</div>

							</div>
							<!-- //.latest-blog-text-pic -->
						</div>
						<!-- //.col-md-4 -->


						<div class="col-md-4">
							<div class="latest-blog-text-pic">
								<div class="latest-blog-img mb10">
									<img src="img/1.jpg" alt="img">
									<div class="blog-meta mt20 ul-li">
										<ul class="meta-list">
											<li><a href="#">April 16, 2017 / </a></li>
											<li><a href="#"> Nhom4 / </a></li>
											<li><a href="#">News</a></li>
										</ul>
									</div>
								</div>
								<!-- //.latest-blog-img -->

								<div class="latest-blog-text">
									<div class="blog-head">
										<h2>
											<a href="#">The University of Danang participates in the
												Science Award and Technology of the Ministry of Education in
												2022</a>
										</h2>
									</div>
									<!-- //.blog-head -->
									<div class="blog-details mt15">
										<p>Excepteur sint occaecat cupidatat nonmaly proident,
											sunt.</p>
									</div>
									<!-- //.blog-details -->
									<div class="blog-read-more text-capitalize pull-left">
										<a href="#">read more<span class="ti-arrow-right"></span></a>
									</div>
									<!-- //.blog-read-more -->

									<div class="latest-blog-comments text-capitalize pull-right">
										<a href="#"><span class="ti-comments"> 5 Comments</span></a>
									</div>
									<!-- //.latest-blog-comments -->
								</div>

							</div>
							<!-- //.latest-blog-text-pic -->
						</div>
						<!-- //.col-md-4 -->


						<div class="col-md-4">
							<div class="latest-blog-text-pic">
								<div class="latest-blog-img mb10">
									<img src="img/2.jpg" alt="img">
									<div class="blog-meta mt20 ul-li">
										<ul class="meta-list">
											<li><a href="#">April 16, 2017 / </a></li>
											<li><a href="#"> Nhom4 / </a></li>
											<li><a href="#">News</a></li>
										</ul>
									</div>
								</div>
								<!-- //.latest-blog-img -->

								<div class="latest-blog-text">
									<div class="blog-head">
										<h2>
											<a href="#">“If you have a dream, follow your passion to
												the end”</a>
										</h2>
									</div>
									<!-- //.blog-head -->
									<div class="blog-details mt15">
										<p>Excepteur sint occaecat cupidatat nonmaly proident,
											sunt.</p>
									</div>
									<!-- //.blog-details -->
									<div class="blog-read-more text-capitalize pull-left">
										<a href="#">read more<span class="ti-arrow-right"></span></a>
									</div>
									<!-- //.blog-read-more -->

									<div class="latest-blog-comments text-capitalize pull-right">
										<a href="#"><span class="ti-comments"> 5 Comments</span></a>
									</div>
									<!-- //.latest-blog-comments -->
								</div>
							</div>
							<!-- //.latest-blog-text-pic -->
						</div>
						<!-- //.col-md-4 -->
					</div>
					<!-- //.row -->
				</div>
				<!-- //.latest-blog-content -->
			</div>
			<!--  row -->
		</div>
		<!--  container-->
	</section>
	<!-- End of our service section
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
							<!-- /.page-head-social-list -->
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
	<script src="js/list-products.js"></script>
</body>

</html>