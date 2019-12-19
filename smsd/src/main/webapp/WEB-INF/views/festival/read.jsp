<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="${root}/festival/read/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${root}/festival/read/css/animate.css">
    <link rel="stylesheet" href="${root}/festival/read/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${root}/festival/read/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${root}/festival/read/css/magnific-popup.css">
    <link rel="stylesheet" href="${root}/festival/read/css/aos.css">
    <link rel="stylesheet" href="${root}/festival/read/css/ionicons.min.css">
    <link rel="stylesheet" href="${root}/festival/read/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${root}/festival/read/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${root}/festival/read/css/flaticon.css">
    <link rel="stylesheet" href="${root}/festival/read/css/icomoon.css">
    <link rel="stylesheet" href="${root}/festival/read/css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/review.css">
    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    
    <style>
	.btn_1{
		margin-top: 60px;
    	background-color: #2493e0;
    	padding: 23px 79px;	
		display: inline-block;
	    padding: 13px 30px;
	    border-radius: 0;
	    font-size: 16px;
	    color: #fff;
	    text-transform: capitalize;
	    -webkit-transition: 0.5s;
	    transition: 0.5s;
	    background-color: #fe5c24;
	    font-weight: 500;	
	}
	.footer {
		bottom: 0;
	}
	/* >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> modal css <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< */

#mtest2{

	display : none;
	border: 1px solid #888;
	width: 860px;
	height: 560px;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	position: fixed; /* Stay in place */
	z-index: 2;/* Sit on top */
	overflow: auto; /* Enable scroll if needed */
	background-color: #fefefe;
}
#mclose {
	color: #aaa;
	margin-top: 7px;
	margin-right: 15px;
	float: right;
	font-size: 28px;
	font-weight: bold;
}
#mtest{

	display : none;
	border: 1px solid #888;
	width: 820px;
	height: 520px;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	position: fixed; /* Stay in place */
	z-index: 2;/* Sit on top */
	overflow: auto; /* Enable scroll if needed */
	background-color: #fefefe;
}
#pclose {
	color: #aaa;
	margin-top: 7px;
	margin-right: 15px;
	float: right;
	font-size: 28px;
	font-weight: bold;
}


#mclose:hover, #mclose:focus, #pclose:hover, #pclose:focus{
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
	height: 500px; 
}

#test2, #test3{
	border-radius: 5px;
	border: 1px solid #d9e0e6;
}
#test2{
	margin-right: 10px;
}

</style>
    
    
  </head>
  <body>    
    <div class="hero-wrap js-fullheight" style="background-image: url('${read.f_image}');" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-end" data-scrollax-parent="true">
          <div class="col-md-12 text-center ftco-animate mt-5" data-scrollax=" properties: { translateY: '70%' }">
            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">${read.f_title }</h1>
            <div class="banner_text_iner">
		           	<a href="javascript:booking('${read.f_id}')" class="btn_1">예매하기</a>
	            	<a href="javascript:bucket('${read.f_id}')" class="btn_1">즐겨찾기</a>
            </div>
          </div>
        </div>
      </div>
    </div>	

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center pb-5">
          		<div class="col-md-12 heading-section text-center ftco-animate">
            		<h2 class="mb-4">Best Place to Travel</h2>
          		</div>
        	</div>
    		<div class="row justify-content-center">
    			<c:forEach var="dto" items="${list}">
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="project">
    					<div class="img">
		    				<img src="${dto.f_image}" class="img-fluid" alt="Colorlib Template" style="width: 300px; height: 200px;">	
	    				</div>
    				</div>
    			</div>
    			</c:forEach>
    		</div>
    	</div>
    </section>

    <section class="ftco-section services-section bg-light">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="media-body">
                <h3 class="heading mb-3">Homepage</h3>
                <p>${read.f_homepage}</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="media-body">
                <h3 class="heading mb-3">전화</h3>
                <p>${read.f_telname}</p>
                <br>
                <p>${read.f_tel}</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="media-body">
                <h3 class="heading mb-3">장소</h3>
                <p>${read.f_address}</p>
                <br>
                <p>${read.f_eventplace}</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="media-body">
                <h3 class="heading mb-3">기간</h3>
                <p>시작일 : ${read.f_sdate}</p>
                <br>
                <p>종료일 : ${read.f_edate}</p>
                <br>
                <p>${read.f_playtime}</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block">
              <div class="media-body">
                <h3 class="heading mb-3">참여 연령대</h3>
                <p>${read.f_age}</p>
              </div>
            </div>      
          </div>
        </div>
      </div>
    </section>
   	
    <section class="ftco-counter img" id="section-counter">
    	<div class="container">
    		<div class="row d-flex">
    			<div class="col-md-6 d-flex">
    				<div class="img d-flex align-self-stretch" style="background-image:url(${read.f_image});"></div>
    			</div>
    			<div class="col-md-6 pl-md-5 py-5">
    				<div class="row justify-content-start pb-3">
		          <div class="col-md-12 heading-section ftco-animate">
		            <h2 class="mb-4">About Festival</h2>
		          </div>
		        </div>
		    		<div class="row">
		          <div class="col-md-6 justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center py-5 bg-light mb-4">
		              <div class="text">		
		                <p>조회 수</p>
		                <br>
		                <strong class="number" data-number="${read.f_cnt }">0</strong>
		              </div>
		            </div>
		          </div>	
		          <div class="col-md-6 justify-content-center counter-wrap ftco-animate">
		            <div class="block-18 text-center py-5 bg-light mb-4">
		              <div class="text">
		              	<p>가격</p>
		              	<br>
		                <strong class="number" data-number="${read.f_price}">0</strong>
		              </div>
		            </div>
		          </div>
		        </div>
	        </div>
        </div>
    	</div>
    </section>
<section class="ftco-section bg-light">
    <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2>후기</h2>
          </div>
        </div>
        <a style="float: right;" href="javascript:review('${read.f_id}')">>></a>
        
        
        <div class="container" style="width: 100%">
		<div class="wrapper">
		<div class="review_top">
			<h3 class="review_title">구매후기(${cnt})</h3>
	
			
			<div id="mtest">
				<div><span id="pclose">&times;</span></div>
				<div class="modalContent">
					<img id="modal_img">
					</div>
			</div>

<!--------------------------------------------------------  modal  -------------------------------------------------------------------------->

		<div id="mtest2">
			<div><span id="mclose">&times;</span></div>
			<div class="modal_header">Update Review !!!! </div>
			<div class="modalContent">			
			
			<form   name = "frm"
					action = "read/update"
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
					<div>
						<input class="u_review_t" placeholder="제목 : " name="u_title" id = "u_title">
						<div class="ufile">
						<label for="u_file">업로드</label>			
						<input type="file" id="u_file" name="r_fileMF" accept=".jpg,.gif,.png" multiple="multiple" style="margin-top: 10px;">
				</div>
					</div>
				</div>
				<textarea class="u_review_box" rows="7" cols="100%" name="u_content" id="u_content"></textarea>
				
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
				
				
				<div style="width:100%; height:100%; text-align: center;">
					<button class="btn btn-default" type="submit" id="u_updatebtn" >확인</button>
					<button class="btn btn-default" type="reset"  id="u_updateresetbtn" >취소</button>			
				</div>
	 		</form>
			</div>
		</div>
<!-------------------------------------------------------- / modal  -------------------------------------------------------------------------->

		<form   name = "frm"
				action = "read/create"
				method = "post"
				enctype = "multipart/form-data"
				onsubmit = "return checkid(this)"
				accept-charset="UTF-8">
		
		
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
			
	</div><!-- /review_top -->
	
		
		<div class="review_content">
 			<c:choose>
					<c:when test="${empty rlist}">
							<tr><td colspan="2">등록된 후기가 없습니다.</td></tr>
					</c:when>
								
					<c:otherwise>
						<c:forEach var="dto" items="${rlist}"> 
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
												<img class="review_file" id="pic" src="${pageContext.request.contextPath}/storage/${dto.r_file}">								
												<br>${dto.r_content}								
											</c:otherwise>
										</c:choose>		
									</div>
									<div class="c_d">${dto.m_id} / ${dto.r_date} </div>
									<c:if test="${sessionScope.id == dto.m_id}">
									<div class="c_d"><button class="btn btn-default" id="test2" onclick="modal_update('${dto.r_no}','${dto.r_file}')">수정</button><button class="btn btn-default" id="test3" type="button" onclick="review_delete('${dto.r_no}','${dto.r_file}')">삭제</button></div>		
									</c:if>
								</div>
 						</c:forEach>	
					</c:otherwise>
				</c:choose>

		</div><!-- /review_content -->
		${paging }
	</div>
</div>


   </div>
   </section>


  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
  
  <script src="https://code.jquery.com/jquery-latest.js"></script>
	
  
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
			
			var url = "read/delete";
			url += "?r_no="+r_no;
			url += "&f_id=${f_id}";
			url += "&oldfile="+r_file;
			
			location.href = url;
			}
	}


	</script>
  <script type="text/javascript">
	
	function modal_update(r_no, f){
		
		
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
		

		
		$('#mtest2').show();
	}

 $(function(){

	 $('#mclose').click(function (e){
			e.preventDefault();
			$('#mtest2').hide();
	 });
	 
	 $('#u_updateresetbtn').click(function (e) {
			e.preventDefault();
			$('#mtest2').hide();
	 });
/* 
	 $('#ptest').click(function (e){ 
		 var msrc = jQuery('#ptest').attr("src");
		 jQuery("#modal_img").attr("src", msrc);
		 $('#mtest').show();
	 })

	 $('#pclose').click(function (e){
			e.preventDefault();
			$('#mtest').hide();
	 }); */
	 

     
      $('.review_file').click(function(e){
    	 if($(this).hasClass('review_file')){
    		 $(this).removeClass('review_file').addClass('review_file_large');
    	 }else if($(this).hasClass('review_file_large')){
    		 $(this).removeClass('review_file_large').addClass('review_file');
    	 }
     });  
	 
  });
</script>
        
  
  <script type="text/javascript">
  	function review(f_id){
  		var url = "${root}/review";
  		url += "?f_id="+f_id;
  		
  		location.href=url;
  	}
  	function booking(f_id){
  		var url = "${root}/order/order";
  		url += "?f_ids="+f_id;
  		url += "&amounts=1";
  		
  		location.href=url;
  	}
  	function bucket(f_id){
  		var url = "${root}/favorite/create";
  		url += "?f_id="+f_id;

  		var wr = window.open(url,"TEST","width=500,height=400");
  		wr.moveTo((window.screen.width-500)/2, (window.screen.height-400)/2);
  		
  	}
  	function create(){
  		var url = "${root}/member/agree";
  		
  		location.href = url;
  	}
  </script>
 
  
  
  <script src="${root}/festival/read/js/jquery.min.js"></script>
  <script src="${root}/festival/read/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${root}/festival/read/js/popper.min.js"></script>
  <script src="${root}/festival/read/js/bootstrap.min.js"></script>
  <script src="${root}/festival/read/js/jquery.easing.1.3.js"></script>
  <script src="${root}/festival/read/js/jquery.waypoints.min.js"></script>
  <script src="${root}/festival/read/js/jquery.stellar.min.js"></script>
  <script src="${root}/festival/read/js/owl.carousel.min.js"></script>
  <script src="${root}/festival/read/js/jquery.magnific-popup.min.js"></script>
  <script src="${root}/festival/read/js/aos.js"></script>
  <script src="${root}/festival/read/js/jquery.animateNumber.min.js"></script>
  <script src="${root}/festival/read/js/bootstrap-datepicker.js"></script>
  <script src="${root}/festival/read/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${root}/festival/read/js/google-map.js"></script>
  <script src="${root}/festival/read/js/main.js"></script>
    </body>
</html>