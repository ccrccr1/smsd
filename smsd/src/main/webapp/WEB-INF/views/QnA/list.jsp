<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>

<link rel="stylesheet" type="text/css" href="../css/table.css">
<link rel="stylesheet" type="text/css" href="../css/h.css">
<link rel="stylesheet" type="text/css" href="../css/search.css">
<link rel="stylesheet" type="text/css" href="../css/paging.css">

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

<script type="text/javascript">
	function read(q_no) {
		var url = "read";
		url += "?q_no="+q_no;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		
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
			<th style="width: 75px;">글 번호</th>
			<th style="width: 600px; text-align: left;">제목</th>
			<th style="width: 80px;">작성자</th>
			<th style="width: 50px;">작성일</th>
			<th style="width: 40px;">조회수</th>
		</tr>
	</thead>
	
	<tbody>
		<c:choose>
			<c:when test="${empty list }">
				<td colspan="5">등록된 글이 없습니다.</td>
			</c:when>
			
			<c:otherwise>
				<%-- 변수 dto에 있는 리스트를 이용 --%>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.q_no}</td>
						<td style="text-align:left;">
							<%-- 1로 시작해 indent의 수 만큼 반복 --%>
							<c:forEach begin="1" end="${dto.q_indent}">
								&nbsp;&nbsp;
							</c:forEach>
							
							<%-- indent가 0보다 클 경우 re이미지를 표시 --%>
							<c:if test="${dto.q_indent > 0}">
								<img src="${pageContext.request.contextPath}/image/re.jpg">
							</c:if>
							
							<%-- 작성자만 볼 수 있음 --%>
							<c:choose>
								<%-- flag가 true일 경우 if문 실행 --%>
								<c:when test="${empty sessionScope.id }">
									${dto.q_title }
								</c:when>
								
								<%-- 세션스코프 아이디가 어드민이거나 m_ID의 아이디일경우 a태그로 제목을 클릭할 수 있도록 함 --%>
								<c:when test="${sessionScope.id == 'admin' || sessionScope.id == dto.m_ID}" >
									<a href="javascript:read('${dto.q_no}')">${dto.q_title}</a>
								</c:when>
								
								<c:otherwise>
									<%-- c:set으로 flag객체를 생성하고 초기값을 false로 설정 --%>
									<c:set var="flag" value="false" />
									<%-- 변수명 ac를 사용하여 컨트롤러에서 q_no가 담긴 ac를 이용 --%>
									<c:forEach var="ac" items="${ac}">
										<%-- ac에 담긴 q_no가 현재 dto에 있는 q_no값과 같거나 --%>
										<%-- ac에 담긴 q_no가 현재 dto에 있는 q_refnum과 같으면 flag를 true로 변경 --%>
										<c:if test="${dto.q_no == ac || dto.q_refnum == ac }">
											<c:set var="flag" value="true" />
										</c:if>
									</c:forEach>							
									
									<c:choose>
										<%-- flag가 true일 경우 if문 실행 --%>
										<c:when test="${flag == true }">
											<a href="javascript:read('${dto.q_no}')">${dto.q_title}</a>
										</c:when>
										<c:otherwise>
											${dto.q_title }							
										</c:otherwise>
										
									</c:choose>
									<%-- --%>
									<c:set var="flag" value="false" />
								</c:otherwise>
								
							</c:choose>
							
							<c:if test="${util:newImg(dto.q_date)}">
								<img src="${pageContext.request.contextPath}/image/new.gif">
							</c:if>
						
						</td>
						
						<td>${dto.m_ID }</td>
						<td>${dto.q_date }</td>
						<td>${dto.q_cnt }</td>
					<tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

<c:if test="${not empty sessionScope.id && sessionScope.grade == 'D'}">
	<div class="button">
		<button class="btn btn-default" type="button" 
		onclick="location.href='create'">등록</button>
	</div>
</c:if>

<br><br>

<form action="./list">
	
	<select class="form-control" name="col">
		<option value="m_id"
			<c:if test="${col == 'm_id'}">selected</c:if>>아이디</option>

		<option value="q_title"
			<c:if test="${col == 'q_title'}">selected</c:if>>제목</option>
	
		<option value="m_id_q_title"
			<c:if test="${col == 'm_id_q_title'}">selected</c:if>>아이디
			+ 제목</option>
	
		<option value="total"
			<c:if test="${col == 'q_total'}">selected</c:if>>전체출력</option>
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