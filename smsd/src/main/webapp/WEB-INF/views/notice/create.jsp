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

<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/h.css">
<link type="text/css" rel="stylesheet" href="../css/layout.css">
<link type="text/css" rel="stylesheet" href="../css/information.css">
<link type="text/css" rel="stylesheet" href="../css/cert.css">
<link type="text/css" rel="stylesheet" href="../css/popup.css">
<link type="text/css" rel="stylesheet" href="../css/main.css">

<script type="text/javascript" 
src="${pageContext.request.contextPath}/smarteditor/js/HuskyEZCreator.js" 
charset="utf-8"></script>

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
						<div class="ui-input" style="width:80%;">
							<textarea rows="10" cols="100" id="n_content"
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

<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 	oAppRef: oEditors,
	 	elPlaceHolder: "n_content",
	 	sSkinURI: "${pageContext.request.contextPath}/smarteditor/SmartEditor2Skin.html",
	 	fCreator: "createSEditor2",
	 	htParams: { fOnBeforeUnload : function(){}}
	});

	function input(f) {
		if (f.n_title.value == '') {
			alert("제목을 입력하세요.");
			f.n_title.focus();
			return false;
		}
		
// 		if (CKEDITOR.instances['n_content'].getData() == '') {
//       		window.alert('내용을 입력해 주세요.');
//       		CKEDITOR.instances['n_content'].focus();
//       		return false;
//     	}
	
		<!-- (페이지 이동 바로직전(onsubmit)에 textarea에 스마트에디터 내용 업데이트 ) -->
		oEditors.getById["n_content"].exec("UPDATE_CONTENTS_FIELD", []);
	
		<!-- 파일업로드 유효성검사(널체크) -->
		$('#n_content').val() == ""  || $('#n_content').val() == null || $('#n_content').val() == '&nbsp;' || $('#n_content').val() == '<p>&nbsp;</p>'
	}
</script>

</div>

</body>

</html>