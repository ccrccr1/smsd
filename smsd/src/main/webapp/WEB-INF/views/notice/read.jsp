<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/table_t.css">
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
	function update(n_no) {
		var url = "update";
		url += "?n_no=${param.n_no}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href = url;
	}
	
	function del(n_no) {
		var url = "delete";
		url += "?n_no=${param.n_no}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href = url;
	}
	
	function list(n_no) {
		var url = "list";
		url += "?n_no=${paaram.n_no}";
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
	<h1>공지사항</h1>
</div>

<table class="table">
	<thead>
		<tr>
			<th style="width: 20px;">제목</th>
			<th style="width: 350px; text-align: left;">${dto.n_title}</th>
			<th style="width: 120px;">등록일 : ${dto.n_date}</th>
			<th style="width: 30px;">조회수 : ${dto.n_cnt}</th>
		</tr>
	</thead>
	
	<tbody>
		<tr>
			<td colspan="4" id="t_td" class="selector">
				${dto.n_content}
			</td>
		</tr>
	</tbody>
</table>

<div class="btn">
	<button type="button" class="button" onclick="list('${param.n_no}')">목록</button>
	
	<c:if test="${not empty sessionScope.id && sessionScope.grade == 'A'}">
		<button type="button" class="button" onclick="location.href='./create'">등록</button>
		<button type="button" class="button" onclick="update('${param.n_no}')">수정</button>
		<button type="button" class="button" onclick="del('${param.n_no}')">삭제</button>
	</c:if>
	
</div>

</div>

</div>

<br><br><br>

</body>
</html>