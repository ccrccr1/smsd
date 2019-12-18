<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문</title>
<link rel="stylesheet" type="text/css" href="${root}/css/top.css">
<link rel="stylesheet" type="text/css" href="${root}/css/reset.css">
<style type="text/css">
</style>
</head>
<body>
	<div class="top">
		<div class="wrap_top">
		<div class="top_main">
			<ul class="top_ul1">
				<li><a href="${root}/festival/list">홈</a></li>
				<li><a href="${root}/notice/list">공지사항</a></li>
				<li><a href="${root}/board/list">모임 게시판</a></li>
			</ul>

			<ul class="top_ul2">
				<c:choose>
					<c:when test="${empty sessionScope.id }">
					<li><a href="${root}/login">로그인</a></li>
					<li><a href="${root}/agree">회원가입</a></li>
					</c:when>
					<c:otherwise>					
					<li><a href="${root }/logout">로그아웃</a></li>
					<li><a href="${root }/mypage?id=${sessionScope.id}">마이페이지</a></li>
					<li><a href="${root}/order/list">거래내역</a></li>
					</c:otherwise>
				</c:choose>
					<li><a href="${root}/qna/list">고객센터</a></li>
				</ul>
		</div>
		</div>
	</div>
</body>
</html>