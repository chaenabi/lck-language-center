<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
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

</head>
<body class="topic">

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


		<div class="headernav">
			<div class="container">
				<div class="row">
					<%-- <div class="col-lg-1 col-xs-3 col-sm-2 col-md-2 logo ">
						<a href="index.jsp"><img src="assets/img/logo.jpg" alt="" /></a>
					</div>
					 <div class="col-lg-7 col-sm-7 col-md-7 selecttopic">
						<h3 style="padding-top: 20px; margin: 0px; width: 200px;">
							${requestScope.postSubject}</h3>
					</div>  --%>
					<div class="hidden-lg hidden-md col-1">&nbsp;</div>
				</div>	
					
					<c:if test="${not empty sessionScope.username}">
						 <div class="col-lg-7 col-sm-12 col-md-12 col-12 selecttopic">
						<h3 style="padding-top: 20px; margin: 0px;">
							${requestScope.postSubject}</h3>
					</div> 
						
						<div class="col-lg-3 col-xs-3 col-sm-7 col-7 col-md-4 pl-4 float-right avt">
							<div class="stnt pull-left">
								<form action="new_topic.jsp" method="post" class="form">
									<button class="btn btn-primary">New Topic</button>
								</form>
							</div>

							<div class="avatar pull-right dropdown ml-2 mt-sm-0">
								<a data-toggle="dropdown" href="#"><img
									src="/lck/${request.getContextPath}${sessionScope.profile}"
									style="height: 37px; width: 37px;" alt="" /></a> <b class="caret"></b>

								<ul class="dropdown-menu" role="menu">
									<!-- <li role="presentation"><a role="menuitem" tabindex="-1"
										href="#">My Profile</a></li> -->

									<li role="presentation"><a role="menuitem" tabindex="-3"
										id="logout" href="#">Log Out</a></li>
									<c:if test="${sessionScope.username eq '김진기'}">
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

		<section class="content">
			<div class="container">&nbsp;</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-8">

						<!-- POST -->
						<div class="post beforepagination">
							<div class="topwrap">
								<div class="userinfo pull-left">
									<div class="avatar"
										style="margin: 0px 0px 15px 5px; width: 60px;">
										<img src="/lck/${requestScope.profile}"
											style="height: 37px; width: 37px;" alt="" />

										<hr />
										<c:if test="${not empty sessionScope.username}">
											
											<c:if test="${empty requestScope.postPhoto}">
												<c:set var="emptyPhoto" value="emptyPhoto" />	
											</c:if>
											<c:if test="${empty requestScope.postVideo}">
												<c:set var="emptyVideo" value="emptyVideo" />	
											</c:if> 
										
										<a id="theEditPostId" onClick='contentEdit(" ${emptyPhoto}, ${emptyVideo} ")' style="color: #F7BE81"><i class="fa fa-edit" style="font-size: 20px;"></i></a>				
					   &nbsp; &nbsp;
					  				<a id="theDelPostId" onClick="contentDel()"
												style="color: #989c9e"><i class="fa fa-times"
												style="font-size: 20px;"></i></a>
										</c:if>
									</div>
								</div>
								<div class='post'>


									<div class="posttext pull-left">

										<h2 id="editContentSubject">${requestScope.postSubject}</h2>
										<br>
										<form action="TopicFileUploadServlet" method="post">

											<div id="postPhotoTag">
											<c:set var="isNullPhoto" value="${requestScope.postPhoto}"/>
											
												<c:if test="${isNullPhoto != null}">
												<c:if test="${not fn:containsIgnoreCase(isNullPhoto, 'null') && fn:containsIgnoreCase(isNullPhoto, 'contents')}">
													<img style="width: 100%; height: 100%;"
														src="/lck/${isNullPhoto}" />
														
												</c:if>
												</c:if>

											</div>
											<c:set var="isNullVideo" value="${requestScope.postVideo}"/>
											<br>
											
											<div id="postVideoTag">	
												<c:if test="${isNullVideo != null}">
												<c:if test="${not fn:containsIgnoreCase(isNullVideo, 'null') && fn:containsIgnoreCase(isNullVideo, 'contents') }">
													<video width="100%" height="100%" controls>
														<source src="/lck/${isNullVideo}" />
													</video>
												</c:if>
												</c:if>
											</div>
											

										</form>
				
										<p id="editContent" style="margin-bottom: 0px;">${requestScope.postContent}</p>
									</div>
									<div class="clearfix"></div>
								</div>

								<div class="postinfobot">
									<div class="clearfix"></div>
								</div>
							</div>

							&nbsp;
							<div id="makeCommentListBox"></div>





							<div class="post">
								<form action="comment" class="form" method="post">
									<input type="hidden" name="action" value="addComment" />
									<div class="topwrap">
										<div class="row">
											<div class="col-1 col-md-1">&nbsp;</div>
											<div class="col-md-10 col-10">

												<input type="hidden" name="commentPost"
													value="${requestScope.forumNum}" />
												<div class="posttext"
													style="margin: 0px; padding-left: 15px; width: 270px;">

													<input name="commentId" class="form-control" id="commentId"
														placeholder="Type your name here" />

												</div>
												<div class="posttext"
													style="margin: 0px; padding-left: 15px; width: 270px;">

													<input name="commentPassword" type="password"
														class="form-control" id="commentPassword"
														placeholder="Type your password here" />

												</div>
												<div class="posttext"
													style="margin: 0px; padding-left: 15px; width: 100%;">
													<div class="textwraper" style="height: 340px;">

														<textarea name="commentContent" id="reply"
															placeholder="Type your message here"
															style="height: 300px;"></textarea>
													</div>
												</div>
												<div class="clearfix"></div>
											</div>
											<div class="postinfobot">

												<div class="pull-right postreply" style="padding-left: 270px;">
													<div class="pull-left smile">
														<a href="#"><i class="fa fa-smile-o"></i></a>
													</div>
													<div class="pull-left">
														<button type="submit" class="btn btn-primary">Post
															Reply</button>
													</div>
													<div class="clearfix"></div>
												</div>
											</div>

											<div class="clearfix"></div>
										</div>
									</div>
								</form>
							</div>
							<!-- POST -->
						</div>

					</div>


					<!--  게시글 수정 삭제용 form -->
					<form action="forum" class="form" id="contentEditForm"
						method="post">
						<input type="hidden" id="forum_action" name="action" /> 
						<input type="hidden" id="postId" name="postId" />
						<input type="hidden" id="postNum" name="postNum" />
						<input type="hidden" id="postContentSub" name="postContentSub" /> 
						<input type="hidden" id="postContentText" name="postContentText" /> 
							<input type="hidden" id="postPhoto" name="postPhoto" value="${requestScope.postPhoto}">
							<input type="hidden" id="postVideo" name="postVideo" value="${requestScope.postVideo}"/> 
					</form>


					<!-- 댓글 수정 삭제용 form -->
					<form action="comment" id="commentForm" method="post">
						<input type="hidden" id="action" name="action"> <input
							type="hidden" id="password" name="password"> <input
							type="hidden" id="commentnum" name="commentnum"> <input
							type="hidden" id="commentid" name="commentid"> <input
							type="hidden" id="commentcontent" name="commentcontent">
						<input type="hidden" id="postNumforcomment"
							name="postNumforcomment" />
					</form>

					<div class="col-lg-4 col-md-4"></div>
				</div>
			</div>
			<div class="container">&nbsp;</div>
			<div class="clearfix"></div>
		</section>
		<br>
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

	<script>
	var post = document.getElementById("makeCommentListBox");
	var commentlist = ${requestScope.comments};

	for (var i = 0; i < commentlist.length; i++) {

	    if (commentlist[i].commentContent == "") {
		commentlist[i].commentContent = "empty comment";
	    }

	    post.innerHTML
	    	+= "<div class='post'>"
		    + "		<div class='topwrap'>"
		    + "			<div class='userinfo pull-left' style='padding: 25px 0px 0px 10px;'>"
		    + "				<div class='avatar' style='margin: 0px 0px 15px 5px; width: 60px;'>"
		    + "					<p id='cid" + String(commentlist[i].commentNum) + "' style='margin: 0px;'>" + commentlist[i].CommentId + "</p>"
		    + "					<hr/>"
		    + "					<a id='aedit" + i + "' onClick=\"postEdit(" + String(commentlist[i].commentNum)+ ", "+ "\'"+ String(commentlist[i].CommentId)+ "\', " + "\'" + String(commentlist[i].commentContent) + "\', "+ i+ ")"+ "\" style='color:#F7BE81'><i class='fa fa-edit' style='font-size: 20px;'></i></a>"
		    + " 					&nbsp; &nbsp; &nbsp;"
		    + "					<a id='adel"+ i+ "' onClick=\"postDelete("+ String(commentlist[i].commentNum) + ", "+ "\'" + String(commentlist[i].CommentId)+ "\', "+ "\'"+ String(commentlist[i].commentContent)+ "\', "+ i + ")"+ "\" style='color: #989c9e'><i class='fa fa-times' style='font-size: 20px;'></i></a>"
		    + "				</div>"
		    + "			</div>"
		    + "			<div class='posttext pull-left'>"
		    + "				<p id='ccon"+i+"' class='commentContent' style='margin: 0px;'>" + commentlist[i].commentContent+ "</p>"
		    + "			</div>"
		    + "			<div class='clearfix'></div>"
		    + "		</div>"
		    + "		<div class='postinfobot' style='padding-left:55vw;'>"
		    + "			<div class='clearfix'></div>"
		    + "		</div>"
		    + "</div>";
		    
	}
    </script>

	<script>
	// parameters for clearly specify clicked tag
	// post~ function is all binding on comment .. sry for naming mistake.
	function postEdit(cnum, cid, ccon, i) {
	    var pass = "";
	    var postId = "";
	    pass = prompt('글 수정을 위해 암호를 입력해주세요.');

	    // add data for giving server
	    $('#commentnum').val(cnum);
	    $('#commentid').val(cid);

	    $('#password').val(pass);
	    $('#action').val('validate');

	    $.ajax({

		type : 'POST',
		url : "comment",
		data : $('#commentForm').serialize(),
		success : function(result, msg) {
		    if (result == "validated") {

			modifyContent = document.getElementById('ccon' + i);
			modifyContent.innerHTML = "";
			modifyContent.innerHTML = "<textarea id='ta" + i
				+ "' style='width: 100%; height: 100px;'>"
				+ ccon + "</textarea>";

			//only filtered id value                      
			cnumber = JSON.stringify(document.getElementById(
				'cid' + cnum).getAttribute('id'));

			// change Pedit icon, onclick event, style                             
			document.getElementById('aedit' + i).setAttribute(
				'onClick',
				'confirmEdit(' + cnumber + ', ' + i + ')');
			document.getElementById('aedit' + i).setAttribute(
				'style', 'green');
			document.getElementById('aedit' + i).firstChild
				.setAttribute('class', 'fa fa-check');

			// change Pdelete onclick event, style
			document.getElementById('adel' + i).setAttribute(
				'onClick', 'cancelEdit()');
			document.getElementById('adel' + i).setAttribute(
				'style', 'color:black');

		    } else {
			alert("password is invalid. please check again.");
		    }

		},
		error : function(error) {
		    console.log("error: ");
		    console.log(error);
		}
	    });

	}

	function postDelete(cnum, cid, ccon, i) {
	    var pass = "";
	    var postId = "";
	    pass = prompt('글 삭제를 위해 암호를 입력해주세요.');

	    // add data for giving server
	    $('#commentnum').val(cnum);
	    $('#commentid').val(cid);

	    $('#password').val(pass);
	    $('#action').val('validate');

	    $.ajax({

			type : 'post',
			url : "comment",
			data : $('#commentForm').serialize(),
			success : function(result, msg) {
			    //delete function 
			    if (result == "validated") {
				if (confirm("are you sure to delete comment?") == true) {

				    $('#commentnum').val(cnum);
				    $('#commentid').val(cid);
				    $('#action').val('del');

				    $('#commentForm').submit();
				}
			    } else {
				alert("password is invalid. please check again.");
			    }

			},
			error : function(error) {
			    console.log("error");
			    console.log(error);
			}
		    });

	}
    </script>
	<script>
	function confirmEdit(cnum, i) {

	    //수정된 textareaContent와 contentnum을 서버로 넘겨서 수정하게 한다. 	
	    cnum = cnum.trim().replace(/[^0-9]/g, "");

	    $('#commentnum').val(cnum);
	    $('#commentcontent').val($('#ta' + i).val());
	    $('#action').val('edit');

	    $('#commentForm').submit();

	}

	function cancelEdit() {
	    if (confirm("are you sure cancel modifying this post?") == true) {
		window.location.reload();
	    }
	}
    </script>



	<script>
	function contentEdit(emptyPhotoVideo) {
	    loginId = ${sessionScope.userId};
	    postId = ${requestScope.postId};
	    
	    //if want delete button display not when file is null
	    //reqPostPhoto = ${requestScope.postPhoto};
	    //reqPostVideo = ${requestScope.postVideo};
	    
	    if (loginId == postId) {

		editContentSubject = document
			.getElementById('editContentSubject');
		saveOriginSubject = editContentSubject.innerHTML;

		editContentSubject.innerHTML = "";
		editContentSubject.innerHTML = "<input class='form-control' type='text' id='ContentSub'/>";
		$('#ContentSub').val(saveOriginSubject);

		editContent = document.getElementById('editContent');
		saveOriginContent = editContent.innerHTML;

		editContent.innerHTML = "";
		editContent.innerHTML = "<textarea id='ContentText' style='width: 100%; height: 500px;'>"
			+ saveOriginContent + "</textarea>";

	
	    postPhotoTag = document.getElementById('postPhotoTag');
	    postPhotoTag.innerHTML += "<label for='uploadPhoto' style='color: #04B431'><i class='fa fa-plus' style='font-size: 20px;'></i> Select Change Photo</label>"
	    					   +  "<input type='file' id='uploadPhoto'><button type='button' id='uploadPhotoSubmit' hidden='hidden'></button>"; 
	    
	    //if want delete button display not when file is null
	    //if(reqPostPhoto != null) {
		 // if(!reqPostPhoto.includes('null') && reqPostPhoto.includes('contents'))	{     
		    postPhotoTag.innerHTML += "<br><button type='button' id='deletePhotoSubmit' style='color: white; background-color: red; border: none;'>Delete Photo</button>"; 
		 // }
		//}
	    					   
	    					   
	    postVideoTag = document.getElementById('postVideoTag');
	    postVideoTag.innerHTML += "<label for='uploadVideo' style='color: #FF8000'><i class='fa fa-plus' style='font-size: 20px;'></i> Select Change Video</label>"
	    						+ "<input type='file' id='uploadVideo'><button type='button' id='uploadVideoSubmit' hidden='hidden'></button>"; 
	    $('#postVideoTag').after('<br>');
	    
	    //if want delete button display not when file is null
	    //if(reqPostVideo != null) {
	      //if(!reqPostVideo.includes('null') && reqPostVideo.includes('contents'))
	    	postVideoTag.innerHTML += "<br><button type='button' id='deleteVideoSubmit' style='color: white; background-color: red; border: none;'>Delete Video</button><br>"; 
	    //}
	    
		// change Pedit icon, onclick event, style                             
		document.getElementById('theEditPostId').setAttribute(
			'onClick', 'confirmPostEdit()');
		document.getElementById('theEditPostId').setAttribute('style',
			'color: lightgreen');
		document.getElementById('theEditPostId').firstChild
			.setAttribute('class', 'fa fa-check');

		// change Pdelete onclick event, style
		document.getElementById('theDelPostId').setAttribute('onClick',
			'cancelEdit()');
		document.getElementById('theDelPostId').setAttribute('style',
			'color:black');
	    } else {
		alert('you do not have any grants to modify this post! please call the writer who wrote this post.');
	    }
	}
    </script>

	<script>
	//upload photo
	$(document).on('change',"#uploadPhoto",function() {
			    //event.preventDefault();
			    ext = $(this).val().split('.').pop().toLowerCase();
			    if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
				resetFormElement($(this));
				window
					.alert('등록불가! (그림파일은 gif, png, jpg, jpeg 확장자만 등록가능합니다.)');
			    } else {

			    //비동기 업로드를 위해 submit        
			    $("#uploadPhotoSubmit").click();
			    }
			});

	$(document).on('click','#uploadPhotoSubmit',(function(e) {
		    //e.preventDefault();
		    var file = document.getElementById("uploadPhoto");
		    var fileData = new FormData();

		    var fileidvalue = $('#uploadPhoto').val();
		    //get pure filename
		    fileidvalue = fileidvalue.substring(fileidvalue
			    .lastIndexOf('\\') + 1);
		    $("#postPhoto").val(fileidvalue);
		    
		    //console.log("pure photofilename: " + fileidvalue);
		    
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

	function resetFormElement(e) {

	    e.wrap('<form>').closest('form').get(0).reset();
	    e.unwrap(); //감싼 <form> 태그를 제거

	}

	//upload video
	$(document).on('change',"#uploadVideo",function() {
			    ext = $(this).val().split('.').pop().toLowerCase();
			    //event.preventDefault();
			    if ($.inArray(ext, [ 'mov', 'avi', 'mpg', 'mp4',
				    'mpeg', 'wmv', 'flv' ]) == -1) {
				resetFormElement($(this));
				window.alert('등록불가! (동영상은 mov, avi, mpg, mpeg, mp4, wmv, flv 확장자만 등록가능합니다.)');
			    } else{

			    	//비동기 업로드를 위해 submit        
			    	$("#uploadVideoSubmit").click();
			    }
			});

	$(document).on('click','#uploadVideoSubmit',(function(e) {
		    //e.preventDefault();
		    var file = document.getElementById("uploadVideo");
		    var fileData = new FormData();
		    var fileidvalue = $('#uploadVideo').val();

		    //get pure filename
		    fileidvalue = fileidvalue.substring(fileidvalue
			    .lastIndexOf('\\') + 1);
		    
		    
		    //console.log("pure videofilename: " + fileidvalue);
		    $("#postVideo").val(fileidvalue);

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
    </script>


	<script>
	function contentDel() {
	    loginId = ${sessionScope.userId};
	    postId = ${requestScope.postId};

	    if (loginId == postId) {
		if (confirm("are you sure delete this post?") == true) {
		    postNum = ${requestScope.forumNum};
		    $('#postNum').val(postNum);
		    $('#forum_action').val('del');
		    $('#contentEditForm').submit();

		}
	    } else {
		    alert('you do not have any grants to modify this post! please call the writer who wrote this post.');
		}
	}
    </script>

	<script>
	function confirmPostEdit() {
	    if (confirm("did you finish modify this post?") == true) {

			postId = ${requestScope.postId};
			postNum = ${requestScope.forumNum};

			$('#postId').val(postId);
			$('#postNum').val(postNum);

			contentSub = $('#ContentSub').val();
			contentText = $('#ContentText').val();

			uploadPhoto = $('#uploadPhoto').val();
			uploadVideo = $('#uploadVideo').val();	
			
			if(uploadPhoto != null) {
			  if(uploadPhoto.trim() != '') {
			  	$('#postPhoto').val(uploadPhoto);
			  }
			}

			
			if(uploadVideo != null) {
			  if(uploadVideo.trim() != '') {
			  	$('#postVideo').val(uploadVideo);
			  }
			}
			
			if(contentSub == "") {
			  
			 	alert("제목은 필수 입력입니다.");  
			 	contentSub.focus();     // postSubject 텍스트박스에 커서를 위치
				return false;
			 
			 }
	
			$('#postContentSub').val(contentSub);
			$('#postContentText').val(contentText);
	
			$('#forum_action').val('edit');
			$('#contentEditForm').submit();
		}

	}
    </script>


	<script>
	$(document).on('click','#deletePhotoSubmit',(function() {
	  if(confirm("Are you really sure to delete photo?") == true) {
	    $('#postPhoto').val('null');
	    alert('okay.. it will be deleted when you click check button to confirm edit post.');
	  }

	
	}));
	
	
	$(document).on('click','#deleteVideoSubmit',(function() {
	  if(confirm("Are you really sure to delete video?") == true) {
	    $('#postVideo').val('null');
	    alert('okay.. it will be deleted when you click check button to confirm edit post.');
	  }

	
	}));
	</script>

	<script type="text/javascript">
	 document.getElementById("logout").onclick = function() {
	   document.user_logout.submit();
	} 
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
    
</body>
</html>