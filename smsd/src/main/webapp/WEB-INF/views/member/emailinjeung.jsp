<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>

<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${root }/css/createcss/information.css" />
<link rel="stylesheet"
	href="${root }/css/createcss/layout.css" />

<script type="text/javascript">
var regex= /[^0-9]/g

function send(){
  if(document.frm.email_injeung.value != regex){ 
    alert('이메일인증을 해주세요.'); 
    document.frm.email_injeung.value = "";
    return false; // 서브밋 중지 
  }
  
}


</script>
<script type="text/javascript">
$(function() {
	 
	
	    $("#emailinjeung").click(function() {
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
<style type="text/css">
	.wrapper{
		height: 1200px;
	}
</style>
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

.emailimage{
background-image: url(/smsd/image/email.png);
    display: inline-block;
    width: 150px;
    background-size: cover;
    height: 150px;
}
</style>

<title>Insert title here</title>
</head>
<body>
	<div class="wrapper" style="height: 600px;">
		<!-- mast head start -->
		<div id="mast-head" style="margin-top: 200px;">
			<div class="container">

				<h1 class="title" id="mastHeadTitle">이메일 인증</h1>

			</div>
		</div>
		<!-- mast head end -->
		<div id="mast-body">

			<div id="infoDiv" style="">
				<div class="container">
					<div class="section __half __zero __wide">
						<div class="row __block __low">
						<div class="col-md" style="display:inline-block;">
							<ul>
							<li>
							<a class="emailimage" id="emailinjeung"></a>
							</li>
							</ul>
						</div>
						<div class="col-md"style="display:inline-block;   width: 160px;color: #8a8a8a;     padding-top: 40px; padding-left: 50px;">
							<ul style="width: 200px;">
								<li>
								    이메일인증을 하셔야 회원가입이 진행 됩니다. 	 인증번호를 보내기 위해
								</li>
								<li>
							
								 (옆 이미지를 클릭해주세요.)
								</li>
							</ul>
					<form class="form-horizontal" action="join_injeung${dice}" method="post"
						 name="frm">
						 <input type="hidden" name="tomail" value="${tomail }">
							<div id="divOnlId" class="row" style="    padding-top: 30px; width: 500px;">
								<div class="col-md">
									<div class="form-wrap __normal __x1">
										<div class="ui-input">
											<input type="text" id="email_injeung" name="email_injeung" title="넘버" required="required"
											placeholder="  인증번호를 입력하세요. " >
										</div>
											<button type="submit" id="email_injeung" name="email_injeung" 
												class="ui-button __square-small __blue" title="인증버튼">인증확인하기</button>										
									</div>
								</div>
							</div>
					
	
						</form>
						</div>
					</div>
					<div class="section __half __center">
							<button type="button" class="ui-button __square-large __black"
								onclick="history.back()">이전</button>
								</div>
				</div>
			</div>
		</div>
		
	</div>
	</div>
		   <div id="myModal" class="modal">
 
      <!-- Modal content -->
        
      <div class="modal-content">
        <span class="close">&times;</span>    
         <form action="auth.do" method="post">                                                       
			<div id="divOnlId" class="row">
				<div class="col-md">
					<label style="color: #8a8a8a; line-height: 34px; padding-right: 10px;" for="email_injeung">이메일</label>
					</div>
					<div class="col-sm-2">
					<div class="form-wrap __normal __x1">
						<div class="ui-input">
						<input 	type="email" id="e_mail" name="e_mail" title="이메일">
						</div>
						<button type="submit" id="email_injeung_btn" name="submit" 
						class="ui-button __square-small __black" title="이메일 인증버튼">인증번호 전송</button>										
					</div>
				</div>
			</div>
		</form>
      </div>
      </div>
</body>
</html>