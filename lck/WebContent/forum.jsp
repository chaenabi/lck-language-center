<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page errorPage="500.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LCK Language Center</title>

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

<script type="text/javascript">
    //엔터키로 submit 하는것을 방지한다.
    document.addEventListener('keydown', function(event) {
	if (event.keyCode === 13) {
	    event.preventDefault();
	}
	;
    }, true);
</script>



<style>
body a {
	font-size: 14px;
}

.progress {
	height: 31px;
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
			<a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="logo float-left">
				<!-- Uncomment below if you prefer to use an image logo -->
				<h1 class="text-light">
					<a href="#"  onclick="document.getElementById('forumList').submit()" class="scrollto" style="font-size: 36px;"><span>LCK</span></a>
				</h1>
				<!-- <a href="#header" class="scrollto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a> -->
			</div>
			<form action="ShowForumList" method="post" id="forumList">
			<nav class="main-nav float-right d-none d-lg-block">
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="aboutus.jsp">About Us</a></li>
					<li><a href="service.jsp">Services</a></li>

					<li><a href="index.jsp#team">Team</a></li>
					<li><a href="univ.jsp">University</a></li>
					<li><a href="index.jsp#footer">Contact Us</a></li>
					<li class="active"><a href="#" onclick="document.getElementById('forumList').submit()">Forum</a></li>
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
	<br />
	<br />
	<br />
	<br />
	<br />
	<!-- #header -->
	<div class="container-fluid">

		<!-- ë°°ê²½ ë³´ë¥ -->
		<!-- Slider -->
		<div class="tp-banner-container">
			<div class="tp-banner">

				<img src="assets/img/forum/background_1.png"
					data-bgrepeat="no-repeat" style="width: 100%; max-height: 480px;">

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
						<p>LCK Forum</p>
					</div>
					<div class="col-lg-4 search hidden-xs hidden-sm col-md-3">
						<div class="wrap">
							<form action="forum" method="post" class="form">
								<div class="pull-left txt">
									<input type="text" class="form-control" id="searchPost"
										placeholder="Search Topics" />
								</div>
								<div class="pull-right">
									<button class="btn btn-default" type="button" id="searchPostBtn">
										<i class="fa fa-search"></i>
									</button>
								</div>
								<div class="clearfix"></div>
							</form>
						</div>
					</div>
					<div class="col-lg-4 col-xs-12 col-sm-5 col-md-4 avt">
						<c:if test="${empty sessionScope.username}">
							<div class="pull-left ml-3">
								<button class="btn btn-light"
									onclick="location.href='login.jsp'">Sign in</button>
							</div>
						</c:if>
						<div class="stnt pull-left">

							<c:if test="${not empty sessionScope.username}">
								<form action="forum" method="post" class="form">
									<div>
										<!-- this input tag is used for identify post id (who wrote post) -->
										<input type="hidden" name="action" value="inputUserId" /> <input
											type="hidden" name="userId" value="${sessionScope.userId}" />
										<!--  -->

									</div>
									<button class="btn btn-primary">Start New Topic</button>
								</form>
							</c:if>
						</div>


						<c:if test="${not empty sessionScope.username}">

							<div class="avatar pull-left dropdown ml-5">
								<a data-toggle="dropdown" href="#"><img
									src="/lck/${request.getContextPath}${sessionScope.profile}"
									style="height: 37px; width: 37px;" alt="" /></a> <b class="caret"></b>
								<div class="status green">&nbsp;</div>

								<ul class="dropdown-menu" role="menu">
									<li role="presentation"><a role="menuitem" tabindex="-1"
										href="#">My Profile</a></li>
									<c:if test="${sessionScope.username eq '김진기' }">
										<li role="presentation"><a role="menuitem" tabindex="-4"
											href="new_account.jsp">Create account</a></li>
									</c:if>
									<li role="presentation"><a role="menuitem" id="logout"
										tabindex="-3" href="#">Log Out</a></li>

								</ul>
							</div>
						</c:if>
						<div class="clearfix"></div>

						<!-- logout -->
						<form name="user_logout" action="user" method="post">
							<input type="hidden" name="action" value="logout">
						</form>
						
						<!-- selectForumOne -->
						<form id="selectOne" action="ShowForumOne" method="post">
							<input type="hidden" name="forumNum" id="forumNum"/><!-- value adds by javascript code events (onClick list subject) -->
							<input type="hidden" name="action" value="selectOne"/>
						</form>
						
					</div>
				</div>
			</div>
		</div>


		<section class="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-xs-12 col-md-8">
						<div class="pull-left">
		
						</div>
						<div class="pull-left">
							<ul class="paginationforum" id="pagingForumPageUp">
								<jsp:include page="paging.jsp">
									<jsp:param value="${paging.page}" name="page" />
									<jsp:param value="${paging.beginPage}" name="beginPage" />
									<jsp:param value="${paging.endPage}" name="endPage" />
									<jsp:param value="${paging.prev}" name="prev" />
									<jsp:param value="${paging.next}" name="next" />
								</jsp:include>

							</ul>
						</div>
						<div class="pull-left">
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>


			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-8" id="post"></div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-xs-12 col-md-8">
						<div class="pull-left">
		
						</div>
						<div class="pull-left">
							<ul class="paginationforum" id="pagingForumPageDown">
								<jsp:include page="paging.jsp">
									<jsp:param value="${paging.page}" name="page" />
									<jsp:param value="${paging.beginPage}" name="beginPage" />
									<jsp:param value="${paging.endPage}" name="endPage" />
									<jsp:param value="${paging.prev}" name="prev" />
									<jsp:param value="${paging.next}" name="next" />
								</jsp:include>

							</ul>
						</div>
						<div class="pull-left">
						</div>
					</div>
				</div>
			</div>
		</section>

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

	<script src="js/bootstrap.min.js"></script>


	<script>
	var i = 0;
	var list = ${requestScope.forumList};
	var post = document.getElementById('post');
	console.log(list);
	for (i = 0; i < list.length; i++) {

	    // list[i].postFile 에 대하여
	    // 잘못 가져온 사진. 첨부파일의 사진이 아닌, 프로필 사진(IdentityPhoto)을 가져오도록 해야한다. 

	    post.innerHTML += "<div class='post'>"
		    + "<div class='wrap-ut pull-left'>"
		    + "<div class='userinfo pull-left'>"
		    + "<div class='avatar'>"
		    + "<img style='height: 37px; width: 37px;' src="+list[i].identityPhoto +"></img>"
		   
		    + "</div>"
		    + "</div>"
		    + "<div class='posttext pull-left'>"
		    + "<h2><a href='' onClick='javascript:selectPostOne(" + list[i].forumNum  +");' style='color: black;'>" +list[i].postSubject +"</a></h2>"
		    + "</div>"
		    + "<div class='clearfix'></div>"
		    + "</div>"
		    + "<div class='postinfo pull-left'>"
		    + "<div class='comments'>"
		    + "<div class='commentbg'>560"
		    + "<div class='mark'></div>"
		    + "</div>"
		    + "</div>"
		    + "<div class='views'>" + list[i].SawCount +
		    + "<i class='fa fa-eye'></i>"
		    + "</div>"
		    + "<div class='time'>"
		    + "<i class='fa fa-clock-o'></i> <a href='#' onClick='event.preventDefault()' style='color: #9da6aa; cursor: default; font-size: 12px;'>"
		    + list[i].postDate + "</a>" + "</div>" + "</div>"
		    + "<div class='clearfix'></div>" + "</div>";

	}
    </script>

	<script>
	
	function selectPostOne(forumNum) {
	   document.getElementById("forumNum").value = forumNum;
	   selectOne = document.getElementById("selectOne");
	   selectOne.submit();
	   
	}
	</script>
	
	<script>
	//for onclick event
	searchPostBtn = document.getElementById("searchPostBtn");
	
	searchPostBtn.addEventListener("click", function(){
	        var request = new XMLHttpRequest();
		    request.open('POST', "forum?action=searchPost&postSubject=" + encodeURIComponent(document.getElementById("searchPost").value), true);
		    request.onreadystatechange = searchProcess;
		    request.send(null);
		    
			function searchProcess() {
				var forumForm = document.getElementById("post");
				forumForm.innerHTML = "";
				
				if(request.readyState == 4 && request.status == 200) {
				    
				    // paging prevent
				    pagingForumPageUp = document.getElementById("pagingForumPageUp");
				    pagingForumPageDown = document.getElementById("pagingForumPageDown");
				    pagingForumPageUp.innerHTML = "";
				    pagingForumPageDown.innerHTML = "";

					object = eval('(' + request.responseText + ')');	

					object3 = JSON.parse(request.responseText);	

					console.log("4:"+object3);
					result = object.result;
					
					console.log(result);

					console.log("forumNum[0][0]: "+ result[0][0].forumNum);
					console.log("postSubject[0][3]: "+ result[0][3].postSubject);
					console.log("postContent[0][4]: "+ result[0][4].postContent);
					 
					console.log("forumNum[1][0]: "+ result[1][0].forumNum);
					console.log("postSubject[1][3]: "+ result[1][3].postSubject);
					console.log("postContent[1][4]: "+ result[1][4].postContent);
					
					var post = document.getElementById('post');
					post.innerHTML = "";
					
					 for(var i = 0; i < result.length; i++ ) {
				
						    
						    post.innerHTML += "<div class='post'>"
							    + "<div class='wrap-ut pull-left'>"
							    + "<div class='userinfo pull-left'>"
							    + "<div class='avatar'>"
							    + "<img style='height: 37px; width: 37px;' src='/lck/"+result[i][2].value +"'></img>"
							   
							    + "</div>"
							    + "</div>"
							    + "<div class='posttext pull-left'>"
							    + "<h2><a href='#' onClick='javascript:selectPostOne(" + result[i][0].value  +");' style='color: black;'>" +result[i][3].value +"</a></h2>"
							    + "</div>"
							    + "<div class='clearfix'></div>"
							    + "</div>"
							    + "<div class='postinfo pull-left'>"
							    + "<div class='comments'>"
							    + "<div class='commentbg'>560"
							    + "<div class='mark'></div>"
							    + "</div>"
							    + "</div>"
							    + "<div class='views'>"
							    + "<i class='fa fa-eye'></i>" + result[i][6].value +
							    + "</div>"
							    + "<div class='time'>"
							    + "<i class='fa fa-clock-o'></i> <a href='#' onClick='event.preventDefault()' style='color: #9da6aa; cursor: default; font-size: 12px;'>"
							    + result[i][7].value + "</a>" + "</div>" + "</div>"
							    + "<div class='clearfix'></div>" + "</div>";
					     
						} 
					}  
				}

	        });
	</script>
	

	<!-- END REVOLUTION SLIDER -->

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
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

	<script type="text/javascript">
	logout = document.getElementById("logout");
	logout.addEventListener("click", function(){
	    document.user_logout.submit();
	})
    </script>
</body>
</html>