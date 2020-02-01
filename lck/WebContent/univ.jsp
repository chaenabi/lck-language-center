<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="500.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>LCK Language Center</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
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

<!-- =======================================================
    Theme Name: Rapid
    Theme URL: https://bootstrapmade.com/rapid-multipurpose-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
<style>
.thumbnail-wrappper {
	width: 25%;
}

img {
	width: 80%;
	height: auto;
}

.in {
	display: inline-block;
}
</style>
</head>

<body>
	<!--==========================
  Header
  ============================-->
	<header id="header">
		<div id="topbar">
			<div class="container">
				<div class="social-links">
					<a href="https://www.facebook.com/lcklanguagecenter" class="facebook"><i class="fa fa-facebook"></i></a>
					<!-- <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
            <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
            <a href="#" class="instagram"><i class="fa fa-instagram"></i></a> -->
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
						<li class="active"><a href="index.jsp">Home</a></li>
						<li><a href="aboutus.jsp">About Us</a></li>
						<li><a href="service.jsp">Services</a></li>
						<li><a href="index.jsp#team">Team</a></li>
						<li><a href="univ.jsp">University</a></li>
						<li><a href="index.jsp#footer">Contact Us</a></li>
						<li><a href="#" onclick="document.getElementById('forumList').submit()">Forum</a></li>
						<li><a href="affiliation.jsp">Affiliation</a></li>


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
	<!--==========================
      Clients Section
    ============================-->
	<section id="clients" class="section-bg">
		<div class="container">
			<header class="section-header">
				<h3>Associated University List</h3>
			</header>
			<br>
			<div class="row">
				<div class="col-md-4 col-6">
					<div class="in">
						<a href="https://www.daeshin.ac.kr"><img src="assets/img/clients/daesin.png" alt="" /></a>
					</div>
				</div>
				<div class="col-md-4 col-6">
					<div class="in">
						<a href="https://www.dhc.ac.kr"><img src="assets/img/clients/daegu.png" alt="" /></a>
					</div>
				</div>
				<div class="col-md-4 col-6">
					<a href="https://www.khu.ac.kr"><img src="assets/img/clients/gyeonghi.png" alt="" /></a>
				</div>


				<div class="col-md-4 col-6">
					<a href="https://www.kiu.ac.kr"><img src="assets/img/clients/gyeongil.png" alt="" /></a>
				</div>
				<div class="col-md-4 col-6">
					<a href="http://www.snu.ac.kr"><img src="assets/img/clients/seoul.png" alt="" /></a>
				</div>
				<div class="col-md-4 col-6">
					<a href="https://www.kumoh.ac.kr"><img src="assets/img/clients/kumoh.jpeg" alt="" /></a>
				</div>


				<div class="col-md-4 col-6">
					<a href="http://www.u1.ac.kr"><img src="assets/img/clients/uone.png" alt="" /></a>
				</div>
				<div class="col-md-4 col-6">
					<a href="https://www.yju.ac.kr/"><img src="assets/img/clients/youngjin.jpg" alt="" /></a>
				</div>
			</div>
		</div>

	</section>
	<!-- #clients -->

	<!--==========================
      Clients Section
    ============================-->
	<section id="testimonials">
		<div class="container">
			<header class="section-header">
				<h3>Experienced People</h3>
			</header>

			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="owl-carousel testimonials-carousel wow fadeInUp">
						<div class="testimonial-item">
							<!-- <img src="assets/img/testimonial-1.jpg" class="testimonial-img"
								alt="" /> -->
							<h3>반 니</h3>
							<h4>2019-01-07</h4>
							<p>처음에 한국에 도착해서 학교에 도착했을 때 대표님과 부대표님이 함께 오셔서 학교 담당자들과 만났습니다.
								그래서 학교 생활 시작하는 데 있어서 어려움이 없었고 나를 돌봐 준다는 기분이 들었습니다, 그 이후 학교 다닐 때
								베트남어를 잘 하는 한국인 부부와 함께 생활할 수 있도록 도와주어서 한국 생활 적응하는 데 많은 도움을 얻었습니다.
							</p>
						</div>

						<div class="testimonial-item">
							<!-- <img src="assets/img/testimonial-2.jpg" class="testimonial-img"
								alt="" /> -->
							<h3>프엉</h3>
							<h4>2019-01-07</h4>
							<p>한국에 유학을 가고 싶어서 유학원을 검색하다가 페이스북에서 LCK 유학원을 찾을 수 있었습니다.
								전문적으로 팀이 구성되어 있었고 각자의 역할에 최선을 다하고 학생들을 관리해주고 도와준다는 것을 알게 되었습니다.
								그리고 현직 한국어 선생님이 베트남에 정기적으로 방문하여 한국어를 가르쳐줘서 훨씬 더 특별한 기분이 들었습니다.</p>
						</div>

						<!--   <div class="testimonial-item">
                <img
                  src="assets/img/testimonial-4.jpg"
                  class="testimonial-img"
                  alt=""
                />
                <h3>Matt Brandon</h3>
                <h4>2019-01-07</h4>
                <p>
                  Fugiat enim eram quae cillum dolore dolor amet nulla culpa
                  multos export minim fugiat minim velit minim dolor enim duis
                  veniam ipsum anim magna sunt elit fore quem dolore labore
                  illum veniam.
                </p>
              </div> -->
					</div>
				</div>
			</div>
		</div>
	</section>
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
