<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>

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
src="${pageContext.request.contextPath}/smarteditor/js/HuskyEZCreator.js" 
charset="utf-8"></script>

<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script> -->

<!-- 	
<script type="text/JavaScript">
	window.onload=function(){
   		CKEDITOR.replace('q_content');  // <TEXTAREA>태그 id 값
	};
</script>
 -->

<style type="text/css">
	.wrapper{
		height: 1050px;
}
</style>
</head>
<body>

<div class="container">

<div class="wrapper">

<form action="update" class="form-horizontal" method="post" 
		onsubmit="return input(this)">

<input type="hidden" name="q_no" value="${param.q_no}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">

<div id="mast-body">

<div id="infoDiv" style="">
	
	<div class="section __half __zero __wide h">
		<h1>QnA 수정</h1>

		<div id="divOnlId" class="row">
			<div class="col-md">
				<label for="user-id">작성자</label>
			</div>
			
			<div class="col-md">
				<div class="form-wrap __normal __x1">
					<div class="inner">
						<div class="ui-input" style="width:678px;">
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
						<div class="ui-input" style="width:678px;">
							<input type="text" id="q_title" name="q_title"
							value="${dto.q_title}">
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
						<div class="ui-input" style="width:80%;">
							<textarea rows="10" cols="100" id="q_content"
							name="q_content">${dto.q_content}</textarea>
							<label for="q_content"></label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="section __half __center">
		<button type="submit" class="ui-button __square-large __black"
			>수정</button>
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
	 	elPlaceHolder: "q_content",
	 	sSkinURI: "${pageContext.request.contextPath}/smarteditor/SmartEditor2Skin.html",
	 	fCreator: "createSEditor2",
	 	htParams: { fOnBeforeUnload : function(){}}
	});

	function input(f) {
		if (f.q_title.value == '') {
			alert("제목을 입력하세요.");
			f.q_title.focus();
			return false;
		}
		
// 		if (CKEDITOR.instances['q_content'].getData() == '') {
//       		window.alert('내용을 입력해 주세요.');
//       		CKEDITOR.instances['q_content'].focus();
//       		return false;
//     	}
	
		<!-- (페이지 이동 바로직전(onsubmit)에 textarea에 스마트에디터 내용 업데이트 ) -->
		oEditors.getById["q_content"].exec("UPDATE_CONTENTS_FIELD", []);
	
		<!-- 파일업로드 유효성검사(널체크) -->
		$('#q_content').val() == ""  || $('#q_content').val() == null || $('#q_content').val() == '&nbsp;' || $('#q_content').val() == '<p>&nbsp;</p>'
	}
</script>
</div>

</body>
</html>