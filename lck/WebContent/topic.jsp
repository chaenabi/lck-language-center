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
					<div class="col-lg-7 col-sm-7 col-md-7 selecttopic">
						<h3 style="padding-top: 20px; margin: 0px;">
							${requestScope.postSubject}</h3>
					</div>
					<div class="hidden-lg hidden-md col-1">&nbsp;</div>
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
									<div class="avatar"
										style="margin: 0px 0px 15px 5px; width: 60px;">
										<img src="/lck/${requestScope.profile}"
											style="height: 37px; width: 37px;" alt="" />

										<hr />
										<c:if test="${not empty sessionScope.username}">
											<a id="theEditPostId"
												onClick="contentEdit()" style="color: #F7BE81"><i class="fa fa-edit"
												style="font-size: 20px;"></i></a>
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

												<div class="pull-right postreply">
													<div class="pull-left smile">
														<a href="#"><i class="fa fa-smile-o"></i></a>
													</div>
													<div class="pull-left" style="margin-right: 4vw;">
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
							
					</form>


					<!-- 댓글 수정 삭제용 form -->
					<form action="comment" id="commentForm" method="post">
						<input type="hidden" id="action" name="action"> <input
							type="hidden" id="password" name="password"> <input
							type="hidden" id="commentnum" name="commentnum"> <input
							type="hidden" id="commentid" name="commentid"> <input
							type="hidden" id="commentcontent" name="commentcontent">
						<input type="hidden" id="postNumforcomment" name="postNumforcomment" />
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

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>

	<script>
	var post=document.getElementById("makeCommentListBox");
	var commentlist = ${requestScope.comments};
	
	
	for(var i = 0; i < commentlist.length; i++) {
	

	    if(commentlist[i].commentContent == "") {
		    commentlist[i].commentContent = "empty comment";
		}
	  
	    
		post.innerHTML += "<div class='post'>" 
		    		   + "	<div class='topwrap'>"
					   + "		<div class='userinfo pull-left' style='padding: 25px 0px 0px 10px;'>"
					   + "			<div class='avatar' style='margin: 0px 0px 15px 5px; width: 60px;'>"
					   + "			<p id='cid"+String(commentlist[i].commentNum)+"' style='margin: 0px;'>"+commentlist[i].CommentId+"</p>"
					   + "			<hr/>"
					   + "			<a id='aedit"+i+"' onClick=\"postEdit("+ String(commentlist[i].commentNum) + ", "+ "\'"+  String(commentlist[i].CommentId) + "\', "+ "\'"+ String(commentlist[i].commentContent) + "\', "+ i + ")"+"\" style='color:#F7BE81'><i class='fa fa-edit' style='font-size: 20px;'></i></a>"	
					   + "&nbsp; &nbsp; &nbsp;"
					   + "			<a id='adel"+i+"' onClick=\"postDelete("+ String(commentlist[i].commentNum) + ", "+ "\'"+  String(commentlist[i].CommentId) + "\', "+ "\'"+ String(commentlist[i].commentContent) + "\', "+ i + ")"+"\" style='color: #989c9e'><i class='fa fa-times' style='font-size: 20px;'></i></a>"
					   + "			</div>"
					   + "		</div>"
					   + "	<div class='posttext pull-left'>"
					   + "		<p id='ccon"+i+"' class='commentContent' style='margin: 0px;'>"+commentlist[i].commentContent+"</p>"
					   + "	</div>"
					   + "	<div class='clearfix'></div>"
					   + "	</div>"
					   + "<div class='postinfobot'>"
					   + "<div class='clearfix'></div>"
					   + "</div>"
					   + "</div>";
	}
	
    </script>

	<script>
	// parameters for clearly specify clicked tag
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

					if(result == "validated") {
					   
					    modifyContent = document.getElementById('ccon' +i);
					    modifyContent.innerHTML = "";
					    modifyContent.innerHTML = "<textarea id='ta"+i+"' style='width: 100%; height: 100px;'>"+ccon+"</textarea>";
					    	
					    //only filtered id value                      
					    cnumber = JSON.stringify(document.getElementById('cid' + cnum).getAttribute('id'));
				
					    // change Pedit icon, onclick event, style                             
					    document.getElementById('aedit' +i).setAttribute('onClick', 'confirmEdit('+cnumber+', '+i+')');
					    document.getElementById('aedit' +i).setAttribute('style', 'green');
					    document.getElementById('aedit' +i).firstChild.setAttribute('class', 'fa fa-check');
					    
					    // change Pdelete onclick event, style
					    document.getElementById('adel' +i).setAttribute('onClick', 'cancelEdit()');
					    document.getElementById('adel' +i).setAttribute('style', 'color:black');
					    
					}
					else { 
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
		   
		    type : 'POST',
			url : "comment",
			data : $('#commentForm').serialize(),
			success : function(result, msg) {
					//delete function 
					if(result == "validated") {
						if(confirm("are you sure to delete comment?") == true) {
						 
						    $('#commentnum').val(cnum);
						    $('#commentid').val(cid);
						    $('#action').val('del');
				    
						    $('#commentForm').submit();
						}
					}
					else { 
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
		    $('#commentcontent').val($('#ta'+i).val());
		    $('#action').val('edit');
    
		    $('#commentForm').submit();
		    		    
		}
		
		function cancelEdit() {
		    if(confirm("are you sure cancel modifying this post?") == true) {
		    	window.location.reload();
		    }
		}

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


	<script>
    function contentEdit() {
		loginId = ${sessionScope.userId};
		postId = ${requestScope.postId};
		
		if(loginId == postId) {
		    
		    editContentSubject = document.getElementById('editContentSubject');
		    saveOriginSubject = editContentSubject.innerHTML;
		    
		    editContentSubject.innerHTML = "";
		    editContentSubject.innerHTML = "<input class='form-control' type='text' id='ContentSub'/>";
		    $('#ContentSub').val(saveOriginSubject);
		    
		    editContent = document.getElementById('editContent');
			saveOriginContent = editContent.innerHTML;
 
		    editContent.innerHTML = "";
		    editContent.innerHTML = "<textarea id='ContentText' style='width: 100%; height: 100px;'>"+ saveOriginContent +"</textarea>";
			
		    
			
		    // change Pedit icon, onclick event, style                             
		    document.getElementById('theEditPostId').setAttribute('onClick', 'confirmPostEdit()');
		    document.getElementById('theEditPostId').setAttribute('style', 'green');
		    document.getElementById('theEditPostId').firstChild.setAttribute('class', 'fa fa-check');
		    
		    // change Pdelete onclick event, style
		    document.getElementById('theDelPostId').setAttribute('onClick', 'cancelEdit()');
		    document.getElementById('theDelPostId').setAttribute('style', 'color:black');
		} else {
		    alert('you do not have any grants to modify this post! please call the writer who wrote this post.');
		}
    }
    
    </script>
    
    <script>
    function contentDel() {
	loginId = ${sessionScope.userId};
	postId = ${requestScope.postId};
	
	if(loginId == postId) {
	    if(confirm("are you sure delete this post?") == true) {
	    postNum = ${requestScope.forumNum};
		$('#postNum').val(postNum); 
		$('#forum_action').val('del');     
		$('#contentEditForm').submit();
		 
	} else {
	    alert('you do not have any grants to modify this post! please call the writer who wrote this post.');
	}
}
    
    </script>
    
    <script>
    
    function confirmPostEdit() {
	if(confirm("did you finish modify this post?") == true) {
	     postId = ${requestScope.postId};
		 postNum = ${requestScope.forumNum};
	     
		 $('#postId').val(postId); 
		 $('#postNum').val(postNum); 
		    
		 
	     contentSub = $('#ContentSub').val();
	     contentText = $('#ContentText').val();
	     
	     $('#postContentSub').val(contentSub);
	     $('#postContentText').val(contentText);
	     
	     console.log($('#postContentSub').val());
	     console.log($('#postContentText').val());
	     
	     $('#forum_action').val('edit');
	     
	     $('#contentEditForm').submit();
	}
  
    
    }
    </script>
    

	<script type="text/javascript">
	/* document.getElementById("logout").onclick = function() {
	    document.user_logout.submit();
	} */
    </script>
</body>
</html>