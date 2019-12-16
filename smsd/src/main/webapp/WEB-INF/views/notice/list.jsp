<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>


<link rel="stylesheet" type="text/css" href="../css/table_t.css">
<link rel="stylesheet" type="text/css" href="../css/h.css">
<link rel="stylesheet" type="text/css" href="../css/search.css">
<link rel="stylesheet" type="text/css" href="../css/paging.css">

<script type="text/javascript">
	function read(n_no) {
		var url = "read";
		url += "?n_no=" + n_no;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";

		location.href = url;
	}
</script>

<style type="text/css">
	.button {
		float: right;
		margin-right: 30px;
		background-color: #c0c0c0;
		border: solid none;
		padding: 8px 8px;
	}
	
	.paging {
		float:left;
		margin-left: 500px;
	}
</style>

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
				<th style="width: 20px;">글 번호</th>
				<th style="width: 400px; text-align: left;">제목</th>
				<th style="width: 100px;">작성일</th>
				<th style="width: 30px;">조회수</th>
			</tr>
		</thead>

		<tbody>
			<c:choose>
				<c:when test="${empty list }">
					<td colspan="4">등록된 공지사항이 없습니다.</td>
				</c:when>

				<c:otherwise>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td>${dto.n_no}</td>
							<td style="text-align: left;"><a
								href="javascript:read('${dto.n_no}')"> ${dto.n_title} </a> <c:if
									test="${util:newImg(dto.n_date)}">
									<img src="${pageContext.request.contextPath}/image/new.gif">
								</c:if></td>
							<td>${dto.n_date}</td>
							<td>${dto.n_cnt}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<c:if test="${not empty sessionScope.id && sessionScope.grade == 'A' }">
		<div class="btn">
			<button class="button" type="button"
				onclick="location.href='create'">등록</button>
		</div>
	</c:if>

	<br>
	<br>

	<form action="./list">

		<select class="form-control" name="col">
			<option value="n_title"
				<c:if test="${col == 'n_title'}">selected</c:if>>제목</option>

			<option value="n_content"
				<c:if test="${col == 'n_content'}">selected</c:if>>내용</option>

			<option value="n_title_n_content"
				<c:if test="${col == 'n_title_n_content'}">selected</c:if>>제목
				+ 내용</option>

			<option value="total"
				<c:if test="${col == 'n_total'}">selected</c:if>>전체출력</option>
		</select> <input type="text" name="word" class="search__input"
			placeholder="검색" value="${word}">

		<button>검색</button>

	</form>
	<br>

	<div class="paging">
		${paging}
	</div>

	<br><br><br>

</div>
</div>

</body>
</html>