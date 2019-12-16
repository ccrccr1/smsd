<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left:500px;
	top: 300px;
	width: auto;
	height: auto; /* Full height */
	
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
    padding-left: 10px;
    padding-top: 0;
    padding-bottom: 20px;
	border: 1px solid #888;
	width: auto; /* Could be more or less, depending on screen size */
	height: auto;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(function() {
	 
	
	    $("#updatemoney").click(function() {
	      $("#myModal").css({
	        "display": "block"
	      });
	    });
	 
	    $(".close").click(function() {
	      $("#myModal").css({
	        "display": "none"
	      });
	    });
	 
	    $("html").click(function(event) {
	      if (event.target.id === "myModal") {
	        $("#myModal").css({
	          "display": "none"
	        });
	      }
	    });
	 
	
	 
	});

</script>
<script type="text/javascript">
$(function() {
	 
	
	    $("#updatepasswd").click(function() {
	      $("#myModal2").css({
	        "display": "block"
	      });
	    });
	 
	    $(".close").click(function() {
	      $("#myModal2").css({
	        "display": "none"
	      });
	    });
	 
	    $("html").click(function(event) {
	      if (event.target.id === "myModal2") {
	        $("#myModal2").css({
	          "display": "none"
	        });
	      }
	    });
	 
	
	 
	});

</script>
<link rel="stylesheet"
	href="${root }/css/createcss/information.css" />
<link rel="stylesheet"
	href="${root }/css/createcss/layout.css" />
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<!-- mast head start -->
		<div id="mast-head">
			<div class="container">

				<h1 class="title" id="mastHeadTitle">마이페이지</h1>

			</div>
		</div>
		<!-- mast head end -->
		<form action="createproc" class="form-horizontal" method="post"
			name='frm' onsubmit="return inCheck(this)">
			<div id="mast-body">

				<div id="infoDiv" style="">
					<div class="container">
						<div class="section __half __zero __wide">
							<h3 class="subject __underline">
								<em>마이페이지</em>
							</h3>


							<div class="row">
								<div class="col-md">
									<label for="m_email">이메일 주소</label>
								</div>
								<div class="col-md">
									<div class="form-wrap __normal __x1">
										<div class="inner">
											<div class="ui-input">
												<input type="text" id="m_email" name="m_email" value="${dto.m_email }"
													title="이메일주소" readonly="readonly"> 
											</div>
										</div>

									</div>
								</div>

							</div>


							<div id="divOnlId" class="row">
								<div class="col-md">
									<label for="m_id">아이디</label>

								</div>
								<div class="col-md">
									<div class="form-wrap __normal __x1">
										<div class="ui-input">
											<input type="text" id="m_id" name="m_id" title="아이디" readonly="readonly"
											value="${dto.m_id }">
										</div>
									</div>
								</div>
							</div>
							<div id="divOnlId" class="row">
								<div class="col-md">
									<label for="m_money">충전된금액</label>
								</div>
								<div class="col-md">
									<div class="form-wrap __normal __x1">
										<div class="ui-input">
											<input type="text" id="m_money" name="m_money" title="금액" readonly="readonly"
											value="${dto.m_money }">
										</div>
											<button type="button" id="updatemoney" name="updatemoney" 
												class="ui-button __square-small __black" title="중복확인버튼">충전하기</button>										
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md">
									<label for="name">이름</label>
								</div>
								<div class="col-md">
									<div class="form-wrap __normal __x1">
										<div class="inner">
											<div class="ui-input">
												<input type="text" id="name" name="name" title="이름" readonly="readonly"
												value="${dto.m_name }">
											</div>
										</div>
									</div>
								</div>
							</div>



							<div class="row">
								<div class="col-md">
									<label for="user-office-0">휴대폰 번호</label>
								</div>
								<div class="col-md">
									<div class="form-wrap __phone">

										<div class="ui-input">
											<input type="tel" id="cellphoneNo2" name="cellphoneNo2"
												value="${dto.m_phone1 }" title="전화번호 첫 자리" readonly="readonly"> 
										</div>
										<div class="ui-input">
											<input type="tel" id="cellphoneNo2" name="cellphoneNo2"
												value="${dto.m_phone2}"  title="전화번호 가운데 자리" readonly="readonly"> 
										</div>
										<div class="ui-input">
											<input type="tel" id="cellphoneNo3" name="cellphoneNo3"
												value="${dto.m_phone3}" title="전화번호 뒷자리" readonly="readonly">
										</div>
									</div>
								</div>
							</div>


							<div class="row">
								<div class="col-md">
									<label for="home">주소</label>
								</div>
								<div class="col-md">
									<div class="form-wrap __post">
										<div class="inner postcode">
											<div class="ui-input" style="margin:0;">
												<input type="text" value="05484" id="sample6_postcode"
													title="우편번호" name="sample6_postcode" readonly="readonly"
													maxlength="6"  >
											</div>
										</div>
										<div class="inner">
											<div class="ui-input">
												<input type="text" value="서울시 용산구" id="sample6_address"
													name="sample6_address" readonly="readonly" title="상세주소 1"
													placeholder="상세주소1">
											</div>
										</div>
										<div class="inner">
											<div class="ui-input">
												<input type="text" id="sample6_detailAddress"
													name="sample6_detailAddress" value="코아빌딩" readonly="readonly"
													title="상세주소 2" placeholder="상세주소2">
											</div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md">
									<label for="year">생년월일</label>
								</div>
								<div class="col-md">
									<div class="form-wrap __date">
										<div class="ui-input">
											<input type="text" class="year"id="birthday1" name="m_birth" value="${dto.m_birth1 }년"
												maxlength="4" title="생년" readonly="readonly">
										</div>
										
										<div class="ui-input">
											<input type="text" class="month"id="birthday2" name="m_birth" value="${dto.m_birth2 }월"
												maxlength="4" title="생월" readonly="readonly">
										</div>														
										<div class="ui-input">
											<input type="text" class="day" id="birthday3" name="m_birth" value="${dto.m_birth3 }일"
												maxlength="4" title="생일" readonly="readonly">
										</div>										
									</div>
								</div>
							</div>

							
							<!-- </div> -->
						</div>
						<button type="button" class="ui-button __square-large __blue"
						onclick="location.href='${root }/updatemypage?id=${sessionScope.id}'">정보수정</button>
						<button type="button" class="ui-button __square-large __blue"
						 name="updatepasswd" id="updatepasswd">비밀번호 수정</button>
						<button type="button" class="ui-button __square-large __black"
						onclick="history.back()">거래내역</button>
						<button type="button" class="ui-button __square-large __black"
						onclick="location.href='${root}/favorite'">즐겨찾기</button>
						<button type="button" class="ui-button __square-large __black"
						onclick="location.href='${root}/iwrite?m_id=${sessionScope.id}'">내가 쓴 글</button>
					
						
					</div>
				</div>
			</div>
		</form>
	</div>
	<form action="${root }/updatemoney" method="post"> 
	<input type="hidden" name="m_id" value="${dto.m_id }"/>
	<input type="hidden" name="m_money" value="${dto.m_money }"/>
	    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
        
      <div class="modal-content">
        <span class="close">&times;</span>    
                                                                
			<div id="divOnlId" class="row">
				<div class="col-md">
					<label style="color: #8a8a8a; line-height: 34px; padding-right: 10px;" for="m_updatemoney">금액</label>
					</div>
					<div class="col-sm-2">
					<div class="form-wrap __normal __x1">
						<div class="ui-input">
						<input onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
						type="text" id="m_updatemoney" name="m_updatemoney" title="금액">
						</div>
						<button type="submit" id="updatemoney" name="updatemoney" 
						class="ui-button __square-small __black" title="출전버튼">충전하기</button>										
					</div>
				</div>
			</div>
	
      </div>
      </div>
      </form>
<form action="updatepasswd" class="form-horizontal" method="post"
			name='frm' onsubmit="return inCheck(this)">
      <div id="myModal2" class="modal">
      <div class="modal-content">
        <span class="close">&times;</span>    
                                                                
			<div id="divOnlId" class="row">
				<div class="col-sm-2">
				<div class="form-wrap __normal __x1">
				<div class="col-md">
					<label style="color: #8a8a8a; line-height: 34px; padding-right: 10px; " for="m_passwd">현재 비밀번호</label>
				</div>
					<div class="inner">
						<div class="ui-input">
						<input 	type="password" id="m_passwd" name="m_passwd" title="현재비밀번호">
						</div>
					</div>
				<div class="col-md">
					<label style="color: #8a8a8a; line-height: 34px; padding-right: 10px; " for="m_updatepasswd">변경비밀번호</label>
				</div>
					<div class="inner">
						<div class="ui-input">
						<input 	type="password" id="m_updatepasswd" name="m_updatepasswd" title="변경할비밀번호">
						</div>
					</div>
				<div class="col-md">
					<label style=" color: #8a8a8a; line-height: 34px; padding-right: 10px;" for="m_repasswd">재확인비밀번호</label>
				</div>
					<div class="inner">
						<div class="ui-input">
						<input 	type="password" id="m_repasswd" name="m_repasswd" title="비밀번호확인">
						</div>
					</div>
			<div class="inner">
			<button type="submit" id="updatepw" name="updatepw" 
			class="ui-button __square-small __blue" title="비밀번호수정버튼">수정하기</button>											
			</div>
				</div>
				</div>
			</div>
      </div>
    </div>
    	</form>
</body>
<script type="text/javascript">
function inCheck(f) {
if (f.m_passwd.value.length == 0) {
	alert("현재 비밀번호를 입력하세요");
	f.m_passwd.focus();
	return false;
}
if (f.m_updatepasswd.value.length == 0) {
	alert("변경할 비밀번호를 입력하세요");
	f.m_updatepasswd.focus();
	return false;
}
if (f.m_updatepasswd.value.length == 0) {
	alert("비밀번호 확인을 입력하세요");
	f.m_repasswd.focus();
	return false;
}

if (f.m_updatepasswd.value != f.m_repasswd.value) {
	alert("비밀번호가 일치하지 않습니다.");
	f.m_updatepasswd.value = "";
	f.m_repasswd.value = "";
	f.m_updatepasswd.focus();
	return false;
}
}


</script>

</html>