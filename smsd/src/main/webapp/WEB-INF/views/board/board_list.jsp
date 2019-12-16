<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>모임 게시판 목록</title>
<!-- 	<link rel="stylesheet" type="text/css" href="../css/board.css"> -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

	<script type="text/javascript">
	function read(b_no){
		var url = "read";
		url += "?b_no="+b_no;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		
		location.href=url;
	}
	</script>

	
</head>

<body id="KOR">
	<div class="wrapper">
	
			<!-- mast head start -->
			<div id="mast-head">
				<div class="container">
					<h1 class="title" id="mastHeadTitle">모임 게시판</h1>
				</div>
			</div>

			<!-- mast head end -->

					<div id="infoDiv" style="">
						<div class="container">
							<div class="section __half __zero __wide">
								<h3 class="subject __underline">
									<br><br>
									<em>게시판 목록</em>
								</h3>
								<!-- <div class="form-group">
									<select class="form-control" name="col">
										<option value="">최근등록순</option>
										<option value="">조회순</option>
									</select>
								</div>
 -->
							</div>
						</div>
					

					<table class="table">

						<thead>
							<tr >
								<th style="width: 20px; display: table-cell; vertical-align: middle;">번호</th>
								<th style="width: 400px;  display: table-cell; vertical-align: middle; text-align: center;">제목</th>								
								<th style="width: 70px; display: table-cell; vertical-align: middle;">작성자</th>
								<th style="width: 100px; display: table-cell; vertical-align: middle; ">작성일</th>
								<th style="width: 30px; display: table-cell; vertical-align: middle;">조회수</th>
							</tr>
						</thead>

						<tbody>
							<c:choose>
								<c:when test="${empty list}">
									<tr><td colspan="5">등록된 글이 없습니다.</td>
								</c:when>
								
								<c:otherwise>
									<c:forEach var="dto" items="${list}">
									<tr>
									
										<td style="display: table-cell; vertical-align: middle;" >${dto.b_no}</td>
										<td style="text-align: left; display: table-cell; vertical-align: middle;" >
											
											<c:forEach begin="1" end="${dto.b_indent }">
											&nbsp;&nbsp;
											</c:forEach>
											
											<c:if test="${dto.b_indent>0}">
												<img src="${pageContext.request.contextPath}/image/re.jpg">
											</c:if>
											
											
											<c:set var="rcount" value="${util:rcount(dto.b_no,brmapper) }"/>
											<a href="javascript:read('${dto.b_no}')">${dto.b_title}</a>
											
											
											<c:if test="${rcount>0 }">
									            <span class="badge" style="color : white; background-color : #dc5d46; border-radius:100%; font-size: 15px; margin: 5px 5px 5px 5px; "> &nbsp;${rcount}&nbsp; </span>
									        </c:if>
									         
									      
											<c:if test="${util:newImg(dto.b_date)}">
												<img src="${pageContext.request.contextPath}/image/new.gif">
											</c:if>		
										</td>
										<td style="display: table-cell; vertical-align: middle;">${dto.m_id}</td>
										<td style="display: table-cell; vertical-align: middle;">${dto.b_date}</td>
										<td style="display: table-cell; vertical-align: middle;">${dto.b_cnt}</td>
									</tr>
									</c:forEach>
									
								</c:otherwise>
							</c:choose>

						</tbody>
					</table>
					<br>
					</div>
					
					
			<form action="list"
				  class="form-inline" 
				  method="post"
				  name='frm'>
	
				<div style="text-align: right;">
				
				<div class="form-group">
				<div>			
					<select class="form-control" name="col" style="width: 30%;">
						<option value="b_title"
							<c:if test="${col == 'b_title'}">selceted</c:if>
						>제목</option>
						<option value="b_content"
							<c:if test="${col == 'b_content'}">selected</c:if>
						>내용</option>
						<option value="m_id"
							<c:if test="${col == 'm_id'}">selected</c:if>
						>아이디</option>
						<option value="b_title_content"
							<c:if test="${col == 'b_title_content'}">selected</c:if>
						>제목+내용</option>
						<option value="total"
							<c:if test="${col == 'total'}">selected</c:if>
						>전체보기</option>
					</select>
					<input type="text" class="form-control" placeholder="검색" name="word" value="${word}" style="width: 60%; margin-left: 5px;">
					
					<div style="margin-top: 20px;">					
					<button type="submit" class="ui-button __square-large __black" style="margin-right: 5px;">검색</button>	
					<button type="button" class="ui-button __square-large __black" onclick="location.href='create'">등록</button>	
					</div>
			
				</div>
						
				
				</div>
				<br><br><br><br>
				</div>
				
				
			</form>
			${paging }

		</div>
</body>

</html>