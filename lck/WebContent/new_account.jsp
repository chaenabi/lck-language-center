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
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom -->
<link href="css/custom.css" rel="stylesheet">

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
<link rel="stylesheet"
	href="font-awesome-4.0.3/css/font-awesome.min.css">

<!-- CSS STYLE-->
<link rel="stylesheet" type="text/css" href="css/style.css"
	media="screen" />

<!-- SLIDER REVOLUTION 4.x CSS SETTINGS -->
<link rel="stylesheet" type="text/css" href="rs-plugin/css/settings.css"
	media="screen" />

<script src="lib/jquery/jquery.min.js"></script>
<script>
    function numberMaxLength(e) {
	if (e.value.length > e.maxLength) {
	    e.value = e.value.slice(0, e.maxLength);
	}
    }
</script>
<script>
    // 프로필 이미지 등록
    $(document)
	    .ready(
		    function(e) {

			// [1]
			$("#ex_file")
				.on(
					"change",
					function() {
					    ext = $(this).val().split('.')
						    .pop().toLowerCase(); //확장자

					    //배열에 추출한 확장자가 존재하는지 체크
					    if ($.inArray(ext, [ 'gif', 'png',
						    'jpg', 'jpeg' ]) == -1) {
						resetFormElement($(this)); //폼 초기화
						window
							.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능, 개발자 직접 문의바랍니다.)');
					    } else {
						file = $('#ex_file').prop(
							"files")[0];
						blobURL = window.URL
							.createObjectURL(file);
						$('#profile_photo img')
							.removeAttr('src');
						$('#profile_photo img').attr({
						    src : blobURL,
						}).css({
						    'height' : '37px',
						    'width' : '37px'
						});
						
						$('#profile').val(blobURL);
					
						//window.URL
						//.revokeObjectURL(file);
						
					    }
					    //비동기 업로딩을 위해 submit        
					    $("#uploadsubmit").submit();
					});

			//[2]
			$('#uploadsubmit').on('submit', (function(e) {
			    //e.preventDefault();
			    var file = document.getElementById("ex_file");
			    var fileData = new FormData();
			    fileData.append('profile_thumnail', file.files[0]);
			    
			    $.ajax({
				type : 'POST',
				url : "/lck/FileUploadServlet",
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

    //관리자 등록
    function AddUser() {
	$('#action').val('add');
	$('#addUser').submit();
    }
</script>



</head>
<body class="newaccountpage">

	<div class="container-fluid">

		<!-- Slider -->
		<div class="tp-banner-container">
			<div class="tp-banner">
				<ul>
					<!-- SLIDE  -->
					<li data-transition="fade" data-slotamount="7"
						data-masterspeed="1500">
						<!-- MAIN IMAGE --> <img id="profilePhoto"
						src="img/forum/background_2.jpg" alt="slidebg1" data-bgfit="cover"
						data-bgposition="left top" data-bgrepeat="no-repeat"> <!-- LAYERS -->
					</li>
				</ul>
			</div>
		</div>
		<!-- //Slider -->

		<div class="headernav">
			<div class="container">
				<div class="row">
					<div class="col-lg-1 col-xs-3 col-sm-2 col-md-2 logo ">
						<a href="forum.jsp"><img src="./images/logo.jpg" alt="" /></a>
					</div>


					<div class="col-lg-4 col-xs-12 col-sm-5 col-md-4 avt">
						<div class="stnt pull-left"
							style="font-weight: 900; text-align: center; padding-top: 10px;">

							<p>관리자 생성 페이지</p>

						</div>

						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>


		<section class="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 breadcrumbf"></div>
				</div>
			</div>


			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-8">



						<!-- POST -->
						<div class="post" style="margin-top: 10px; margin-left: 60px;">
							<form action="/lck/user" class="form newtopic" method="post"
								id="addUser">
								<input type="hidden" id="action" name="action">
								<div class="postinfotop">
									<h2 style="font-weight: bold;">Create New Manager</h2>
								</div>

								<!-- acc section -->
								<div class="accsection">
									<!-- <div class="acccap">
                             <div class="userinfo pull-left">&nbsp;</div>
                             <div class="posttext pull-left"><h3>필수 항목</h3></div>
                             <div class="clearfix"></div>
                         </div> -->
									<div class="topwrap">
										<div class="userinfo pull-left">
											<div class="avatar" id="profile_photo">
												<img src="images/avatar-blank.jpg" alt="" />
												<div class="status green">&nbsp;</div>
												<input type="hidden" id="profile" name="identityPhoto" />
											</div>
											<div class="imgsize">37 x 37</div>
											<form action="FileUploadController" id="photoUpload"
												method="post" enctype="multipart/form-data">

												<div class="filebox">
													<label for="ex_file">업로드</label> <input type="file"
														id="ex_file" name="profile_thumnail" />
													<button type="submit" id="uploadsubmit" hidden="hidden"></button>
												</div>
											</form>
										</div>
										<div class="posttext pull-left">
											<div class="row">
												<div class="col-lg-6 col-md-6">
													<input type="text" placeholder="관리자 이름"
														class="form-control" name="name" />
												</div>

											</div>
											<div class="row">
												<div class="col-lg-6 col-md-6">
													<input type="password" name="password" placeholder="비밀번호"
														class="form-control" id="password" />
												</div>
												<div class="col-lg-6 col-md-6">
													<input type="password" placeholder="비밀번호 재입력"
														class="form-control" id="pass2" name="pass2" />
												</div>
											</div>
											<br>
											<div class="row">
												<div class="col-lg-2 col-md-2 m-0 pr-0">
													<input type="text" name="phone" placeholder="+82 10"
														value="+82 10"
														style="max-width: 86px; text-align: left; padding-left: 15px; background-color: #E6E6E6"
														readonly />
												</div>

												<div class="col-lg-3 col-md-3">
													<input type="text" name="phonemid" placeholder="1234"
														style="text-align: center;" class="form-control"
														maxlength="4" oninput="numberMaxLength(this);" />
												</div>
												<div class="col-lg-3 col-md-3">
													<input type="text" name="phoneend" placeholder="5678"
														style="text-align: center;" class="form-control"
														maxlength="4" oninput="numberMaxLength(this);" />
												</div>

											</div>
											<div class="row">
												<div class="col-lg-8 col-md-6">
													<input type="text" name="address" placeholder="관리자 주소"
														class="form-control" />
												</div>

											</div>
											<div class="row">
												<div class="col-lg-8 col-md-6">
													<input type="text" name="position" placeholder="관리자 직급"
														class="form-control" />
												</div>

											</div>



										</div>
										<div class="clearfix"></div>
									</div>
								</div>
								<!-- acc section END -->

								<div class="pull-right postreply">
									<div class="pull-left smile">
										<a href="#"><i class="fa fa-smile-o"></i></a>
									</div>
									<div class="pull-left">
										<button class="btn btn-primary"
											onclick="javascript:AddUser();">등록</button>
									</div>
									<div class="clearfix"></div>
								</div>


								<div class="clearfix"></div>
							</form>

						</div>
						<!-- POST -->
					</div>

					<div class="col-lg-4 col-md-4">

						<img alt="" src="./img/team-1.jpg" style="max-width: 135%;">

					</div>
		</section>



	</div>


	<!-- get jQuery from the google apis -->
	<script type="text/javascript"
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.js"></script>

	<!-- SLIDER REVOLUTION 4.x SCRIPTS  -->
	<script type="text/javascript"
		src="rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
	<script type="text/javascript"
		src="rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

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
</html>