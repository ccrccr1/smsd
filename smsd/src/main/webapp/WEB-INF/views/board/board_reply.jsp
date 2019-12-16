<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>게시글 답변</title>

<link rel="stylesheet" type="text/css" href="../css/board.css">


<script type="text/javascript">
</script>
</head>

<body id="KOR">
	
<div class="wrapper">
	<!-- mast head start -->
	<div id="mast-head">
		<div class="container">

			<h1 class="title" id="mastHeadTitle">축제 모임 게시판</h1>
			
		</div>

	</div>
	
	<!-- mast head end -->
	<form action="reply" 
			class="form-horizontal" 
			method="post" 
			name='frm'
			enctype="multipart/form-data"
			onsubmit="return inCheck(this)">
		
		<input type="hidden" name="b_ref" value="${dto.b_ref}">
	  	<input type="hidden" name="b_indent" value="${dto.b_indent}">
		<input type="hidden" name="b_ansnum" value="${dto.b_ansnum}">
		<input type="hidden" name="b_no" value="${param.b_no}">
		<input type="hidden" name="col" value="${param.col}">
		<input type="hidden" name="word" value="${param.word}">
		<input type="hidden" name="nowPage" value="${param.nowPage}">
	
		
	<div id="mast-body">

		<div id="infoDiv" style="">
			<div class="container">
				<div class="section __half __zero __wide">
					<h3 class="subject __underline">
						<em>게시글 답변</em>
					</h3>
					
					
					<div class="row">
						<div class="col-md">
							<label for="title">제목</label>
						</div>
						<div class="col-md">
							<div class="form-wrap __normal __x1">
								<div class="inner">
									<div class="ui-input">
										<input type="text" id="b_title" name="b_title" >
										<label for="b_title"></label>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md">
							<label for="name">작성자</label>
						</div>
						<div class="col-md">
							<div class="form-wrap __normal __x1">
								<div class="inner">
									<div class="ui-input">
										<input  type="text" id="m_id" name="m_id">
										<label for="m_id"></label>
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
										<textarea rows="10" cols="70" id="b_content" name="b_content"></textarea>
										<label for="b_content"></label>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md">
							<label for="content">첨부파일</label>
						</div>
						<div class="col-md">
							<div class="form-wrap __normal __x1">
								<div class="inner">
									<div class="ui-input">
										<input type="file" class="form-control" id="b_filename" name="b_filenameMF" multiple="multiple">
									</div>
								</div>
							</div>
						</div>
					</div>
					

				</div>
				<div class="section __half __center">
					<br><br>
					<button type="submit" class="ui-button __square-large __blue"
						>등록</button>
					<button type="button" class="ui-button __square-large __black"
						onclick="history.back()">취소</button>
					<br><br>
				</div>
			</div>
		</div>
	</div>
	</form>
</div>
	
		
</body>
</html>