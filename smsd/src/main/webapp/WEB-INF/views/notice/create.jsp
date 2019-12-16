<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>

<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>

<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/h.css">
<link type="text/css" rel="stylesheet" href="../css/layout.css">
<link type="text/css" rel="stylesheet" href="../css/information.css">
<link type="text/css" rel="stylesheet" href="../css/cert.css">
<link type="text/css" rel="stylesheet" href="../css/popup.css">
<link type="text/css" rel="stylesheet" href="../css/main.css">

<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('n_content'); // <TEXTAREA>태그 id 값
	};
</script>

<script type="text/javascript">
	function input(f) {
		if (f.n_title.value == ''){
			alert("제목을 입력하세요.");
			f.n_title.focus();
			return false;
		}
		
		if (CKEDITOR.instances['n_content'].getData() == '') {
      		window.alert('내용을 입력해 주세요.');
      		CKEDITOR.instances['n_content'].focus();
      		return false;
    	}
	}
</script>
<style type="text/css">
.cke_1 cke cke_reset cke_chrome cke_editor_n_content cke_ltr cke_browser_webkit{
	width: 500px !important;
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
		<h1>공지사항 등록</h1>

		<div id="divOnlId" class="row">
			<div class="col-md">
				<label for="user-id">제목</label>
			</div>
			
			<div class="col-md">
				<div class="form-wrap __normal __x1">
					<div class="inner">
						<div class="ui-input">
							<input type="text" id="n_title" name="n_title"
							placeholder="Enter 제목">
							<label for="n_title"></label>
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
							<textarea rows="10" cols="70" id="n_content"
							name="n_content"></textarea>
							<label for="n_content"></label>
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