<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/top.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
<style type="text/css">
	.wrap {
	width: 1100px;
	margin: 0 auto;
	}
	.order_div{
		margin: 40px;
	}
	.order_header h1{
		font-size: 30px;
		font-weight: 700;
		margin-top: 40px;
		padding-bottom:20px;
		border-bottom: 2px solid #000;		
	}
	.order_list{
		margin: 0 auto;
		text-align: center;
		border: 1px solid #000;
		width: 900px;
	}
	.order_list_th{
		background-color: #f2f2f2;
		border: 1px solid #000;
		padding: 10px 0;
		font-weight: 700;
		text-align: center;
	}
	.order_list td{
		border: 1px solid #000;
		padding: 15px 0;
	}
	
	.btn_div{
		text-align: right;
		margin-right: 100px;
		margin-bottom: 40px;
	}
	.btn_c{
		padding : 15px 20px;
		color: #fff;
		background-color: #2E64FE;
		border-radius: 30px;
		border: none;
	}
	.form-inline{
		margin-left: 650px;
		padding: 20px 0;
	}
	.btn_c{
		margin: 20px 0;
	}

</style>
</head>
<body>
	<div class="container">
		<div class="wrap">
			<div class="order_header">
				<h1>결제 내역</h1>
			</div>
			<form class="form-inline" action="list">
			<div class="form-group">
				<select class="form-control" name="col">
					<option value="m_id" 
					<c:if test="${col=='m_id'}">selected</c:if>>회원아이디</option>
					<option value="f_id"
					<c:if test="${col=='f_id'}">selected</c:if>>상품아이디</option>
					<option value="total"
					<c:if test="${col=='total'}">selected</c:if>>전체출력</option>
				</select>
			</div>
			<div class="form-group">
				<input type="search" class="form-control" placeholder="검색어"
					name="word" value="${word}">
			</div>
			<button class="btn btn-default">검색</button>
			</form>
				<table class="order_list">
					<thead>
					<tr>
						<th class="order_list_th">번호</th>
						<th class="order_list_th">회원ID</th>
						<th class="order_list_th">상품명</th>
						<th class="order_list_th">상품ID</th>
						<th class="order_list_th">수량</th>
						<th class="order_list_th">금액</th>
						<th class="order_list_th">구매날짜</th>
					</tr>
					</thead>
					<tbody>
					<c:choose>
					<c:when test="${empty list}">
					<tr>
						<td colspan="7">등록된 글이 없습니다.</td>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${list}">
						<tr>
							<td>${dto.o_no}</td>
							<td>${dto.m_id}</td>
							<td>${dto.f_title}</td>
							<td>${dto.f_id}</td>
							<td>${dto.p_amount}</td>
							<td>${dto.p_total}</td>
							<td>${dto.o_date}</td>
						</tr>
						</c:forEach>
					</c:otherwise>
					</c:choose>
					</tbody>
				</table>	
			</div>
			<div>
				${paging}
			</div>
			<div class="btn_div">
				<input type="button" value="돌아가기" class="btn_c">
			</div>
	</div>
</body>
</html>