<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style type="text/css">
.review_top {
	padding-top: 30px;
	padding-bottom: 30px;
}

.review_title {
	font-size: 30px;
	font-weight: bold;
	padding-bottom: 20px;
}

.review_t {
	border: 1px solid #e2e2e2;
	width: 82%;
	height: 20%;
	padding: 10px;;
	margin-right: 10px;
	display: inline-block;
	float: left;
}

.review_box, .u_review_box {
	border: 1px solid #e2e2e2;
	width: 95%;
	padding: 20px;
}

#r_star {
	width: 80%;
	height: 40px;
	margin-top: 8px;
	border: 1px solid #e2e2e2;
	padding: 5px 10px 10px 10px;
	display: inline-block;
	font-size: 14px;
}

#createbtn {
	margin-top: 8px;
	display: inline-block;
	border: 1px solid #e2e2e2;
	padding: 10px 10px 10px 10px;
	width: 200px;
	height: 40px;
	font-size: 15px;
	background-color: white;
}

.check {
	display: inline-block;
	width: 30px;
	height: 30px;
	margin-top: -5px;
	margin-right: 3px;
}

.review_content {
	border-bottom: 1px solid #e2e2e2;
	position: relative;
	width: 100%;
	padding-bottom: 10px;
	padding-top: 5px;
}

.c_title {
	font-weight: bold;
	line-height: 150%;
	color: #454545;
	display: block;
	margin-right: 50px;
	margin-bottom: 7px;
}

.c_content {
	padding-top: 5px;
	margin-bottom: 10px;
}

.review_file {
	width: 100px;
	height: 100px;
	margin-bottom: 5px;
	margin-left: 10px;
}

.c_d {
	margin-top: 10px;
	text-align: right;
}

.filebox label {
	display: inline-block;
	padding: 8px;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #333333;
	cursor: pointer;
	border: 1px solid #333333;
	color : white;
	width: 10%;
	height: 20%;
	text-align: center;
	
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
	display: inline-block;
}

/* >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> update css <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< */
.u_notice {
	margin-left: 7px;
	color: #222222;
}

#u_oldfile {
	margin-bottom: 7px;
	color: #e2e2e2;
	float: right;
}

#s {
	color: red;
}

.u_review_t {
	border: 1px solid #e2e2e2;
	width: 95%;
	height: 20%;
	padding: 10px;
	padding-left: 20px;
	margin-bottom: 8px;
	margin-right: 10px;
	display: inline-block;
	float: left;
}

#u_star {
	width: 100%;
	height: 40px;
	margin-top: 8px;
	border: 1px solid #e2e2e2;
	padding: 5px 10px 10px 10px;
	display: inline-block;
	font-size: 14px;
}

#u_updatebtn, #u_updateresetbtn {
	margin-top: 60px;
	display: inline-block;
	border: 1px solid #e2e2e2;
	padding: 10px 10px 10px 10px;
	width: 190px;
	height: 40px;
	font-size: 15px;
}

.u_filebox label {
	display: inline-block;
	padding: 10px;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	width: 12%;
	height: 40px;
	text-align: center;
}

.u_filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
	display: inline-block;
}

/* >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> modal css <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< */
#modal {
	border: 1px solid #888;
	width: 820px;
	height: 520px;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	overflow: auto; /* Enable scroll if needed */
	background-color: #fefefe;
	visibility: hidden;
	border-radius: 20px;
}
#modal2 {
	border: 1px solid #888;
	width: 820px;
	height: 520px;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	overflow: auto; /* Enable scroll if needed */
	background-color: #fefefe;
	visibility: hidden;
}

.modal_background {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
.modal_background2 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

#close {
	color: #aaa;
	margin-top: 7px;
	margin-right: 15px;
	float: right;
	font-size: 28px;
	font-weight: bold;
}
#close2 {
	color: #aaa;
	margin-top: 7px;
	margin-right: 15px;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

#close:hover, #close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.modal_header {
	font-size: 25px;
	font-weight: bold;
	padding: 10px;
	margin-top: 20px;
	margin-left: 10px;
}

.modalContent {
	padding: 10px;
}
#modal_img{
	padding : 20px;
	width: 700px;
	height: 450px; 
}
</style>

	<script type="text/javascript">

	function checkid(f){
		
		if(f.r_title.value.length==0){
			alert("제목을 입력하세요");
			f.r_title.focus();
			return false;
		}
		if(f.r_content.value.length==0){
			alert("내용을 입력하세요");
			f.r_content.focus();
			return false;
		}

		if('${sessionScope.id}' == ''){
			alert("로그인이 필요합니다.");
		
			var url = "login";
	        location.href = url;
	        
			return false;
		}
		
	}
	
	function review_delete(r_no, r_file){
		
		if(confirm("게시글을 삭제하시겠습니까? ")){
			
			var url = "review/delete";
			url += "?r_no="+r_no;
			url += "&f_id=${f_id}";
			url += "&oldfile="+r_file;
			
			
			location.href = url;

			}
	}
	function modalOpen(r_no, f){
		
		var modal = document.getElementById('modal');
		var close = document.getElementById('close');
		
		var title = document.getElementById('c_title'+r_no).innerHTML;
		var star = title.substring(title.indexOf("★"), title.lastIndexOf("★")+1);
		var c_title = title.substring(0, title.indexOf("★"));
		var t_title = c_title.trim();
		
		var content = document.getElementById('c_content'+r_no).innerHTML
		var c_content = content.substring(content.indexOf(">")+1);
		var t_content = c_content.trim();

		var oldfile2 = f; 		
	
		
		$('#modal_r_no').val(r_no);
		$('#modal_oldfile').val(oldfile2);
	
		$('#u_title').val(t_title);
		document.getElementById('u_content').innerHTML = t_content;
		
		$('#u_star').val(star.length).prop("selected",true);
		
		
		//modal 창 띄우기
		$('#modal_background').show();
		modal.style.visibility = "visible";
		
	}

	</script>

</head>
<body>
<div class="container" style="width: 100%">
	<div class="wrapper">
		<div class="review_top">
	
			<h3 class="review_title">구매후기(${cnt})</h3>

<form   name = "frm"
		action = "review/create"
		method = "post"
		enctype = "multipart/form-data"
		onsubmit = "return checkid(this)">
		
<%-- <input type="hidden" name="f_id" value="${dto.f_id}"> --%>
<input type="hidden" name="r_oldfile" value="${dto.r_file}">
<input type="hidden" name="f_id" value="${f_id}">


<div style="margin-bottom: 10px;">
	<input class="review_t" placeholder="제목 : " name="r_title" id = "r_title">
	<div class="filebox"><label for="r_file">파일첨부</label><input type="file" id="r_file" name="r_fileMF" accept=".jpg,.gif,.png" multiple="multiple"></div>
	
</div>


<textarea class="review_box" rows="7" cols="100%" name="r_content" id="r_content"  onclick="this.value='';">
* 리뷰 작성 시 적립금 최대 10,000원 지급 ! *
- 텍스트 리뷰 : 축제당 500원 지급
- 포토리뷰 : 축제당 1,000지급
- 베스트리뷰 : 상시 선정! 베스트 리뷰 10,000원 지급 !!
</textarea>
			<div class="review_box2">
				<!-- <div class="review_star">★★★★ 아주 좋아요</div> -->
				<div class="form-group" >
					<select class="form-control" id="r_star" name="r_star">
						<option value="5">★★★★★  아주 좋아요</option>
						<option value="4">★★★★☆  맘에 들어요</option>
						<option value="3">★★★☆☆  보통 이에요</option>
						<option value="2">★★☆☆☆  그냥 그래요</option>
						<option value="1">★☆☆☆☆  별로 ㅠㅠㅠ</option>
					</select>
				<button class="btn btn-default" id="createbtn" style="float: right;" type="submit">
				<%-- <img class="check" src="${pageContext.request.contextPath}/image/check.jpg">
				 --%>후기 등록하기
				</button>					
				</div>
			</div>
</form>
			
		</div>
	
		
		<div class="review_content">
			
			
 				<c:choose>
						<c:when test="${empty list}">
							<tr><td colspan="2">등록된 후기가 없습니다.</td></tr>
						</c:when>
								
						<c:otherwise>
							<c:forEach var="dto" items="${list}"> 
								<div class="review_content">
									<div class="c_title" id="c_title${dto.r_no}">${dto.r_title}
									<c:forEach begin="1" end="${dto.r_star}">★</c:forEach>
									</div>
									<div class="c_content" id="c_content${dto.r_no}">
										<c:choose>
											<c:when test="${empty dto.r_file }">
												${dto.r_content}
											</c:when>
											<c:otherwise>										
												<img class="review_file" id="review_img" src="${pageContext.request.contextPath}/storage/${dto.r_file}">
												<br>${dto.r_content}								
											</c:otherwise>
										</c:choose>		
									</div>
									<div class="c_d">${dto.m_id} / ${dto.r_date} </div>
									<c:if test="${sessionScope.id == dto.m_id}">
									<div class="c_d"><button type="button" id="modalOpen" onclick="modalOpen('${dto.r_no}','${dto.r_file}')">수정</button> / <button type="button" onclick="review_delete('${dto.r_no}','${dto.r_file}')">삭제</button></div>		
									</c:if>
								</div>

 							</c:forEach>	
						</c:otherwise>
					</c:choose>
					
<!--------------------------------------------------------  modal review update  -------------------------------------------------------------------------->
					<div class="modal_background" id="modal_background">
						<div class="modal fade" id="modal">
							<div><span id="close">&times;</span></div>
							<div class="modal_header">Update Review !!!! </div>
							<div class="modalContent">
							
								
								<form   name = "frm"
										action = "review/update"
										method = "post"
										enctype = "multipart/form-data">

 								<input type="hidden" name="u_oldfile" id="modal_oldfile">
								<input type="hidden" name="r_no" id="modal_r_no">
								<input type="hidden" name="f_id" value="${f_id}">

<div>
	<div style="display: inline-block; width: 100%;">
		<div class="u_notice"> <span id="s">****</span> 리뷰 수정 시 사진 업로드를 다시 해주세요 ! <span id="s">****</span></div>
		<div id="u_oldfile"></div>	
	</div>
	<input class="u_review_t" placeholder="제목 : " name="u_title" id = "u_title">
	<!-- <div class="u_filebox"><label for="r_file">파일첨부</label><input type="file" id="r_file" name="r_fileMF" accept=".jpg,.gif,.png" multiple="multiple"></div> -->
	

	
</div>


<textarea class="u_review_box" rows="7" cols="100%" name="u_content" id="u_content">
</textarea>
			<div class="review_box2">
				<!-- <div class="review_star">★★★★ 아주 좋아요</div> -->
				<div class="form-group" >
					<select class="form-control" id="u_star" name="u_star">
						<option value="5">★★★★★  아주 좋아요</option>
						<option value="4">★★★★☆  맘에 들어요</option>
						<option value="3">★★★☆☆  보통 이에요</option>
						<option value="2">★★☆☆☆  그냥 그래요</option>
						<option value="1">★☆☆☆☆  별로 ㅠㅠㅠ</option>
					</select>					
				</div>
			</div>
			
			<input type="file" id="u_file" name="r_fileMF" accept=".jpg,.gif,.png" multiple="multiple" style="margin-top: 10px;">
			
			<div style="width:100%; height:100%; text-align: center;">
				<button class="btn btn-default" type="submit" id="u_updatebtn" >확인</button>
				<button class="btn btn-default" type="reset"  id="u_updateresetbtn" >취소</button>			
			</div>
 </form>
							

							</div>
						</div>
					</div>	
					
					<div class="modal_background2" id="modal_background2">
						<div class="modal fade" id="modal2">
							<div><span id="close2">&times;</span></div>
							<div class="modalContent">
							<img id="modal_img">
							</div>
			
						</div>
					</div>
					

			<br><br><br>
		</div>

	</div>
</div>

<script src="https://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	
	
	var modal = document.getElementById('modal');
	var modal2 = document.getElementById('modal2');

 $(function(){


		//modal 창 닫기
		$('#close').click(function (e){
			e.preventDefault();
			modal.style.visibility="hidden";
			$('#modal_background').hide();
		});
		//modal2 창 닫기
		$('#close2').click(function (e){
			e.preventDefault();
			modal2.style.visibility="hidden";
			$('#modal_background2').hide();
		});
		$('#u_updateresetbtn').click(function (e) {
			e.preventDefault();
			modal.style.visibility="hidden";
			$('#modal_background').hide();
		});
		$('#review_img').click(function (e){
			
			var msrc = jQuery('#review_img').attr("src");
			jQuery("#modal_img").attr("src", msrc);
			
			$('#modal_background2').show();
			modal2.style.visibility = "visible";
		})
		
		
	});
 

</script>

</body>


</html>