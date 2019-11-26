<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>모임 게시판</title>
	<link rel="stylesheet" type="text/css" href="../css/board.css">
	
	<script type="text/javascript">
	
	function listb(){
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href = url;
	}

	function updateb(){
		var url = "update";
		url += "?b_no=${param.b_no}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href = url;
	}

	function filedown(filename){
		var url = "${pageContext.request.contextPath}/download";
		 url += "?dir=/storage";
		 url += "&filename="+filename;
		 location.href = url;
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
		<form action="delete" 
			class="form-horizontal" 
			method="post" 
			name='frm'  >
			
			<input type="hidden" name="b_no" value="${dto.b_no}">
			<input type="hidden" name="oldfile" value="${dto.b_filename}">
			
			<div id="infoDiv" style="">
				<div class="container">
					<div class="section __half __zero __wide">
						<h3 class="subject __underline">
						<br><br>
							<em>게시판 상세정보</em>
						</h3>
						
					</div>
				</div>
			</div>

			<table class="table">
			<thead>
				<tr>
					<th style="width: 20px; display: table-cell; vertical-align: middle;">ID : ${dto.m_id}</th>
					<th style="width: 400px; display: table-cell; vertical-align: middle; text-align: center;">${dto.b_title} </th>
					<th style="width: 100px; display: table-cell; vertical-align: middle; ">${dto.b_date}</th>
					<th style="width: 30px; display: table-cell; vertical-align: middle;">${dto.b_cnt}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="4" height="150px" id="t-td" >${dto.b_content}</td>
				</tr>
			
				<tr>
					<td colspan="4" style="text-align: right; display: table-cell; vertical-align: middle;"><a href="javascript:filedown('${dto.b_filename}')">첨부파일 : ${dto.b_filename}</a></td>
				</tr>
			</tbody>
			</table>


			
			<div class="section __half __center">
			<button type="submit" class="ui-button __square-large __black" >삭제</button>
			<button type="button" class="ui-button __square-large __black" onclick="updateb()">수정</button>
			<button type="button" class="ui-button __square-large __black" onclick="listb()">목록</button>
			<br><br>
			</div>
		</form>
		</div>
</body>
</html>