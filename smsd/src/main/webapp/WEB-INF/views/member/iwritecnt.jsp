<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="i" value="0"/>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet"
	href="${root }/css/createcss/information.css" />
<link rel="stylesheet"
	href="${root }/css/createcss/layout.css" />
<meta charset="UTF-8">
<style type="text/css">
#list:nth-of-type(n+5){
	display:none;
}
</style>

<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<!-- mast head start -->
		<div id="mast-head">
			<div class="container">

				<h1 class="title" id="mastHeadTitle">내가 쓴 글</h1>

			</div>
		</div>
		<!-- mast head end -->
		<div id="mast-body">
			<div id="infoDiv" style="">
				<div class="container">
					<div class="section __half __zero __wide">
						<div class="row __block __low">
							<div class="privacyList">
					<c:forEach var="dto" items="${cnt}" varStatus="status" >
						<c:choose>
						<c:when test="${status.index eq 0 }">
						<div style="display: inline-block; width: 430px;">
						<h2 style="width:400px;"class="subject __underline"><em style="padding:0;">${dto.table_name }에서 내가 쓴글 (${dto.cnt})</em><a style="float:right;" href="${root }/qna/list?col=m_id&word=${sessionScope.id }"><em>[더보기]</em></a></h2>
							<ul>
						<c:forEach var="dto2" items="${title }" varStatus="status"  >
						<c:choose>
							<c:when test="${dto.table_name eq dto2.table_name }">
							<li class="list"><a class="hide" href="${root }/qna/read?q_no=${dto2.no }&col=&word=&nowPage=1"> ${dto2.title } (${dto2.writedate })</a></li>
							</c:when>
						</c:choose>
						</c:forEach>
							</ul>
						</div>
						</c:when>
						<c:when test="${status.index eq 1 }">
						<div style="float:right; width: 45%">
						<h2 style="width:400px;"class="subject __underline"><em style="padding:0;">${dto.table_name }에서 내가 쓴글 (${dto.cnt})</em><a style="float:right;" href="${root }/qna/list?col=m_id&word=${sessionScope.id }"><em>[더보기]</em></a></h2>
							<ul>
						<c:forEach var="dto2" items="${title }" varStatus="status"  >
						<c:choose>
							<c:when test="${dto.table_name eq dto2.table_name }">
							<li class="list"><a class="hide" href="${root }/qna/read?q_no=${dto2.no }&col=&word=&nowPage=1"> ${dto2.title } (${dto2.writedate })</a></li>
							</c:when>

						</c:choose>
						</c:forEach>
							</ul>						
						</div>
						</c:when>
						<c:when test="${status.index eq 2 }">
						<div style="display: inline-block; width: 45%">
						<h2 style="width:400px;"class="subject __underline"><em style="padding:0;">${dto.table_name }에서 내가 쓴글 (${dto.cnt})</em><a style="float:right;" href="${root }/board/list?col=m_id&word=${sessionScope.id }"><em>[더보기]</em></a></h2>
							<ul>
						<c:forEach var="dto2" items="${title }" varStatus="status"  >
						<c:choose>
							<c:when test="${dto.table_name eq dto2.table_name }">
							<li class="list"><a class="hide" href="${root }/board/read?b_no=${dto2.no }&col=&word=&nowPage=1"> ${dto2.title } (${dto2.writedate })</a></li>
							</c:when>
						</c:choose>
						</c:forEach>
							</ul>				
						</div>
						</c:when>
						<c:when test="${status.index eq 3 }">
						<div style="float:right; width: 45%;">
						<h2 style="width:400px;"class="subject __underline"><em style="padding:0;">${dto.table_name }에서 내가 쓴글 (${dto.cnt})</em><a style="float:right;" href="${root }/board/list?col=m_id&word=${sessionScope.id }"><em>[더보기]</em></a></h2>
							<ul>
						<c:forEach var="dto2" items="${title }" varStatus="status"  >
						<c:choose>
							<c:when test="${dto.table_name eq dto2.table_name }">
							<li class="list"><a class="hide" href="${root }/board/read?b_no=${dto2.no }&col=&word=&nowPage=1"> ${dto2.title } (${dto2.writedate })</a></li>
							</c:when>
						</c:choose>
						</c:forEach>
							</ul>							
						</div>
						</c:when>
						<c:when test="${status.index eq 4 }">
						<div style="display: inline-block; width: 45%">
						<h2 style="width:400px;"class="subject __underline"><em style="padding:0;">${dto.table_name }에서 내가 쓴글 (${dto.cnt})</em><a style="float:right;" href="${root }/review/list?col=m_id&word=${sessionScope.id }"><em>[더보기]</em></a></h2>
							<ul>
						<c:forEach var="dto2" items="${title }" varStatus="status"  >
						<c:choose>
							<c:when test="${dto.table_name eq dto2.table_name }">
							<li class="list"><a class="hide" href="${root }/qna/read?q_no=${dto2.no }&col=&word=&nowPage=1"> ${dto2.title } (${dto2.writedate })</a></li>
							</c:when>
						</c:choose>
						</c:forEach>
							</ul>						
						</div>
						</c:when>
						
						</c:choose>
<%-- 					<c:forEach var="dto2" items="${title }" varStatus="status"  >			 --%>
						
<%-- 							<c:choose>							 --%>
<%-- 							<c:when test="${dto2.table_name eq dto.table_name  }"> --%>
<!-- 							<ul> -->
<%-- 							<li class="list"><a class="hide" href="/board/read?"> ${dto2.title } (${dto2.writedate })</a></li> --%>
<!-- 							</ul>												 -->
<%-- 							</c:when>				 --%>
<%-- 							</c:choose> --%>
						
<%-- 						</c:forEach>								 --%>
				</c:forEach>
							</div>
				
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>