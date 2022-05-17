<%@page import="Model.Bean.Account"%>
<%@page import="Model.Bean.Detail"%>
<%@page import="java.util.*"%>
<%@page import="Model.Bean.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="utf-8">
<title>blog</title>


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
</style>
</head>


<body class="about single-page">
	<%
	Account account = (Account) session.getAttribute("account");
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
 %> Customer <%
 }
 %> </a>
		</div>
		<ul id="menu">
			<li class="has-submenu text-capitalize"><a href="home">Home
					Page </a></li>
			<%
			if (account == null) {
			%>
			<li class="has-submenu"><a href="#">Blog <span
					class="ti-angle-down"></span></a>
				<ul class="submenu">
					<li><a href="blog.jsp">Blog Grid</a></li>
					<li><a href="blog-single.jsp">Single Post</a></li>
				</ul></li>
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
				<div class="page-head-content text-center">
					<div class="page-head-title text-capitalize">
						<h1>Blog Archive</h1>
					</div>
					<!-- //title -->

					<div class="breadcrumb-item   text-capitalize">
						<ul class="breadcrumb">
							<li><a href="index.jsp">Home</a></li>
							<li>blog</li>
						</ul>
					</div>
					<!-- /.breadcrumb-item -->
				</div>
				<!-- /.page-head-content -->
			</div>
			<!--  /.row-->
		</div>
		<!--  /.container -->
	</section>
	<!-- End of page head section
		============================================= -->


	<!-- Start of blog page section
		============================================= -->
	<section id="blog-main" class="blog-main-section">
		<div class="container">
			<div class="row section-content">
				<div class="blog-main-content">


					<div class="blog-main-text-pic">
						<div class="blog-item-content">
							<div class="blog-main-pic">
								<img src="img/blog-1.jpg" alt="img">
							</div>
							<!-- //blog-pic -->
							<div class="blog-main-text">
								<div class="blog-meta mt20 ul-li">
									<ul class="meta-list">
										<li><a href="#">April 16, 2017 / </a></li>
										<li><a href="#"> Tonmoy / </a></li>
										<li><a href="#">Design</a></li>
									</ul>
								</div>
								<!-- // .blog-meta -->

								<div class="blog-main-link deep-black mt20">
									<h2>
										<a href="#">Lorem ipsum dolor sit amet consectetur
											adipisicing elit sed</a>
									</h2>
								</div>
								<!-- //.blog-main-link -->

								<div class="blog-read-more mt15 text-capitalize">
									<a href="#">read more<span class="ti-arrow-right"></span></a>
								</div>
							</div>
							<!-- // .blog-main-text -->
						</div>
					</div>
					<!-- //.blog-main-text-pic -->



					<div class="blog-main-text-pic">
						<div class="blog-item-content">
							<div class="blog-main-pic">
								<img src="img/blog-2.jpg" alt="img">
							</div>
							<!-- //blog-pic -->
							<div class="blog-main-text">
								<div class="blog-meta mt20 ul-li">
									<ul class="meta-list">
										<li><a href="#">April 16, 2017 / </a></li>
										<li><a href="#"> Tonmoy / </a></li>
										<li><a href="#">Design</a></li>
									</ul>
								</div>
								<!-- // .blog-meta -->

								<div class="blog-main-link deep-black mt20">
									<h2>
										<a href="#">Lorem ipsum dolor sit amet consectetur
											adipisicing elit sed</a>
									</h2>
								</div>
								<!-- //.blog-main-link -->

								<div class="blog-read-more mt15 text-capitalize">
									<a href="#">read more<span class="ti-arrow-right"></span></a>
								</div>
							</div>
							<!-- // .blog-main-text -->
						</div>
					</div>
					<!-- //.blog-main-text-pic -->



					<div class="blog-main-text-pic">
						<div class="blog-item-content">
							<div class="blog-main-pic">
								<img src="img/blog-6.jpg" alt="img">
							</div>
							<!-- //blog-pic -->
							<div class="blog-main-text">
								<div class="blog-meta mt20 ul-li">
									<ul class="meta-list">
										<li><a href="#">April 16, 2017 / </a></li>
										<li><a href="#"> Tonmoy / </a></li>
										<li><a href="#">Design</a></li>
									</ul>
								</div>
								<!-- // .blog-meta -->

								<div class="blog-main-link deep-black mt20">
									<h2>
										<a href="#">Lorem ipsum dolor sit amet consectetur
											adipisicing elit sed</a>
									</h2>
								</div>
								<!-- //.blog-main-link -->

								<div class="blog-read-more mt15 text-capitalize">
									<a href="#">read more<span class="ti-arrow-right"></span></a>
								</div>
							</div>
							<!-- // .blog-main-text -->
						</div>
					</div>
					<!-- //.blog-main-text-pic -->



					<div class="blog-main-text-pic">
						<div class="blog-item-content">
							<div class="blog-main-pic">
								<img src="img/blog-4.jpg" alt="img">
							</div>
							<!-- //blog-pic -->
							<div class="blog-main-text">
								<div class="blog-meta mt20 ul-li">
									<ul class="meta-list">
										<li><a href="#">April 16, 2017 / </a></li>
										<li><a href="#"> Tonmoy / </a></li>
										<li><a href="#">Design</a></li>
									</ul>
								</div>
								<!-- // .blog-meta -->

								<div class="blog-main-link deep-black mt20">
									<h2>
										<a href="#">Lorem ipsum dolor sit amet consectetur
											adipisicing elit sed</a>
									</h2>
								</div>
								<!-- //.blog-main-link -->

								<div class="blog-read-more mt15 text-capitalize">
									<a href="#">read more<span class="ti-arrow-right"></span></a>
								</div>
							</div>
							<!-- // .blog-main-text -->
						</div>
					</div>
					<!-- //.blog-main-text-pic -->



					<div class="blog-main-text-pic">
						<div class="blog-item-content">
							<div class="blog-main-pic">
								<img src="img/blog-2.jpg" alt="img">
							</div>
							<!-- //blog-pic -->
							<div class="blog-main-text">
								<div class="blog-meta mt20 ul-li">
									<ul class="meta-list">
										<li><a href="#">April 16, 2017 / </a></li>
										<li><a href="#"> Tonmoy / </a></li>
										<li><a href="#">Design</a></li>
									</ul>
								</div>
								<!-- // .blog-meta -->

								<div class="blog-main-link deep-black mt20">
									<h2>
										<a href="#">Lorem ipsum dolor sit amet consectetur
											adipisicing elit sed</a>
									</h2>
								</div>
								<!-- //.blog-main-link -->

								<div class="blog-read-more mt15 text-capitalize">
									<a href="#">read more<span class="ti-arrow-right"></span></a>
								</div>
							</div>
							<!-- // .blog-main-text -->
						</div>
					</div>
					<!-- //.blog-main-text-pic -->


					<div class="blog-main-text-pic">
						<div class="blog-item-content">
							<div class="blog-main-pic">
								<img src="img/blog-5.jpg" alt="img">
							</div>
							<!-- //blog-pic -->
							<div class="blog-main-text">
								<div class="blog-meta mt20 ul-li">
									<ul class="meta-list">
										<li><a href="#">April 16, 2017 / </a></li>
										<li><a href="#"> Tonmoy / </a></li>
										<li><a href="#">Design</a></li>
									</ul>
								</div>
								<!-- // .blog-meta -->

								<div class="blog-main-link deep-black mt20">
									<h2>
										<a href="#">Lorem ipsum dolor sit amet consectetur
											adipisicing elit sed</a>
									</h2>
								</div>
								<!-- //.blog-main-link -->

								<div class="blog-read-more mt15 text-capitalize">
									<a href="#">read more<span class="ti-arrow-right"></span></a>
								</div>
							</div>
							<!-- // .blog-main-text -->
						</div>
					</div>
					<!-- //.blog-main-text-pic -->


					<div class="blog-main-text-pic">
						<div class="blog-item-content">
							<div class="blog-main-pic">
								<img src="img/blog-3.jpg" alt="img">
							</div>
							<!-- //blog-pic -->
							<div class="blog-main-text">
								<div class="blog-meta mt20 ul-li">
									<ul class="meta-list">
										<li><a href="#">April 16, 2017 / </a></li>
										<li><a href="#"> Tonmoy / </a></li>
										<li><a href="#">Design</a></li>
									</ul>
								</div>
								<!-- // .blog-meta -->

								<div class="blog-main-link deep-black mt20">
									<h2>
										<a href="#">Lorem ipsum dolor sit amet consectetur
											adipisicing elit sed</a>
									</h2>
								</div>
								<!-- //.blog-main-link -->

								<div class="blog-read-more mt15 text-capitalize">
									<a href="#">read more<span class="ti-arrow-right"></span></a>
								</div>
							</div>
							<!-- // .blog-main-text -->
						</div>
					</div>
					<!-- //.blog-main-text-pic -->


					<div class="blog-main-text-pic">
						<div class="blog-item-content">
							<div class="blog-main-pic">
								<img src="img/blog-5.jpg" alt="img">
							</div>
							<!-- //blog-pic -->
							<div class="blog-main-text">
								<div class="blog-meta mt20 ul-li">
									<ul class="meta-list">
										<li><a href="#">April 16, 2017 / </a></li>
										<li><a href="#"> Tonmoy / </a></li>
										<li><a href="#">Design</a></li>
									</ul>
								</div>
								<!-- // .blog-meta -->

								<div class="blog-main-link deep-black mt20">
									<h2>
										<a href="#">Lorem ipsum dolor sit amet consectetur
											adipisicing elit sed</a>
									</h2>
								</div>
								<!-- //.blog-main-link -->

								<div class="blog-read-more mt15 text-capitalize">
									<a href="#">read more<span class="ti-arrow-right"></span></a>
								</div>
							</div>
							<!-- // .blog-main-text -->
						</div>
					</div>
					<!-- //.blog-main-text-pic -->


					<div class="blog-main-text-pic">
						<div class="blog-item-content">
							<div class="blog-main-pic">
								<img src="img/blog-7.jpg" alt="img">
							</div>
							<!-- //blog-pic -->
							<div class="blog-main-text">
								<div class="blog-meta mt20 ul-li">
									<ul class="meta-list">
										<li><a href="#">April 16, 2017 / </a></li>
										<li><a href="#"> Tonmoy / </a></li>
										<li><a href="#">Design</a></li>
									</ul>
								</div>
								<!-- // .blog-meta -->

								<div class="blog-main-link deep-black mt20">
									<h2>
										<a href="#">Lorem ipsum dolor sit amet consectetur
											adipisicing elit sed</a>
									</h2>
								</div>
								<!-- //.blog-main-link -->

								<div class="blog-read-more mt15 text-capitalize">
									<a href="#">read more<span class="ti-arrow-right"></span></a>
								</div>
							</div>
							<!-- // .blog-main-text -->
						</div>
					</div>
					<!-- //.blog-main-text-pic -->

				</div>
				<!-- // .blog-main-content -->


				<div class="blog-pagination text-center">
					<ul class="pagination">
						<li><a href="#"><span class="ti-arrow-left"></span></a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">...</a></li>
						<li><a href="#">9</a></li>
						<li><a href="#"><span class="ti-arrow-right"></span></a></li>
					</ul>
				</div>
			</div>
			<!--  /.row -->
		</div>
		<!--  /.container-->
	</section>
	<!-- End of blog page section	
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



	<!-- Start of footer section
		============================================= -->
	<footer>
		<div class="footer-area">
			<div class="container">
				<div class="row">
					<div class="copy-right-area text-center">
						<span>© Nhom4 </span>
					</div>
					<!-- //copy-right-area -->
				</div>
				<!--  /.container -->
			</div>
			<!--  /.row-->
			<div class="up">
				<a href="#" id="scrolluptop" class="scrollup"><span
					class="back-top deep-black text-uppercase">back top</span></a>
			</div>
		</div>
		<!--  /.footer-area -->

	</footer>
	<!-- End of footer section
		============================================= -->


	<!--  Js Library -->
	<script src="js/jquery-2.1.4.min.js"></script>
	<!-- Include  for bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Include  for wow.js -->
	<script src="js/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
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
	<!-- Include Mesonary Grid -->
	<script src="js/masonry.pkgd.min.js"></script>
	<script src="js/masonry-docs.min.js"></script>



	<!-- Include script.js -->
	<script src="js/script.js"></script>
</body>