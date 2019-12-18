<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="UTF-8">

<title>QnA 등록</title>

<link type="text/css" rel="stylesheet" href="../css/layout.css">
<link type="text/css" rel="stylesheet" href="../css/information.css">
<link type="text/css" rel="stylesheet" href="../css/cert.css">
<link type="text/css" rel="stylesheet" href="../css/popup.css">
<link type="text/css" rel="stylesheet" href="../css/main.css">

<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/top.css">
<link rel="stylesheet" type="text/css" href="../css/footer.css">
<link rel="stylesheet" type="text/css" href="../css/h.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('q_content'); // <TEXTAREA>태그 id 값
	};
</script>

<script type="text/javascript">
	function input(f) {
		if (f.q_title.value == ''){
			alert("제목을 입력하세요.");
			f.q_title.focus();
			return false;
		}
		
		if (CKEDITOR.instances['q_content'].getData() == '') {
      		window.alert('내용을 입력해 주세요.');
      		CKEDITOR.instances['q_content'].focus();
      		return false;
    	}
	}
</script>
<style type="text/css">
	.wrapper{
		height: 1050px;
	}
</style>
</head>
<body>

<div class="container">

<div class="wrapper">

<form action="create" class="form-horizontal" method="post" 
		onsubmit="return input(this)">
<div id="mast-body">

<div id="infoDiv" style="">
	
	<div class="section __half __zero __wide h">
		<h1>QnA 등록</h1>

		<div id="divOnlId" class="row">
			<div class="col-md">
				<label for="user-id">작성자</label>
			</div>
			
			<div class="col-md">
				<div class="form-wrap __normal __x1">
					<div class="inner">
						<div class="ui-input">
							<input type="text" id="m_ID" name="m_ID" value="${sessionScope.id}" readonly>
							<label for="m_ID"></label>
						</div>						
					</div>
					
				</div>
			</div>
		</div>
		
		<div id="divOnlId" class="row">
			<div class="col-md">
				<label for="user-id">제목</label>
			</div>
			
			<div class="col-md">
				<div class="form-wrap __normal __x1">
					<div class="inner">
						<div class="ui-input">
							<input type="text" id="q_title" name="q_title" placeholder="Enter 제목">
							<label for="q_title"></label>
						</div>						
					</div>
					
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md">
				<label for="name">내용</label>
			</div>
			
			<div class="col-md">
				<div class="form-wrap __normal __x1">
					<div class="inner">
						<div class="ui-input">
							<textarea rows="10" cols="70" id="q_content" name="q_content"></textarea>
							<label for="q_content"></label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="section __half __center">
		<button type="submit" class="ui-button __square-large __black"
			>등록</button>
		<button type="reset" class="ui-button __square-large __blue"
			>취소</button>
	</div>
</div>

</div>
	
</form>

</div>
</div>

</body>
</html>