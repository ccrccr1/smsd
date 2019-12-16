<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>

<link rel="stylesheet" type="text/css" href="../css/table.css">
<link rel="stylesheet" type="text/css" href="../css/h.css">

<style type="text/css">
	.button {
		float: right;
		margin-right: 30px;
		background-color: #c0c0c0;
		border: solid none;
		padding: 8px 8px;
	}

	#t_td{
		text-align: left;
		padding-left: 30px;
	}
	
 	.selector {
 		word-break: break-all;
 	}

</style>

<script type="text/javascript">
	function update(q_no) {
		var url = "update";
		url += "?q_no=${param.q_no}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href = url;
	}
	
	function del(q_no) {
		var url = "delete";
		url += "?q_no=${param.q_no}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href = url;
	}
	
	function list(q_no) {
		var url = "list";
		url += "?q_no=${param.q_no}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href = url;
	}
	
	function reply(q_no) {
		var url = "reply";
		url += "?q_no=${param.q_no}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";

		location.href = url;
	}
</script>

</head>
<body>

<div class="container">

<div class="wrapper">

<div class="h">
	<h1>QnA</h1>
</div>

<table class="table">
	<thead>
		<tr>
			<th style="width: 20px;">제목</th>
			<th style="width: 350px; text-align: left;">${dto.q_title }</th>
			<th style="width: 80px;">작성자 : ${dto.m_ID}</th>
			<th style="width: 120px;">등록일 : ${dto.q_date}</th>
			<th style="width: 60px;">조회수 : ${dto.q_cnt}</th>
		</tr>
	</thead>
	
	<tbody>
		<tr>
			<td colspan="5"  id="t_td" class="selector">
				${dto.q_content}
			</td>
		</tr>
	</tbody>
</table>

<div class="btn">
	<button type="button" class="button" onclick="list('${param.q_no}')">목록</button>
	
	<c:if test="${sessionScope.id == dto.m_ID}">
		<button type="button" class="button" onclick="update('${param.q_no}')">수정</button>
		<button type="button" class="button" onclick="del('${param.q_no}')">삭제</button>
	</c:if>
	
	<c:if test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
		<button type="button" class="button" onclick="reply('${param.q_no}')">답글</button>
	</c:if>
</div>
<br><br>

<c:forEach var="rlist" items="${rlist}">
	<table class="table" style="width: 1000px; margin-left: 40px;">
		<thead>
			<tr>
				<th style="width: 350px; text-align: left;">제목 : ${rlist.q_title}</th>
				<th style="width: 80px;">답변자 : ${rlist.m_ID }</th>
				<th style="width: 120px;">등록일 : ${rlist.q_date }</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td colspan="3" id="t_td">${rlist.q_content}</td>
			</tr>
		</tbody>
	</table>
</c:forEach>

</div>
</div>

<br>

</body>
</html>