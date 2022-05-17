<%@page import="Model.Bean.Account"%>
<%@page import="Model.Bean.Detail"%>
<%@page import="Model.Bean.Product"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="utf-8">
<title>Contact</title>


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
						<a href="#"><img src="img/cart.png" width="50" height="50"></a>
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
						<h1>Contact Us</h1>
					</div>
					<!-- //title -->

					<div class="breadcrumb-item   text-capitalize">
						<ul class="breadcrumb">
							<li><a href="index.jsp">Home</a></li>
							<li>contact</li>
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


	<!-- Start of contact us section
		============================================= -->
	<section id="contact" class="contact-us-section">
		<div class="container">
			<div class="row section-content">
				<div class="contact-us-contact">
					<div class="contact-text text-center deep-black play-fair">
						<span>Tempor incididunt ut labore et dolore magna aliqua
							minim veniam quis nostrud exercitation ullamco laboris nisi ut
							aliquip exea commodo consequat.</span>
					</div>
					<!-- //.contact-text-->

					<div class="contact-map pt90">
						<div id="google-map">
							<div id="googleMaps" class="google-map-container"></div>
						</div>
						<!-- /#google-map-->
					</div>

					<div class="contact-adress pt90">
						<div class="row">
							<div class="col-sm-3">
								<div class="section-title text-capitalize deep-black pb75">
									<h2>Contact Us</h2>
								</div>
								<!-- //title -->
							</div>
							<!-- //col-sm-3 -->

							<div class="col-sm-3">
								<div class="service-text-icon">
									<div class="service-icon">
										<span class="deep-black ti-location-pin"></span>
									</div>
									<!-- //icon -->
									<div class="service-text mt15">
										<div class="service-title deep-black">
											<h3>Address</h3>
										</div>
										<!-- //title -->
										<div class="service-dec mt15">
											<span>71 Ngũ Hành Sơn, Sơn Trà, Đà Nẵng </span>
										</div>
									</div>
									<!-- //deccription -->
								</div>
							</div>
							<!-- //col-sm-3 -->


							<div class="col-sm-3">
								<div class="service-text-icon">
									<div class="service-icon">
										<span class="deep-black ti-mobile"></span>
									</div>
									<!-- //icon -->
									<div class="service-text mt15">
										<div class="service-title deep-black">
											<h3>Direct Call</h3>
										</div>
										<!-- //title -->
										<div class="service-dec mt15">
											<span>+84 869 072 806<br>+1 437 800 513
											</span>
										</div>
									</div>
									<!-- //deccription -->
								</div>
							</div>
							<!-- //col-sm-3 -->


							<div class="col-sm-3">
								<div class="service-text-icon">
									<div class="service-icon">
										<span class="deep-black ti-email"></span>
									</div>
									<!-- //icon -->
									<div class="service-text mt15">
										<div class="service-title deep-black">
											<h3>Get In Touch</h3>
										</div>
										<!-- //title -->
										<div class="service-dec mt15">
											<span>quanghuy0070@gmail.com <br>191121521217@due.udn.vn

											</span>
										</div>
									</div>
									<!-- //deccription -->
								</div>
							</div>
							<!-- //col-sm-3 -->
						</div>
					</div>
					<!-- //.contact-adress -->

					<div class="contact-area-form pt90">
						<div class="row">
							<div class="col-sm-3">
								<div class="section-title text-capitalize deep-black pb75">
									<h2>Drop a Mail</h2>
								</div>
								<!-- //title -->
							</div>
							<!-- //col-sm-3 -->

							<div class="col-sm-9">
								<div class="contact-adress-form">
									<form id="contact_form" action="#" method="POST"
										enctype="multipart/form-data">
										<div class="contact-info-item">
											<input class="name" name="name" type="text"
												placeholder="Enter your name..."> <span><i
												class="fa fa-user" aria-hidden="true"></i></span>
										</div>
										<div class="contact-info-item">
											<input class="email" name="email" type="email"
												placeholder="Your Email"> <span><i
												class="fa fa-envelope" aria-hidden="true"></i></span>
										</div>
										<div class="contact-info-item">
											<input class="sub" name="name" type="text"
												placeholder="Subject ( optional )"> <span
												class="phone"><i class="fa fa-phone"
												aria-hidden="true"></i></span>
										</div>
										<div class="contact-info-msg">
											<textarea id="message" name="message"
												placeholder="Type your message" rows="7" cols="30"></textarea>
											<span><i class="fa fa-pencil" aria-hidden="true"></i></span>
										</div>
										<button class="text-uppercase" type="submit" value="send now">
											Send Message<i class="fa fa-angle-right" aria-hidden="true"></i>
										</button>
									</form>
								</div>
							</div>
							<!-- //.col-sm-9 -->
						</div>
					</div>
					<!-- //.contact-area-form -->
				</div>
				<!-- //.contact-us-contact -->
			</div>
			<!--  /.row-->
		</div>
		<!--  /.container -->
	</section>
	<!-- End of contact us section
		============================================= -->




	<!-- Start of footer section
		============================================= -->
	<footer>
		<div class="footer-area">
			<div class="container">
				<div class="row">
					<div class="copy-right-area  border-top text-center">
						<span class="pt50 table-display">© QuangHuy - All Rights
							Reserved </span>
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


	<!-- Google Maps Script  -->
	<script
		src="http://maps.google.com/maps/api/js?key=AIzaSyC61_QVqt9LAhwFdlQmsNwi5aUJy9B2SyA"></script>
	<script src="js/gmap3.min.js"></script>
	<script>
		function isMobile() {
			return ('ontouchstart' in document.documentElement);
		}

		function init_gmap() {
			if (typeof google == 'undefined')
				return;
			var options = {
				center : [ 23.7806286, 90.2793692 ],
				zoom : 14,
				styles : [ {
					elementType : 'geometry',
					stylers : [ {
						color : '#eeeeee'
					} ]
				}, {
					elementType : 'labels.text.stroke',
					stylers : [ {
						color : '#eeeeee'
					} ]
				}, {
					elementType : 'labels.text.fill',
					stylers : [ {
						color : '#eeeeee'
					} ]
				}, {
					featureType : 'administrative.locality',
					elementType : 'labels.text.fill',
					stylers : [ {
						color : '#cdc9c2'
					} ]
				}, {
					featureType : 'poi',
					elementType : 'labels.text.fill',
					stylers : [ {
						color : '#cdc9c2'
					} ]
				}, {
					featureType : 'poi.park',
					elementType : 'geometry',
					stylers : [ {
						color : '#cdc9c2'
					} ]
				}, {
					featureType : 'poi.park',
					elementType : 'labels.text.fill',
					stylers : [ {
						color : '#c6c9c3'
					} ]
				}, {
					featureType : 'road',
					elementType : 'geometry',
					stylers : [ {
						color : '#c6c9c3'
					} ]
				}, {
					featureType : 'road',
					elementType : 'geometry.stroke',
					stylers : [ {
						color : '#cdc9c2'
					} ]
				}, {
					featureType : 'road',
					elementType : 'labels.text.fill',
					stylers : [ {
						color : '#cdc9c2'
					} ]
				}, {
					featureType : 'road.highway',
					elementType : 'geometry',
					stylers : [ {
						color : '#cdc9c2'
					} ]
				}, {
					featureType : 'road.highway',
					elementType : 'geometry.stroke',
					stylers : [ {
						color : '#cdc9c2'
					} ]
				}, {
					featureType : 'road.highway',
					elementType : 'labels.text.fill',
					stylers : [ {
						color : '#cdc9c2'
					} ]
				}, {
					featureType : 'transit',
					elementType : 'geometry',
					stylers : [ {
						color : '#e4e4e3'
					} ]
				}, {
					featureType : 'transit.station',
					elementType : 'labels.text.fill',
					stylers : [ {
						color : '#e4e4e3'
					} ]
				}, {
					featureType : 'water',
					elementType : 'geometry',
					stylers : [ {
						color : '#c3c7cc'
					} ]
				}, {
					featureType : 'water',
					elementType : 'labels.text.fill',
					stylers : [ {
						color : '#c3c7cc'
					} ]
				}, {
					featureType : 'water',
					elementType : 'labels.text.stroke',
					stylers : [ {
						color : '#c3c7cc'
					} ]
				} ],
				mapTypeControl : true,
				mapTypeControlOptions : {
					style : google.maps.MapTypeControlStyle.DROPDOWN_MENU
				},
				navigationControl : true,
				scrollwheel : false,
				streetViewControl : true,
			}

			if (isMobile()) {
				options.draggable = false;
			}

			$('#googleMaps').gmap3({
				map : {
					options : options
				},
				marker : {
					latLng : [ 23.7806286, 90.2793692 ],

				}
			});
		}
		init_gmap();
	</script>


</body>
</html>