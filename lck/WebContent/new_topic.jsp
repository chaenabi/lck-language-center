<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="500.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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


<link rel="stylesheet" href="assets/fonts/css/font-awesome.min.css">

<!-- CSS STYLE-->
<link rel="stylesheet" type="text/css" href="assets/css/style.css"
	media="screen" />

<!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
<link rel="stylesheet" type="text/css"
	href="assets/rs-plugin/css/settings.css" media="screen" />
<!-- fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<script src="assets/lib/jquery/jquery.min.js"></script>
<!-- <script>
// video tag event
window.onload = function() {
    var videoSrc = $('#attachvideo').attr("src").trim();
	if(videoSrc == '' || videoSrc == null) {
	    $('#toggleHidden').attr('style', 'display:none;');
	}
}
</script> -->

<script>
    // 비동기 업로드 js
    $(document).ready(function(e) {

	// [1]
	$("#ex_file").on("change", function() {
	    ext = $(this).val().split('.').pop().toLowerCase();

	    if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg', 'mov', 'avi', 'mpg', 'mp4', 'mpeg', 'wmv', 'flv' ]) == -1) {
		resetFormElement($(this));
		window.alert('등록불가! (그림파일은 gif, png, jpg, jpeg 확장자, 동영상은 mov, avi, mpg, mpeg, mp4, wmv, flv 확장자만 등록가능합니다.)');
	    } else {

		var fileidvalue = document.getElementById("ex_file").value;
		file = $('#ex_file').prop("files")[0];
		
		//fake path cannot work with src display, so use createObjectURL.
		blobURL = window.URL.createObjectURL(file);
		
		ext = fileidvalue.split('.').pop().toLowerCase();

		//get pure filename
	   	fileidvalue = fileidvalue.substring(fileidvalue.lastIndexOf('\\')+1);
	   	console.log("purefilename: " + fileidvalue);
	   	
	   	
		if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg'])  != -1) {
		    $('#attachphoto').removeAttr('src');
			$('#attachphoto').attr({
			    src : blobURL,
			}).css({
			    'height' : '37px',
			    'width' : '37px'
			}); 
			
			$('#postPhoto').val(fileidvalue);
			
		} else {

		    $('#attachvideoname').attr('style', 'display: block;');
		    isAttached = document.getElementById('isAttached');
		    isAttached.innerHTML = fileidvalue +' has uploaded';
		    
		    $('#postVideo').val(fileidvalue);
		    
		    /* work with video tag 
		   $('#attachvideo').removeAttr('src'); 
		    $('#toggleHidden').attr('style', 'display:block;');
		    $('#attachvideo').attr({	
				src : blobURL,
			}); */
		}
		
		
		

		//window.URL
		//.revokeObjectURL(file);

	    }
	    //비동기 업로드를 위해 submit        
	    $("#uploadsubmit").submit();
	});

	//[2]
	$('#uploadsubmit').on('submit', (function(e) {
	    //e.preventDefault();
	    var file = document.getElementById("ex_file");
	    var fileData = new FormData();
	    
	    fileData.append('Topic_content_file', file.files[0]);
	    fileData.append('Topic_content_filename', file.value);

	    $.ajax({
		type : 'POST',
		url : "TopicFileUploadServlet",
		data : fileData,
		cache : false,
		contentType : false,
		processData : false,
		success : function(result, msg) {

		},
		error : function(error) {
		    console.log("error");
		    console.log(error);
		}
	    });
	}));
    });

</script>

<script>
//관리자 등록 서브밋 
function AddPost() {
	
    postSubject = document.getElementById("postSubject");
	
	
	 if(postSubject.value==""){ //postSubject 값이 없을 경우
	 	alert("제목은 필수 입력입니다.");    //메세지 경고창을 띄운 후
	 	postSubject.focus();     // postSubject 텍스트박스에 커서를 위치
	 return false;
	 
	 }
		$('#addPost').submit();	
	 
	}

</script>


</head>
<c:if test="${empty sessionScope.username}">
	<%@ include file="404.jsp"%>
</c:if>

<c:if test="${not empty sessionScope.username}">
	<body>

		<!--==========================
  Header
  ============================-->
	<header id="header">
		<div id="topbar">
			<div class="container">
				<div class="social-links">
			<a href="https://www.facebook.com/lcklanguagecenter" class="facebook"><i class="fa fa-facebook"></i></a>
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

		<!-- forum -->
		<!-- Slider -->
		<div class="tp-banner-container">
			<div class="tp-banner">

				<img src="assets/img/forum/background_1.png"
					data-bgrepeat="no-repeat" style="width: 100%; max-height: 480px;">

			</div>
		</div>
		<!-- //Slider -->

				<div class="container">
					<div class="row">
						<div class="col-lg-1 col-xs-1 col-1 col-sm-1 col-md-1 logo ">
							<a href="forum.jsp"><img src="assets/img/logo.jpg" alt="" /></a>
						</div>


						<div class="col-lg-4 col-xs-4 col-sm-4 col-4 col-md-4"
							style="padding-left: 40px; margin-left: 10px;">
							<div class="stnt pull-left"
								style="font-weight: 900; text-align: center; padding-top: 25px; margin-bottom: 0px;">

								<p style="font-size:16px;">새 글 쓰기</p>
						
							</div>


							<div class="clearfix"></div>
						</div>
					</div>
				</div>
	



			<section class="content">
				<div class="container">
					<div class="row" style="margin-top: 20px;">
						<div class="col-lg-8 breadcrumbf"></div>
					</div>
				</div>


				<div class="container">
					<div class="row">
						<div class="col-lg-8 col-md-8">



							<!-- POST -->
							<div class="post">
								<form action="forum" class="form newtopic" method="post" id="addPost" onsubmit="return AddPost();">
									<input type="hidden" name="action" value="addpost"/>
									
									<input type="hidden" name="postId" value="${sessionScope.userId}"/>
								
									<div class="topwrap">
										<div class="userinfo pull-left">
											<div class="avatar">
												<img src="/lck/${request.getContextPath}${sessionScope.profile}" style="height: 37px; width: 37px;" alt="" />
												<div class="status green">&nbsp;</div>
											</div>

											<!-- <div class="icons">
											<img src="assets/img/icon3.jpg" alt="" /><img
												src="assets/img/icon4.jpg" alt="" /><img
												src="assets/img/icon5.jpg" alt="" /><img
												src="assets/img/icon6.jpg" alt="" />
										</div> -->
										</div>
										<div class="posttext pull-left">

											<div>
												<input type="text" placeholder="제목" class="form-control"
													name="postSubject"  id="postSubject"/>
											</div>


											<div>
												<textarea id="desc" placeholder="내용"
													class="form-control" name="postContent"></textarea>
											</div>
								
											<div class="filebox">
												<label for="ex_file">파일 업로드</label> <input type="file"
													id="ex_file" />
												<button type="submit" id="uploadsubmit" hidden="hidden"></button>
												&emsp;
												<img id="attachphoto"/>
												<div id="attachvideoname" style="display: none;">
												<b id="isAttached"></b>
												<input type="hidden" id="postVideo" name="postVideo"/>
												<input type="hidden" id="postPhoto" name="postPhoto">
												</div>
		
											</div>

											<div class="row newtopcheckbox">
												<!-- <div class="col-lg-6 col-md-6">
												
												<div class="row">
													<div class="col-lg-6 col-md-6">
														<div class="checkbox">
															<label> <input type="checkbox" id="everyone" />
																Everyone
															</label>
														</div>
													</div>
													<div class="col-lg-6 col-md-6">
														<div class="checkbox">
															<label> <input type="checkbox" id="friends" />
																Only Friends
															</label>
														</div>
													</div>
												</div> 
											</div>-->
												<!-- <div class="col-lg-6 col-md-6">
												<div>
													<p>Share on Social Networks</p>
												</div>
												<div class="row">
													<div class="col-lg-3 col-md-4">
														<div class="checkbox">
															<label> <input type="checkbox" id="fb" /> <i
																class="fa fa-facebook-square"></i>
															</label>
														</div>
													</div>
													<div class="col-lg-3 col-md-4">
														<div class="checkbox">
															<label> <input type="checkbox" id="tw" /> <i
																class="fa fa-twitter"></i>
															</label>
														</div>
													</div>
													<div class="col-lg-3 col-md-4">
														<div class="checkbox">
															<label> <input type="checkbox" id="gp" /> <i
																class="fa fa-google-plus-square"></i>
															</label>
														</div>
													</div>
												</div>
											</div> -->
											</div>


										</div>
										<div class="clearfix"></div>
									</div>
									<div class="postinfobot">

										<!-- <div class="notechbox pull-left">
										<input type="checkbox" name="note" id="note"
											class="form-control" />
									</div> -->

										<!-- <div class="pull-left">
										<label for="note"> Email me when some one post a reply</label>
									</div> -->

										<div class="pull-right postreply">
											<div class="pull-left smile">
												<a href="#"><i class="fa fa-smile-o"></i></a>
											</div>
											<div class="pull-left">
												<button type="submit" class="btn btn-primary">Post</button>
											</div>
											<div class="clearfix"></div>
										</div>


										<div class="clearfix"></div>
									</div>
								</form>
							</div>
							<!-- POST -->

							<div class="row similarposts">
								<!-- 	<div class="col-lg-10">
								<i class="fa fa-info-circle"></i>
								<p>
									Similar Posts according to your <a href="#">Topic Title</a>.
								</p>
							</div>
							<div class="col-lg-2 loading">
								<i class="fa fa-spinner"></i>
							</div> -->

							</div>

						</div>
					</div>
				</div>

			</section>

			<footer>
				<div class="container">
					<div class="row">
						<div class="col-lg-1 col-xs-3 col-sm-2 col-3 logo ">
							<a href="#"><img src="assets/img/logo.jpg" alt="" /></a>
						</div>
						<div class="col-lg-8 col-xs-6 col-sm-5 col-9">Copyrights 2020,
							websitename.com &emsp; <a href="https://www.facebook.com/lcklanguagecenter"><i class="fa fa-facebook-square"></i></a></div>
							
						<!-- <div class="col-lg-3 col-xs-12 col-sm-5 sociconcent">
							<ul class="socialicons">
								<li></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
							<li><a href="#"><i class="fa fa-cloud"></i></a></li>
							<li><a href="#"><i class="fa fa-rss"></i></a></li>
							</ul>
						</div> -->
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

		


	

	</body>
</c:if>
</html>