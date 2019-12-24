<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
<style type="text/css">
	.wrapper{
		height: 1100px;
	}
</style>

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
	<form action="update" 
			class="form-horizontal" 
			method="post" 
			name='frm'
			enctype="multipart/form-data"
			onsubmit="return inCheck(this)">
			
	<input type="hidden" name="oldfile" value="${dto.b_filename}">
	<input type="hidden" name="b_no" value="${dto.b_no}">
	<input type="hidden" name="col" value="${param.col}">
	<input type="hidden" name="word" value="${param.word}">
	<input type="hidden" name="nowPage" value="${param.nowPage}">
	
	
	
	<div id="mast-body">

		<div id="infoDiv" style="">
			<div class="container">
				<div class="section __half __zero __wide">
					<h3 class="subject __underline">
						<em>게시글 등록</em>
					</h3>
					
					
					<div class="row">
						<div class="col-md">
							<label for="title">제목</label>
						</div>
						<div class="col-md">
							<div class="form-wrap __normal __x1">
								<div class="inner">
									<div class="ui-input">
										<input type="text" id="b_title" name="b_title" value="${dto.b_title}">
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
										<input  type="text" id="m_id" name="m_id" value="${dto.m_id}">
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
										<textarea rows="10" cols="70" id="b_content" name="b_content" >${dto.b_content}</textarea>
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
										<input type="file" class="form-control" id="b_filename" name="b_filenameMF" multiple="multiple" >(${dto.b_filename})
									</div>
								</div>
							</div>
						</div>
					</div>
					

				</div>
				<div class="section __half __center">
					<br><br>
					<button type="submit" class="ui-button __square-large __blue"
						>확인</button>
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