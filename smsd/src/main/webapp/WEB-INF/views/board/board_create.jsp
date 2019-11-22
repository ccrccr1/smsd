<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_create</title>
</head>
<body>

	<div class="container">
		
		<form class="form-horizontal" 
			  action="create" 
			  method="post"
			  enctype="multipart/form-data"
			  onsubmit="return check(this)">
		
			<div class="form-group">
				<label class="control-label col-sm-2" for="m_id">작성자</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="m_id" name="m_id">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="b_title">제목</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="b_title" name="b_title">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="b_content">내용</label>
				<div class="col-sm-6">
					<textarea rows="12" cols="6" class="form-control" id="b_content" name="b_content"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="b_filename">파일첨부</label>
				<div class="col-sm-6">
					<input type="file" class="form-control" id="b_filename" name="b_filenameMF" multiple="multiple">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6">
					<button type="submit" class="btn btn-default">등록</button>
					<button type="reset" class="btn btn-default">취소</button>
				</div>
			</div>

		
		</form>
	
	</div>

</body>
</html>