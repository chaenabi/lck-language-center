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


	<div class="pull-left">
		<c:if test="${param.prev}">
			<a href="${action}?page=${param.beginPage-1}" class="prevnext"><i
				class="fa fa-angle-left"></i></a>
		</c:if>
	</div>
	<div class="pull-left">
		<ul class="paginationforum">

			<c:forEach begin="${param.beginPage}" end="${param.endPage}" step="1"
				var="index">

				<c:choose>
					<c:when test="${param.page==index}">
						<li class="active"><a href="#" class="active">${index}</a></li>
					</c:when>

					<c:otherwise>
						<li class=""><a href="${action}?page=${index}">${index}</a></li>
					</c:otherwise>
				</c:choose>

			</c:forEach>

		</ul>
	</div>
	<div class="pull-left">
		<c:if test="${param.next}">
			<a href="${action}?page=${param.endPage+1}" class="prevnext last"><i
				class="fa fa-angle-right"></i></a>
		</c:if>
	</div>
	<div class="clearfix"></div>

</body>
</html>