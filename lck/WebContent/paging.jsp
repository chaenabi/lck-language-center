<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Paging</title>
</head>
<body>

	<section class="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-xs-12 col-md-8">
					<div class="pull-left">
						<a href="#" class="prevnext"><i class="fa fa-angle-left"></i></a>
					</div>
					<div class="pull-left">
						<ul class="paginationforum">

							<c:url var="action" value="/ShowForumList" />
							<c:if test="${param.prev}">
								<a href="${action}?page=${param.beginPage-1}">prev</a>
							</c:if>
							<c:forEach begin="${param.beginPage}" end="${param.endPage}"
								step="1" var="index">
								<c:choose>
									<c:when test="${param.page==index}">
     				       ${index}
       								 </c:when>
									<c:otherwise>
										<a href="${action}?page=${index}">${index}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<li><c:if test="${param.next}">
									<a href="${action}?page=${param.endPage+1}">next</a>
								</c:if></li>
						</ul>
					</div>
					<div class="pull-left">
						<a href="#" class="prevnext last"><i class="fa fa-angle-right"></i></a>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>