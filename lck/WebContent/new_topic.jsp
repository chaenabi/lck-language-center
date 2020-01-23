<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script src="assets/lib/jquery/jquery.min.js"></script>
<script>
    // 비동기 업로드 js
    $(document).ready(function(e) {

	// [1]
	$("#ex_file").on("change", function() {
	    ext = $(this).val().split('.').pop().toLowerCase();

	    if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg', 'mov', 'avi', 'mpg', 'mpeg', 'wmv', 'flv' ]) == -1) {
		resetFormElement($(this));
		window.alert('등록불가! (gif, png, jpg, jpeg 확장자, 혹은 mov, avi, mpg, mpeg, wmv, flv 확장자만 등록가능합니다.)');
	    } else {
		file = $('#ex_file').prop("files")[0];
		blobURL = window.URL.createObjectURL(file);
		/* $('#profile_photo img').removeAttr('src');
		$('#profile_photo img').attr({
		    src : blobURL,
		}).css({
		    'height' : '37px',
		    'width' : '37px'
		}); */

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
	    //console.log(file.value);
		
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

    //관리자 등록 서브밋 
    function AddUser() {
	$('#action').val('add');
	$('#addUser').submit();
    }
</script>


</head>
<c:if test="${empty sessionScope.username}">
	<%@ include file="404.jsp"%>
</c:if>

<c:if test="${not empty sessionScope.username}">
	<body>

		<div class="container-fluid">

			<!-- Slider -->
			<div class="tp-banner-container">
				<div class="tp-banner">
					<ul>
						<!-- SLIDE  -->
						<li data-transition="fade" data-slotamount="7"
							data-masterspeed="1500">
							<!-- MAIN IMAGE --> <img src="assets/img/forum/background_2.jpg"
							alt="slidebg1" data-bgfit="cover" data-bgposition="left top"
							data-bgrepeat="no-repeat"> <!-- LAYERS -->
						</li>
					</ul>
				</div>
			</div>
			<!-- //Slider -->

			<div class="headernav">
				<div class="container">
					<div class="row">
						<div class="col-lg-1 col-xs-1 col-sm-1 col-md-1 logo ">
							<a href="forum.jsp"><img src="assets/img/logo.jpg" alt="" /></a>
						</div>


						<div class="col-lg-4 col-xs-4 col-sm-4 col-md-4"
							style="padding-left: 40px; margin-left: 10px;">
							<div class="stnt pull-left"
								style="font-weight: 900; text-align: center; padding-top: 25px; margin-bottom: 0px;">

								<p>새 글 쓰기</p>
						
							</div>


							<div class="clearfix"></div>
						</div>
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
								<form action="forum" class="form newtopic" method="post">
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
													name="postSubject" />
											</div>


											<div>
												<textarea id="desc" placeholder="내용"
													class="form-control" name="postContent"></textarea>
											</div>
								
											<div class="filebox">
												<label for="ex_file">파일 업로드</label> <input type="file"
													id="ex_file" name="Topic_content_file" />
												<button type="submit" id="uploadsubmit" hidden="hidden"></button>
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
						<div class="col-lg-1 col-xs-3 col-sm-2 logo ">
							<a href="#"><img src="assets/img/logo.jpg" alt="" /></a>
						</div>
						<div class="col-lg-8 col-xs-9 col-sm-5 ">Copyrights 2020,
							websitename.com</div>
						<div class="col-lg-3 col-xs-12 col-sm-5 sociconcent">
							<ul class="socialicons">
								<li><a href="#"><i class="fa fa-facebook-square"></i></a></li>
								<!-- 	<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
							<li><a href="#"><i class="fa fa-cloud"></i></a></li>
							<li><a href="#"><i class="fa fa-rss"></i></a></li> -->
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

		<!-- END REVOLUTION SLIDER -->

	</body>
</c:if>
</html>