<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="500.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>


<meta charset="utf-8" />
<title>LCK Language Center</title>
<!-- <meta http-equiv="Content-Security-Policy: 'https://www.facebook.com'" http-equiv="X-Frame-Options: SAMEORIGIN"/> -->
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<meta content="" name="keywords" />
<meta content="" name="description" />

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon" />
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,600,700,700i|Montserrat:300,400,500,600,700"
	rel="stylesheet" />

<!-- Bootstrap CSS File -->
<link href="assets/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

<!-- Libraries CSS Files -->
<link href="assets/lib/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="assets/lib/animate/animate.min.css" rel="stylesheet" />
<link href="assets/lib/ionicons/css/ionicons.min.css" rel="stylesheet" />
<link href="assets/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet" />
<link href="assets/lib/lightbox/css/lightbox.min.css" rel="stylesheet" />

<!-- Main Stylesheet File -->
<link href="assets/css/style.css" rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="assets/css/agency.min.css" rel="stylesheet" />

<script src="assets/lib/jquery/jquery.min.js"></script>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
	<!--==========================
  Header
  ============================-->
	<header id="header">
		<div id="topbar">
			<div class="container">
				<div class="social-links">
					<a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="logo float-left">
				<!-- Uncomment below if you prefer to use an image logo -->
				<h1 class="text-light">
					<a href="index.jsp" class="scrollto"><span>LCK</span></a>
				</h1>
				<!-- <a href="#header" class="scrollto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a> -->
			</div>

			<form action="ShowForumList" method="post" id="forumList">
			
			<nav class="main-nav float-right d-none d-lg-block">
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="aboutus.jsp">About Us</a></li>
					<li><a href="service.jsp">Services</a></li>
					<li><a href="photo.jsp">Photos</a></li>
					<li><a href="index.jsp#team">Team</a></li>
					<li><a href="index.jsp#footer">Contact Us</a></li>
					<li><a href="#" onclick="document.getElementById('forumList').submit()">Forum</a></li>
					<li class="active"><a href="affiliation.jsp">affiliation</a></li>
				</ul>
			</nav>
			</form>
			<!-- .main-nav -->
		</div>
	</header>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<!-- #header -->
	<!--==========================
      Why Us Section
    ============================-->
	<section id="why-us" class="wow fadeIn">
		<div class="container-fluid">
			<header class="section-header">
				<h3>Would you like to join with us?</h3>
				<p>Laudem latine persequeris id sed, ex fabulas delectus quo. No
					vel partiendo abhorreant vituperatoribus.</p>
			</header>

			<div class="row">
				<div class="col-lg-6">
					<div class="why-us-img">
						<img src="assets/img/why-us.jpg" alt="" class="img-fluid" />
					</div>
				</div>

				<div class="col-lg-6">
					<div class="why-us-content">


						<div class="features wow bounceInUp clearfix">
							<i class="fa fa-diamond" style="color: #f058dc;"></i>
							<h4>협약의 장점</h4>
							<p>한국에 있는 좋은 대학에 유학 성공 프로그램을 실행하여 학교가 가질 좋은 이미지 -> 학생의 미래를 위해
								학교에서 준비한 여러 가지 프로그램 중 유학프로그램을 장려함으로 한국에서 유망 직종 및 기술을 배울 수 있고,
								언어도 습득하여 학생들이 한국에서 그리고 베트남에서 성공할 수 있도록 안내하고 도와줄 수 있다. 학교가 학생들에게
								좋은 유학 프로그램과 커리큘럼을 제공해 줄 수 있도록 LCK유학센터가 좋은 유학 정보들과 한국 대학교, 기술 등에
								관한 최신 정보들을 지속적으로 공급함으로 본 학교가 훌륭하고 유망한 고등학교라는 평판을 갖는데 보탬이 될 수 있을
								것 이다. 또한 우리는 법적으로 아무런 문제가 없고, 베트남과 한국 두 나라 모두에서 직원들이 일을 하고 관리하고
								있기 때문에 학교입장에서 다른 유학원에 보낼 시 생길 수 있는 리스크들이 확연히 적고 학생들을 안정적으로 믿고 맡길
								수 있다.</p>
						</div>

						<div class="features wow bounceInUp clearfix">

							<i class="fa fa-object-group" style="color: #ffb774;"></i>
							<h4>다른 유학원들과의 차이점</h4>
							<p>학생들이 처음 한국에서 생활할 때 많은 어려움이 있습니다. 언어적인 면에서 그리고 필요한 정보를 얻거나
								생활할 때 도와주는 사람이 없기 때문에 많은 학생들이 힘들어 합니다. 대학교에서 실제로 수업을 한 교사이자 현지
								직원이 오랫동안 지켜봐 왔던 문제였고 그것을 해결하기 위해서 돌봄 서비스가 필요함을 알게 되었습니다. 다른
								유학원에서는 한국에 유학을 보내는 게 목표이고 한국에 간 이후 간단한 연락만 하고 있지 실제적인 도움을 주고 있지
								못합니다. 하지만 우리 유학원은 현지에 한국어교사 및 관리교사가 있으며 그들이 지속적인 방문과 돌봄을 통해 학생들이
								학업에만 몰두 할 수 있도록 도와줍니다. 그리고 법무법인과의 협력을 통해 학생들이 비자 변경 및 그와 관련된
								어려움이 있을 때와 졸업 후 직장을 구할 때 도움을 줄 수 있습니다.</p>
						</div>

						<!-- <div class="features wow bounceInUp clearfix">
							<i class="fa fa-language" style="color: #589af1;"></i>
							<h4>Voluptates dolores</h4>
							<p>Voluptates nihil et quis omnis et eaque omnis sint aut.
								Ducimus dolorum aspernatur. Totam dolores ut enim ullam voluptas
								distinctio aut.</p>
						</div> -->
					</div>
				</div>
			</div>
		</div>

		<br>

		<div class="container">
			<header class="section-header">
				<h3 style="text-align: center;">Our Clients</h3>
			</header>
			<div class="row counters">
				<div class="col-lg-3 col-6 text-center">
					<span data-toggle="counter-up">274</span>
					<p>Students</p>
				</div>

				<div class="col-lg-3 col-6 text-center">
					<span data-toggle="counter-up">26</span>
					<p>Connected Korean Communites</p>
				</div>

				<div class="col-lg-3 col-6 text-center">
					<span data-toggle="counter-up">1,364</span>
					<p>Hours Of Support</p>
				</div>

				<div class="col-lg-3 col-6 text-center">
					<span data-toggle="counter-up">306</span>
					<p>Hard Workers</p>
				</div>
			</div>
		</div>
		<br> <br> <br>
		<div class="container">
			<header class="section-header">
				<h3>문의사항이 있으시다면 언제든지 아래의 링크를 통해 문의하실 수 있습니다.</h3>
			</header>
			<br>
			<div class="row">
				<!-- empty -->
				<div class="col-lg-4 col-md-4 col-4 text-center"></div>
				<!-- kakao -->
				<div id="kakao-talk-channel-chat-button"
					class="col-lg-4 col-md-4 col-4 text-center"></div>

				<script src="js/kchat.js"></script>
				<!-- facebook -->
				<div class="col-lg-4 col-md-4 col-4 text-center">
					<!-- Load Facebook SDK for JavaScript -->

			<script src="js/facebook.chat.js"></script>
					<!-- Your customer chat code -->
					<div id="fb-root"></div>
					<!-- Your customer chat code -->
					<div class="fb-customerchat" id="fb-customerchat"></div>
		
				</div>
			</div>
			<!-- Load Facebook SDK for JavaScript -->



			<br> <br>


		</div>

	</section>
	<footer id="footer">
		<div class="container">
			<div class="copyright">
				<!-- &copy; Copyright <strong>LCK LANGUAGE CENTER</strong>. All Rights Reserved -->
			</div>
			<div class="credits">
		
			</div>
		</div>
	</footer>



	<!-- #affiliation -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
	<!-- Uncomment below i you want to use a preloader -->
	<!-- <div id="preloader"></div> -->

	<!-- JavaScript Libraries -->
	<script src="assets/lib/jquery/jquery.min.js"></script>
	<script src="assets/lib/jquery/jquery-migrate.min.js"></script>
	<script src="assets/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/lib/easing/easing.min.js"></script>
	<script src="assets/lib/mobile-nav/mobile-nav.js"></script>
	<script src="assets/lib/wow/wow.min.js"></script>
	<script src="assets/lib/waypoints/waypoints.min.js"></script>
	<script src="assets/lib/counterup/counterup.min.js"></script>
	<script src="assets/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="assets/lib/isotope/isotope.pkgd.min.js"></script>
	<script src="assets/lib/lightbox/js/lightbox.min.js"></script>
	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>
</body>
</html>
