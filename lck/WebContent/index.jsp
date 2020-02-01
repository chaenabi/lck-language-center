<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="500.jsp" %>
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

</head>

<body>
	<!--==========================
  Header
  ============================-->
	<header id="header">
		<div id="topbar">
			<div class="container">
				<div class="social-links">
					<c:if test="${not empty sessionScope.username}">
						${sessionScope.username}님 로그인중
					</c:if>
				
				
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

					<!--  todo List : font-size re-rendering  -->
					<a href="index.jsp" class="scrollto" id="Page_title">LCK</a>
				</h1>
				<!-- <a href="#header" class="scrollto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a> -->
			</div>

			<form action="ShowForumList" method="post" id="forumList">
				<nav class="main-nav float-right d-none d-lg-block">
					<ul>
						<li class="active"><a href="index.jsp">Home</a></li>
						<li><a href="aboutus.jsp">About Us</a></li>
						<li><a href="service.jsp">Services</a></li>
						<li><a href="#team">Team</a></li>
						<li><a href="univ.jsp">University</a></li>
						<li><a href="#footer">Contact Us</a></li>
						<li><a href="#" onclick="document.getElementById('forumList').submit()">Forum</a></li>
						<li><a href="affiliation.jsp">Affiliation</a></li>


					</ul>
				</nav>
			</form>
			<!-- .main-nav -->
		</div>
	</header>
	<!-- #header -->

	<!--==========================
    Intro Section
  ============================-->
	<section id="intro" class="clearfix">
		<div class="container d-flex h-100">
			<div class="row justify-content-center align-self-center">
				<div class="col-md-6 intro-info order-md-first order-last">
					<h2>
						Welcome to<br />
						<span>LCK Language Center!</span>
					</h2>
					<div>
						<a href="#" onclick="document.getElementById('forumList').submit()" class="btn-get-started scrollto">Get
							Started</a>
					</div>
				</div>

				<div class="col-md-6 intro-img order-md-last order-first">
					<img src="assets/img/intro-img.svg" alt="" class="img-fluid" />
				</div>
			</div>
		</div>
	</section>
	<!-- #intro -->

	<!--==========================
      Call To Action Section
    ============================--> <!-- <section id="call-to-action" class="wow fadeInUp">
      <div class="container">
        <div class="row">
          <div class="col-lg-9 text-center text-lg-left">
            <h3 class="cta-title">Call To Action</h3>
            <p class="cta-text"> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
          </div>
          <div class="col-lg-3 cta-btn-container text-center">
            <a class="cta-btn align-middle" href="#">Call To Action</a>
          </div>
        </div>
      </div>
    </section> --> <!-- #call-to-action --> <!--==========================
      Features Section
    ============================-->
	<section id="features">
		<div class="container">
			<div class="row feature-item">
				<div class="col-lg-6 wow fadeInUp">
					<img src="assets/img/portfolio/web1.jpg" class="img-fluid" alt="" />
				</div>
				<div class="col-lg-6 wow fadeInUp pt-5 pt-lg-0">
					<h4>LCK Language Center 사이트를 방문해 주셔서 감사합니다.</h4>
					<p></p>
					<p>
						저희 베트남 지점은 호치민에 위치하고 있으며 그곳에서 한국어 수업 및 유학 코스를 밟으실 수 있습니다.<br>
						이 사이트를 통해 다양한 정보들과 저희 LCK가 가지고있는 특별한 장점들을 알아보시기 바랍니다.<br> 상담
						문의도 언제든 환영합니다.
					</p>
				
					<p>
						저희 센터를 통해 안전하고 성공적인 유학생활을 하실 수 있으며 학생 여러분들의<br> 빛나는 꿈을 활짝
						펼치시길 바랍니다.

					</p>
				</div>
			</div>

			<!-- <div class="row feature-item mt-5 pt-5">
          <div class="col-lg-6 wow fadeInUp order-1 order-lg-2">
            <img src="assets/img/features-2.svg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 wow fadeInUp pt-4 pt-lg-0 order-2 order-lg-1">
            <h4>Neque saepe temporibus repellat ea ipsum et. Id vel et quia tempora facere reprehenderit.</h4>
            <p>
             Delectus alias ut incidunt delectus nam placeat in consequatur. Sed cupiditate quia ea quis. Voluptas nemo qui aut distinctio. Cumque fugit earum est quam officiis numquam. Ducimus corporis autem at blanditiis beatae incidunt sunt. 
            </p>
            <p>
              Voluptas saepe natus quidem blanditiis. Non sunt impedit voluptas mollitia beatae. Qui esse molestias. Laudantium libero nisi vitae debitis. Dolorem cupiditate est perferendis iusto.
            </p>
            <p>
              Eum quia in. Magni quas ipsum a. Quis ex voluptatem inventore sint quia modi. Numquam est aut fuga mollitia exercitationem nam accusantium provident quia.
            </p>
          </div>
          
        </div> -->
		</div>
	</section>
	
	<!-- #about --> <!--==========================
      Team Section
    ============================-->
	<section id="team" class="section-bg">
		<div class="container">
			<div class="section-header">
				<h3>LCK 임원진</h3>
				<p>여러분을 이끌어줄 믿음직한 LCK의 임원진들을 소개합니다.</p>
			</div>

			<div class="row">
				<div class="col-lg-3 col-md-6 wow fadeInUp">
					<div class="member">
						<img src="assets/img/instructor_4.jpeg" class="img-fluid" alt="" />
						<div class="member-info">
							<div class="member-info-content">
								<h4>최봉길</h4>
								<span>LCK 대표 및 법률 사무소 운영</span>
								<div class="social">
									<!-- <a href=""><i class="fa fa-twitter"></i></a> <a href=""><i
										class="fa fa-facebook"></i></a> <a href=""><i
										class="fa fa-google-plus"></i></a> <a href=""><i
										class="fa fa-linkedin"></i></a> -->
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
					<div class="member">
						<img src="assets/img/instructor_1.jpeg" class="img-fluid" alt="" />
						<div class="member-info">
							<div class="member-info-content">
								<h4>김진규</h4>
								<span>부대표 및 현직 한국어 강사</span>
								<div class="social">
									<!-- <a href=""><i class="fa fa-twitter"></i></a> <a href=""><i
										class="fa fa-facebook"></i></a> <a href=""><i
										class="fa fa-google-plus"></i></a> <a href=""><i
										class="fa fa-linkedin"></i></a> -->
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
					<div class="member">
						<img src="assets/img/instructor_2.jpeg" class="img-fluid" alt="" />
						<div class="member-info">
							<div class="member-info-content">
								<h4>김진기</h4>
								<span>부장 및 학생 관리 담당</span>
								<div class="social">
									<!-- <a href=""><i class="fa fa-twitter"></i></a> <a href=""><i
										class="fa fa-facebook"></i></a> <a href=""><i
										class="fa fa-google-plus"></i></a> <a href=""><i
										class="fa fa-linkedin"></i></a> -->
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
					<div class="member">
						<img src="assets/img/instructor_3.jpeg" class="img-fluid" alt="" />
						<div class="member-info">
							<div class="member-info-content">
								<h4>최새민</h4>
								<span>한국에서 베트남 학생들 담당 및  상담</span>
								<div class="social">
									<!-- <a href=""><i class="fa fa-twitter"></i></a> <a href=""><i
										class="fa fa-facebook"></i></a> <a href=""><i
										class="fa fa-google-plus"></i></a> <a href=""><i
										class="fa fa-linkedin"></i></a> -->
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
					<div class="member">
						<img src="assets/img/team-4.jpg" class="img-fluid" alt="" />
						<div class="member-info">
							<div class="member-info-content">
								<h4>경동수</h4>
								<span>실장</span>
								<div class="social">
									<!-- <a href=""><i class="fa fa-twitter"></i></a> <a href=""><i
										class="fa fa-facebook"></i></a> <a href=""><i
										class="fa fa-google-plus"></i></a> <a href=""><i
										class="fa fa-linkedin"></i></a>
							 -->	</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
					<div class="member">
						<img src="assets/img/instructor_5.jpeg" class="img-fluid" alt="" />
						<div class="member-info">
							<div class="member-info-content">
								<h4>롬</h4>
								<span>베트남 현지 상담 및 담당자</span>
								<div class="social">
									<a href=""><i class="fa fa-facebook"></i></a> <a
										href="mailto:sam70411@gmail.com"><i class="fa fa-envelope"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</section>
	<!-- #team -->

	<!--==========================
    Footer
  ============================-->
	<footer id="footer" class="section-bg">
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div class="row">
							<div class="col-sm-4"></div>

							<div class="col-sm-5">
								<div class="footer-links">
									<h4>Useful Links</h4>
									<ul>
										<li><a href="#">Home</a></li>
										<li><a href="#">About us</a></li>
										<li><a href="#">Services</a></li>
										<li><a href="#">Terms of service</a></li>
										<li><a href="#">Privacy policy</a></li>
									</ul>
								</div>

								<div class="footer-links">
									<h4>Contact Us</h4>
									<p>
										Doryang-dong <br /> Gyeongsangbuk-do Gumi-si<br /> South
										Korea <br /> <strong>Phone:</strong> +82 10 4067 8303<br />
										<strong>Email:</strong> lovingjcn@gmail.com<br />
									</p>
								</div>

								<div class="social-links">
									<a href="https://www.facebook.com/lcklanguagecenter" class="facebook"><i
										class="fa fa-facebook"></i></a> <!-- <a href="#" class="instagram"><i
										class="fa fa-instagram"></i></a> <a href="#" class="linkedin"><i
										class="fa fa-linkedin"></i></a><a href="#" class="twitter"><i
										class="fa fa-twitter"></i></a>  -->
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4">
						<div class="form">
							<h4>Send us a message</h4>
							<p>궁금한 점이 있으시거나 상담하길 원하신다면 이 곳에 메세지 남겨주시기 바랍니다.</p>
							<form action="TakeEmailFromClient" method="post" role="form" class="contactForm">
								<div class="form-group">
									<input type="text" name="name" class="form-control" id="name"
										placeholder="Your Name" data-rule="minlen:4"
										data-msg="Please enter at least 4 chars" />
									<div class="validation"></div>
								</div>
								<div class="form-group">
									<input type="email" class="form-control" name="email"
										id="email" placeholder="Your Email" data-rule="email"
										data-msg="Please enter a valid email" />
									<div class="validation"></div>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="subject"
										id="subject" placeholder="Subject" data-rule="minlen:4"
										data-msg="Please enter at least 8 chars of subject" />
									<div class="validation"></div>
								</div>
								<div class="form-group">
									<textarea class="form-control" name="message" rows="5"
										data-rule="required" data-msg="Please write something for us"
										placeholder="Message"></textarea>
									<div class="validation"></div>
								</div>

								<div id="sendmessage">Your message has been sent. Thank
									you!</div>
								<div id="errormessage"></div>

								<div class="text-center">
									<button type="submit" title="Send Message">Send
										Message</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="copyright">
				<!-- &copy; Copyright <strong>LCK LANGUAGE CENTER</strong>. All Rights Reserved -->
			</div>
			<div class="credits">
				
			</div>
		</div>
	</footer>
	<!-- #footer -->

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
