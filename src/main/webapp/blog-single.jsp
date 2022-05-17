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
<title>Blog single</title>


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
				<div class="page-head-content">
					<div class="page-head-title text-capitalize">
						<h1>Blog Single</h1>
					</div>
					<!-- //title -->

					<div class="breadcrumb-item   text-capitalize">
						<ul class="breadcrumb">
							<li><a href="index.jsp">Home</a></li>
							<li>blog single</li>
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



	<!-- Start of blog sinlge content
		============================================= -->
	<section id="blog-single" class="blog-single-content pt90">
		<div class="container">
			<div class="row">
				<div class="blog-single-content">
					<div class="row">
						<div class="col-sm-9">

							<div class="blog-single-right-side">
								<div class="blog-single-main-img">
									<img src="img/blog-s.jpg" alt="image">
								</div>

								<div class="blog-main-link deep-black mt20">
									<h2>
										<a href="#">Lorem ipsum dolor sit amet consectetur
											adipisicing elit sed</a>
									</h2>
								</div>
								<!-- //.blog-main-link -->


								<div class="blog-meta mt10  ul-li">
									<ul class="meta-list">
										<li><a href="#">April 16, 2017 / </a></li>
										<li><a href="#"> Tonmoy / </a></li>
										<li><a href="#">Design</a></li>
									</ul>
								</div>
								<!-- //.blog-meta -->

								<div class="blog-single-text mt30">
									<span>Lorem ipsum dolor sit amet, consectetuer
										adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
										laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad
										minim veniam, quis nostrud exerci tation ullamcorper suscipit
										lobortis nisl ut aliquip ex ea commodo consequat. Duis autem
										vel eum iriure dolor in hendrerit in vulputate velit esse
										molestie consequat, vel illum dolore eu feugiat nulla
										facilisis at vero eros et accumsan et iusto odio dignissim qui
										blandit praesent luptatum zzril delenit augue duis dolore te
										feugait nulla facilisi. Nam liber tempor cum soluta nobis
										eleifend option congue nihil imperdiet doming id quod mazim
										placerat facer possim assum.</span>
								</div>
								<!-- // .blog-single-text -->

								<div class="blog-single-text mt20">
									<span>Lorem ipsum dolor sit amet, consectetuer
										adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
										laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad
										minim veniam, quis nostrud exerci tation ullamcorper suscipit
										lobortis.</span>
								</div>
								<!-- // .blog-single-text -->

								<div class="blog-single-text mt30 row">
									<div class="col-sm-5">
										<img src="img/port-11.gif" alt="image">
									</div>
									<div class="col-sm-7">
										<span class="pt50 table-display">Lorem ipsum dolor sit
											amet, consectetuer adipiscing elit, sed diam nonummy nibh
											euismod tincidunt ut laoreet dolore magna aliquam erat
											volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci
											tation ullamcorper suscipit lobortis.</span>
									</div>
								</div>
								<!-- // .blog-single-text -->

								<div class="blog-single-quate mt60">
									<blockquote>lobortis nisl ut aliquip ex ea commodo
										consequat. Duis autem vel eum iriure dolor in hendrerit in
										vulputate velit esse molestie consequat, vel illum dolore eu
										feugiat nulla facilisis at vero eros et accumsan et iusto odio
										dignissim qui blandit praesent luptatum zzril delenit augue
										duis dolore te feugait nulla facilisi. Nam liber tempor cum
										soluta nobis eleifend option congue nihil imperdiet doming id
										quod mazimassum.</blockquote>
								</div>
								<!-- // .blog-single-quate -->

								<div class="blog-single-text mt20">
									<span>Lorem ipsum dolor sit amet, consectetuer
										adipiscing elit, sed diam nonummy nibh euismod tincidunt ut
										laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad
										minim veniam, quis nostrud exerci tation ullamcorper suscipit
										lobortis.</span>
								</div>
								<!-- // .blog-single-text -->


								<div class="blog-share ul-li mt60">
									<span class="share-it text-uppercase deep-black pull-left">Share
										On it -</span>

									<ul class="page-head-social-list">
										<li><a href="#"><span class="ti-facebook"></span></a></li>
										<li><a href="#"><span class="ti-twitter-alt"></span></a></li>
										<li><a href="#"><span class="ti-google"></span></a></li>
										<li><a href="#"><span class="ti-instagram"></span></a></li>
									</ul>
									<!-- /.page-head-social-list -->
								</div>
								<!-- //.blog-share -->
							</div>
							<!-- //.blog-single-right-side -->


							<div class="blog-single-comment pt90">

								<div class="comment-form-list">
									<div class="comment-form-list-pic-text">
										<div class="author-pic pull-left">
											<img src="img/img1.png" alt="">
										</div>
										<!-- //.img -->
										<div class="author-text">
											<span class="author-name deep-black">Marifa Islam</span> <span
												class="author-date">26 Apr 2017</span> <span
												class="author-dec">Lorem ipsum dolor sit amet,
												consectetuer adipiscing elit, sed diam nonummy nibh euismod
												tincidunt ut laoreet dolore</span> <span
												class="reply-text mt10 deep-black"><a href="#!">Reply</a></span>
										</div>
									</div>
									<!-- //.comment-form-list-pic-text -->

									<div class="comment-form-list-pic-text ml50 mt30">
										<div class="author-pic pull-left">
											<img src="img/img2.png" alt="">
										</div>
										<!-- //.img -->
										<div class="author-text">
											<span class="author-name deep-black">Marifa Islam</span> <span
												class="author-date">26 Apr 2017</span> <span
												class="author-dec">Lorem ipsum dolor sit amet,
												consectetuer adipiscing elit, sed diam nonummy nibh euismod
												tincidunt ut laoreet dolore</span> <span
												class="reply-text mt10 deep-black"><a href="#!">Reply</a></span>
										</div>
									</div>
								</div>
								<!-- //.comment-form-list -->



								<div class="comment-form-list-pic-text mt20">
									<div class="author-pic pull-left">
										<img src="img/img4.png" alt="">
									</div>
									<!-- //.img -->
									<div class="author-text">
										<span class="author-name deep-black">Marifa Islam</span> <span
											class="author-date">26 Apr 2017</span> <span
											class="author-dec">Lorem ipsum dolor sit amet,
											consectetuer adipiscing elit, sed diam nonummy nibh euismod
											tincidunt ut laoreet dolore</span> <span
											class="reply-text mt10 deep-black"><a href="#!">Reply</a></span>
									</div>
								</div>
								<!-- //.comment-form-list-pic-text -->

								<div class="blog-single-comment-head text-capitalize  pt90">
									<h3 class="title-head deep-black">Drop your thought</h3>
								</div>

								<div class="comment-form mt50 ">
									<form action="#" class="clearfix">
										<div class="input-field-wrapper">
											<div class="input-field">
												<label for="name-f" data-error="wrong" data-success="right">Name</label>
												<input id="name-f" type="text" class="validate">
											</div>
											<div class="input-field">
												<label for="email" data-error="wrong" data-success="right">Email</label>
												<input id="email" type="email" class="validate">
											</div>
										</div>
										<div class="clear-fix my-comment-box">
											<label for="textarea1">Message</label>
											<textarea id="textarea1" name="#" cols="30" rows="10"></textarea>
										</div>
										<button type="submit" class="popin-btn">Drop Comment</button>
									</form>
								</div>
							</div>
							<!-- //.blog-single-comment -->

						</div>
						<!--  /.col-sm-9 -->


						<div class="col-sm-3">
							<div class="blog-single-right-side-bar">
								<div class="blog-search mb80">
									<form action="#" method="get">
										<input type="text" class="" placeholder="Enter keywords">
										<div class="nws-button">
											<button type="submit" value="Submit">
												<span class="ti-search"></span>
											</button>
										</div>
									</form>
								</div>
								<!-- /.blog-search  -->


								<div class="blog-single-right-side-content mt50">
									<div class="blog-single-side-title text-capitalize">
										<h2 class="widgettitle deep-black">Categoris</h2>
									</div>
									<!-- //.widgettitle -->
									<div class="category-item mt20 ul-li">
										<ul class="category-item-list ul-li-block">
											<li><a href="#">Design</a><span class="badge pull-right">25</span></li>
											<li><a href="#">Product</a><span
												class="badge pull-right">25</span></li>
											<li><a href="#">SEO</a><span class="badge pull-right">75</span></li>
											<li><a href="#">Web</a><span class="badge pull-right">14</span></li>
											<li><a href="#">Teach</a><span class="badge pull-right">26</span></li>
										</ul>
									</div>
									<!-- /.category-item  -->
								</div>
								<!-- //.blog-single-right-side-content -->



								<div class="blog-single-right-side-content mt50">
									<div class="blog-single-side-title text-capitalize">
										<h2 class="widgettitle deep-black">recent post</h2>
									</div>
									<!-- //.widgettitle -->

									<div class="recent-post-list mt30">
										<div class="recent-blog-item">
											<div class="side-tab-img-text">
												<div class="rec-img">
													<img src="img/recent-1.jpg" alt="image">
												</div>
												<div class="side-tab-text ul-li">
													<div class="rec-link">
														<h3>
															<a href="#">Hacks to make your holday better</a>
														</h3>
													</div>
													<ul class="rec-nws-meta">
														<li><a href="#"><i class="ti-timer"></i> oct 10,
																2016</a></li>
													</ul>
												</div>
											</div>
											<!-- //img-text -->

											<div class="side-tab-img-text">
												<div class="rec-img">
													<img src="img/recent-2.jpg" alt="image">
												</div>
												<div class="side-tab-text ul-li">
													<div class="rec-link">
														<h3>
															<a href="#">Hacks to make your holday better</a>
														</h3>
													</div>
													<ul class="rec-nws-meta">
														<li><a href="#"><i class="ti-timer"></i> oct 10,
																2016</a></li>
													</ul>
												</div>
											</div>

											<div class="side-tab-img-text">
												<div class="rec-img">
													<img src="img/recent-3.jpg" alt="image">
												</div>
												<div class="side-tab-text ul-li">
													<div class="rec-link">
														<h3>
															<a href="#">Hacks to make your holday better</a>
														</h3>
													</div>
													<ul class="rec-nws-meta">
														<li><a href="#"><i class="ti-timer"></i> oct 10,
																2016</a></li>
													</ul>
												</div>
											</div>
											<!-- //img-text -->

											<div class="side-tab-img-text">
												<div class="rec-img">
													<img src="img/recent-4.jpg" alt="image">
												</div>
												<div class="side-tab-text ul-li">
													<div class="rec-link">
														<h3>
															<a href="#">Hacks to make your holday better</a>
														</h3>
													</div>
													<ul class="rec-nws-meta">
														<li><a href="#"><i class="ti-timer"></i> oct 10,
																2016</a></li>
													</ul>
												</div>
											</div>
											<!-- //img-text -->
										</div>
									</div>

								</div>
								<!-- //.blog-single-right-side-content -->


								<div class="blog-single-right-side-content mt50">
									<div class="blog-single-side-title text-capitalize">
										<h2 class="widgettitle deep-black">Tags</h2>
									</div>
									<!-- //.widgettitle -->


									<div class="blog-tag ul-li mt30">
										<ul class="blog-tag-list">
											<li><a href="#">Design</a></li>
											<li><a href="#">Web Design</a></li>
											<li><a href="#">Photo</a></li>
											<li><a href="#">HTML</a></li>
											<li><a href="#">Joomla</a></li>
											<li><a href="#">Wordpress</a></li>
											<li><a href="#">PSD</a></li>
											<li><a href="#">Logo</a></li>
										</ul>
									</div>
								</div>
								<!-- //.blog-single-right-side-content -->

							</div>
							<!-- //.blog-single-right-side-bar -->
						</div>
						<!--  /.col-sm-3 -->


					</div>
					<!--  /.row -->
				</div>
				<!-- //.blog-single-content -->
			</div>
			<!--  /.row -->
		</div>
		<!--  /.container -->
	</section>
	<!-- End of blog single content
		============================================= -->





	<!-- Start of footer section
		============================================= -->
	<footer>
		<div class="footer-area">
			<div class="container">
				<div class="row">
					<div class="copy-right-area  border-top text-center">
						<span class="pt50 table-display">© Nhom4 </span>
					</div>
					<!-- //copy-right-area -->
				</div>
				<!--  /.container -->
			</div>
			<!--  /.row-->
			<div class="up">
				<a href="#" id="scrolluptop" class="scrollup custom"><span
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

	<!-- Include script.js -->
	<script src="js/script.js"></script>
</body>
</html>