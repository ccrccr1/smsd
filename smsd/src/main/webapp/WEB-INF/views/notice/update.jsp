<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/top.css">
<link rel="stylesheet" type="text/css" href="../css/footer.css">
<link rel="stylesheet" type="text/css" href="../css/h.css">

<link rel="stylesheet" type="text/css" href="../css/layout.css">
<link rel="stylesheet" type="text/css" href="../css/information.css">
<link rel="stylesheet" type="text/css" href="../css/cert.css">
<link rel="stylesheet" type="text/css" href="../css/popup.css">
<link rel="stylesheet" type="text/css" href="../css/main.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
	window.onload = function() {
		CKEDITOR.replace('n_content'); // <TEXTAREA>태그 id 값
	};
</script>

<script type="text/javascript">
	function input(f) {
		if (f.n_title.value == '') {
			alert("제목을 입력하세요.");
			f.n_title.focus();
			return false;
		}
		
		if (f.n_content.value == '') {
			alert("내용을 입력하세요.");
			f.n_content.focus();
			return false;
		}
	}
</script>

</head>
<body>

<div class="container">

<div class="wrapper">

<form action="update" class="form-horizontal" method="post" 
		onsubmit="return input(this)">
		
<input type="hidden" name="n_no" value="${param.n_no}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">
		
<div id="mast-body">

<div id="infoDiv">
	
	<div class="section __half __zero __wide h">
		<h1>공지사항 수정</h1>

		<div id="divOnlId" class="row">
			<div class="col-md">
				<label for="user-id">제목</label>
			</div>
			
			<div class="col-md">
				<div class="form-wrap __normal __x1">
					<div class="inner">
						<div class="ui-input">
							<input type="text" id="n_title" name="n_title"
							value="${dto.n_title}">
							
						</div>						
					</div>
					
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md">
				<label for="content">내용</label>
			</div>
			
			<div class="col-md">
				<div class="form-wrap __normal __x1">
					<div class="inner">
						<div class="ui-input">
							<textarea rows="10" cols="80" id="n_content" name="n_content">${dto.n_content}</textarea>
							<label for="n_content"></label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="section __half __center">
		<button type="submit" class="ui-button __square-large __black"
			onclick="input()">수정</button>
		<button type="reset" class="ui-button __square-large __blue"
			>취소</button>
		<button type="button" class="ui-button __square-large __black"
			onclick="history.back()">뒤로</button>
	</div>
</div>

</div>
	
</form>

</div>
</div>

</body>
</html>