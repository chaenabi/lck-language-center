<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Forum :: Topic</title>

<!-- Bootstrap -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom -->
<link href="assets/css/custom.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
          <![endif]-->

<!-- fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="assets/fonts/css/font-awesome.min.css">

<!-- CSS STYLE-->
<link rel="stylesheet" type="text/css" href="assets/css/style.css"
	media="screen" />

<!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
<link rel="stylesheet" type="text/css"
	href="assets/rs-plugin/css/settings.css" media="screen" />

</head>
<body class="topic">

	<div class="container-fluid">

		<!-- Slider -->
		<div class="tp-banner-container">
			<div class="tp-banner">
				<ul>
					<!-- SLIDE  -->
					<li data-transition="fade" data-slotamount="7"
						data-masterspeed="1500">
						<!-- MAIN IMAGE --> <img src="assets/img/slide.jpg" alt="slidebg1"
						data-bgfit="cover" data-bgposition="left top"
						data-bgrepeat="no-repeat"> <!-- LAYERS -->
					</li>
				</ul>
			</div>
		</div>
		<!-- //Slider -->


		<div class="headernav">
			<div class="container">
				<div class="row">
					<div class="col-lg-1 col-xs-3 col-sm-2 col-md-2 logo ">
						<a href="index.jsp"><img src="assets/img/logo.jpg" alt="" /></a>
					</div>
					<div class="col-lg-3 col-xs-9 col-sm-5 col-md-3 selecttopic">

					</div>
					<div class="col-lg-4 search hidden-xs hidden-sm col-md-3"></div>

					<c:if test="${not empty sessionScope.username}">
						<div class="col-lg-4 col-xs-12 col-sm-5 col-md-4 avt">
							<div class="stnt pull-left">
								<form action="new_topic.jsp" method="post" class="form">
									<button class="btn btn-primary">Start New Topic</button>
								</form>
							</div>
							<div class="env pull-left">&nbsp;</div>

							<div class="avatar pull-left dropdown ml-5">
								<a data-toggle="dropdown" href="#"><img
									src="/lck/${request.getContextPath}${sessionScope.profile}"
									style="height: 37px; width: 37px;" alt="" /></a> <b class="caret"></b>
								<div class="status green">&nbsp;</div>
								<ul class="dropdown-menu" role="menu">
									<li role="presentation"><a role="menuitem" tabindex="-1"
										href="#">My Profile</a></li>

									<li role="presentation"><a role="menuitem" tabindex="-3"
										id="logout" href="#">Log Out</a></li>
									<c:if test="${sessionScope.username eq '김진기' }">
										<li role="presentation"><a role="menuitem" tabindex="-4"
											href="new_account.jsp">Create account</a></li>
									</c:if>
								</ul>
							</div>

							<div class="clearfix"></div>
							<!--  log out -->
							<form name="user_logout" action="user" method="post">
								<input type="hidden" name="action" value="logout">
							</form>
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<!-- logout -->




		<section class="content">
			<div class="container">&nbsp;</div>


			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-8">

						<!-- POST -->
						<div class="post beforepagination">
							<div class="topwrap">
								<div class="userinfo pull-left">
									<div class="avatar">
										<img src="/lck/${requestScope.profile}"
											style="height: 37px; width: 37px;" alt="" />
										<div class="status green">&nbsp;</div>
									</div>

									<!-- <div class="icons">
										<img src="assets/img/icon1.jpg" alt="" /><img
											src="assets/img/icon4.jpg" alt="" /><img
											src="assets/img/icon5.jpg" alt="" /><img
											src="assets/img/icon6.jpg" alt="" />
									</div> -->
								</div>
								<div class="posttext pull-left">

									<h2>${requestScope.postSubject}</h2>
									<p>${requestScope.postContent}</p>
								</div>
								<div class="clearfix"></div>
							</div>
							<!--                             
                                <div class="postinfobot">

                                    <div class="likeblock pull-left">
                                        <a href="#" class="up"><i class="fa fa-thumbs-o-up"></i>25</a>
                                        <a href="#" class="down"><i class="fa fa-thumbs-o-down"></i>3</a>
                                    </div>

                                    <div class="prev pull-left">                                        
                                        <a href="#"><i class="fa fa-reply"></i></a>
                                    </div>

                                    <div class="posted pull-left"><i class="fa fa-clock-o"></i> Posted on : 20 Nov @ 9:30am</div>

                                    <div class="next pull-right">                                        
                                        <a href="#"><i class="fa fa-share"></i></a>

                                        <a href="#"><i class="fa fa-flag"></i></a>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>
                            </div>POST

                            <div class="paginationf">
                                <div class="pull-left"><a href="#" class="prevnext"><i class="fa fa-angle-left"></i></a></div>
                                <div class="pull-left">
                                    <ul class="paginationforum">
                                        <li class="hidden-xs"><a href="#">1</a></li>
                                        <li class="hidden-xs"><a href="#">2</a></li>
                                        <li class="hidden-xs"><a href="#">3</a></li>
                                        <li class="hidden-xs"><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li><a href="#">6</a></li>
                                        <li><a href="#" class="active">7</a></li>
                                        <li><a href="#">8</a></li>
                                        <li class="hidden-xs"><a href="#">9</a></li>
                                        <li class="hidden-xs"><a href="#">10</a></li>
                                        <li class="hidden-xs hidden-md"><a href="#">11</a></li>
                                        <li class="hidden-xs hidden-md"><a href="#">12</a></li>
                                        <li class="hidden-xs hidden-sm hidden-md"><a href="#">13</a></li>
                                        <li><a href="#">1586</a></li>
                                    </ul>
                                </div>
                                <div class="pull-left"><a href="#" class="prevnext last"><i class="fa fa-angle-right"></i></a></div>
                                <div class="clearfix"></div>
                            </div>

                            POST
                            <div class="post">
                                <div class="topwrap">
                                    <div class="userinfo pull-left">
                                        <div class="avatar">
                                            <img src="assets/img/avatar2.jpg" alt="" />
                                            <div class="status red">&nbsp;</div>
                                        </div>

                                        <div class="icons">
                                            <img src="assets/img/icon3.jpg" alt="" /><img src="assets/img/icon4.jpg" alt="" /><img src="assets/img/icon5.jpg" alt="" /><img src="assets/img/icon6.jpg" alt="" />
                                        </div>
                                    </div>
                                    <div class="posttext pull-left">
                                        <p>Typography helps you engage your audience and establish a distinct, unique personality on your website. Knowing how to use fonts to build character in your design is a powerful skill, and exploring the history and use of typefaces, as well as typogra...</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>                              
                                <div class="postinfobot">

                                    <div class="likeblock pull-left">
                                        <a href="#" class="up"><i class="fa fa-thumbs-o-up"></i>10</a>
                                        <a href="#" class="down"><i class="fa fa-thumbs-o-down"></i>1</a>
                                    </div>

                                    <div class="prev pull-left">                                        
                                        <a href="#"><i class="fa fa-reply"></i></a>
                                    </div>

                                    <div class="posted pull-left"><i class="fa fa-clock-o"></i> Posted on : 20 Nov @ 9:45am</div>

                                    <div class="next pull-right">                                        
                                        <a href="#"><i class="fa fa-share"></i></a>

                                        <a href="#"><i class="fa fa-flag"></i></a>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>
                            </div>POST



                            POST
                            <div class="post">
                                <div class="topwrap">
                                    <div class="userinfo pull-left">
                                        <div class="avatar">
                                            <img src="assets/img/avatar3.jpg" alt="" />
                                            <div class="status red">&nbsp;</div>
                                        </div>

                                        <div class="icons">
                                            <img src="assets/img/icon3.jpg" alt="" /><img src="assets/img/icon4.jpg" alt="" /><img src="assets/img/icon5.jpg" alt="" /><img src="assets/img/icon6.jpg" alt="" />
                                        </div>
                                    </div>
                                    <div class="posttext pull-left">

                                        <blockquote>
                                            <span class="original">Original Posted by - theguy_21:</span>
                                            Did you see that Dove ad pop up in your Facebook feed this year? How about the Geico camel one? 
                                        </blockquote>
                                        <p>Toronto Mayor Rob Ford does not have a bigger fan than "Anchorman's" Ron Burgundy. In fact, Burgundy wants Ford to be re-elected so much, that he agreed to sing the campaign song Brien. The tune in question ...</p>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>                              
                                <div class="postinfobot">

                                    <div class="likeblock pull-left">
                                        <a href="#" class="up"><i class="fa fa-thumbs-o-up"></i>55</a>
                                        <a href="#" class="down"><i class="fa fa-thumbs-o-down"></i>12</a>
                                    </div>

                                    <div class="prev pull-left">                                        
                                        <a href="#"><i class="fa fa-reply"></i></a>
                                    </div>

                                    <div class="posted pull-left"><i class="fa fa-clock-o"></i> Posted on : 20 Nov @ 9:50am</div>

                                    <div class="next pull-right">                                        
                                        <a href="#"><i class="fa fa-share"></i></a>

                                        <a href="#"><i class="fa fa-flag"></i></a>
                                    </div>

                                    <div class="clearfix"></div>
                                </div>
                            </div>POST



                            POST
                            <div class="post">
                                <form action="#" class="form" method="post">
                                    <div class="topwrap">
                                        <div class="userinfo pull-left">
                                            <div class="avatar">
                                                <img src="assets/img/avatar4.jpg" alt="" />
                                                <div class="status red">&nbsp;</div>
                                            </div>

                                            <div class="icons">
                                                <img src="assets/img/icon3.jpg" alt="" /><img src="assets/img/icon4.jpg" alt="" /><img src="assets/img/icon5.jpg" alt="" /><img src="assets/img/icon6.jpg" alt="" />
                                            </div>
                                        </div>
                                        <div class="posttext pull-left">
                                            <div class="textwraper">
                                                <div class="postreply">Post a Reply</div>
                                                <textarea name="reply" id="reply" placeholder="Type your message here"></textarea>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>                              
                                    <div class="postinfobot">

                                        <div class="notechbox pull-left">
                                            <input type="checkbox" name="note" id="note" class="form-control" />
                                        </div>

                                        <div class="pull-left">
                                            <label for="note"> Email me when some one post a reply</label>
                                        </div>

                                        <div class="pull-right postreply">
                                            <div class="pull-left smile"><a href="#"><i class="fa fa-smile-o"></i></a></div>
                                            <div class="pull-left"><button type="submit" class="btn btn-primary">Post Reply</button></div>
                                            <div class="clearfix"></div>
                                        </div>


                                        <div class="clearfix"></div>
                                    </div>
                                </form>-->
						</div>
						<!-- POST -->
					</div>

				</div>
				<div class="col-lg-4 col-md-4">

					<!-- -->
					<!-- <div class="sidebarblock">
                                <h3>Categories</h3>
                                <div class="divline"></div>
                                <div class="blocktxt">
                                    <ul class="cats">
                                        <li><a href="#">Trading for Money <span class="badge pull-right">20</span></a></li>
                                        <li><a href="#">Vault Keys Giveway <span class="badge pull-right">10</span></a></li>
                                        <li><a href="#">Misc Guns Locations <span class="badge pull-right">50</span></a></li>
                                        <li><a href="#">Looking for Players <span class="badge pull-right">36</span></a></li>
                                        <li><a href="#">Stupid Bugs &amp; Solves <span class="badge pull-right">41</span></a></li>
                                        <li><a href="#">Video &amp; Audio Drivers <span class="badge pull-right">11</span></a></li>
                                        <li><a href="#">2K Official Forums <span class="badge pull-right">5</span></a></li>
                                    </ul>
                                </div>
                            </div> -->

					<!-- -->
					<!--  <div class="sidebarblock">
                                <h3>Poll of the Week</h3>
                                <div class="divline"></div>
                                <div class="blocktxt">
                                    <p>Which game you are playing this week?</p>
                                    <form action="#" method="post" class="form">
                                        <table class="poll">
                                            <tr>
                                                <td>
                                                    <div class="progress">
                                                        <div class="progress-bar color1" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 90%">
                                                            Call of Duty Ghosts
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="chbox">
                                                    <input id="opt1" type="radio" name="opt" value="1">  
                                                    <label for="opt1"></label>  
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="progress">
                                                        <div class="progress-bar color2" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 63%">
                                                            Titanfall
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="chbox">
                                                    <input id="opt2" type="radio" name="opt" value="2" checked>  
                                                    <label for="opt2"></label>  
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div class="progress">
                                                        <div class="progress-bar color3" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 75%">
                                                            Battlefield 4
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="chbox">
                                                    <input id="opt3" type="radio" name="opt" value="3">  
                                                    <label for="opt3"></label>  
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                    <p class="smal">Voting ends on 19th of October</p>
                                </div>
                            </div>

                           
                            <div class="sidebarblock">
                                <h3>My Active Threads</h3>
                                <div class="divline"></div>
                                <div class="blocktxt">
                                    <a href="#">This Dock Turns Your iPhone Into a Bedside Lamp</a>
                                </div>
                                <div class="divline"></div>
                                <div class="blocktxt">
                                    <a href="#">Who Wins in the Battle for Power on the Internet?</a>
                                </div>
                                <div class="divline"></div>
                                <div class="blocktxt">
                                    <a href="#">Sony QX10: A Funky, Overpriced Lens Camera for Your Smartphone</a>
                                </div>
                                <div class="divline"></div>
                                <div class="blocktxt">
                                    <a href="#">FedEx Simplifies Shipping for Small Businesses</a>
                                </div>
                                <div class="divline"></div>
                                <div class="blocktxt">
                                    <a href="#">Loud and Brave: Saudi Women Set to Protest Driving Ban</a>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>



                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="pull-left"><a href="#" class="prevnext"><i class="fa fa-angle-left"></i></a></div>
                            <div class="pull-left">
                                <ul class="paginationforum">
                                    <li class="hidden-xs"><a href="#">1</a></li>
                                    <li class="hidden-xs"><a href="#">2</a></li>
                                    <li class="hidden-xs"><a href="#">3</a></li>
                                    <li class="hidden-xs"><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">6</a></li>
                                    <li><a href="#" class="active">7</a></li>
                                    <li><a href="#">8</a></li>
                                    <li class="hidden-xs"><a href="#">9</a></li>
                                    <li class="hidden-xs"><a href="#">10</a></li>
                                    <li class="hidden-xs hidden-md"><a href="#">11</a></li>
                                    <li class="hidden-xs hidden-md"><a href="#">12</a></li>
                                    <li class="hidden-xs hidden-sm hidden-md"><a href="#">13</a></li>
                                    <li><a href="#">1586</a></li>
                                </ul>
                            </div>
                            <div class="pull-left"><a href="#" class="prevnext last"><i class="fa fa-angle-right"></i></a></div>
                                     -->
				</div>
			</div>
			<div class="container">&nbsp;</div>
			<div class="clearfix"></div>
		</section>
		<br> <br> <br>
		<footer>
			<div class="container">
				<div class="row">
					<div class="col-lg-1 col-xs-3 col-sm-2 logo ">
						<a href="#"><img src="assets/img/logo.jpg" alt="" /></a>
					</div>
					<div class="col-lg-8 col-xs-9 col-sm-5 ">Copyrights 2020,
						websitename.com</div>
					<div class="col-lg-3 col-xs-12 col-sm-5 sociconcent">
						<ul class="socialicons">
							<li><a href="#"><i class="fa fa-facebook-square"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
							<li><a href="#"><i class="fa fa-cloud"></i></a></li>
							<li><a href="#"><i class="fa fa-rss"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
	</div>

	<!-- get jQuery from the google apis -->
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.js"></script>

	<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
	<script type="text/javascript"
		src="assets/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
	<script type="text/javascript"
		src="assets/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>

	<script>
	
    </script>


	<!-- LOOK THE DOCUMENTATION FOR MORE INFORMATIONS -->
	<script type="text/javascript">
	var revapi;

	jQuery(document).ready(function() {
	    "use strict";
	    revapi = jQuery('.tp-banner').revolution({
		delay : 15000,
		startwidth : 1200,
		startheight : 278,
		hideThumbs : 10,
		fullWidth : "on"
	    });

	}); //ready
    </script>
	<script type="text/javascript">
	document.getElementById("logout").onclick = function() {
	    document.user_logout.submit();
	}
    </script>
	<!-- END REVOLUTION SLIDER -->
</body>
</html>