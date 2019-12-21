<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="util" uri="/ELFunctions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">


function wrapWindowByMask(){
    //화면의 높이와 너비를 구한다.
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width();  
    
    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
    $("#mask").css({"width":maskWidth,"height":maskHeight});  
    //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
    
    $("#mask").fadeIn(0);      
    $("#mask").fadeTo("slow",0.7);    
    
    $(".window").show();
    
}

$(document).ready(function(){
	//검은 막 띄우기
    $(".openMask").click(function(e){
        e.preventDefault();
        wrapWindowByMask();
        $('.gBar').css("font-size", "16px");
    });
    //닫기 버튼을 눌렀을 때
    $(".window .close").click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $("#mask, .window").hide();  
    });       
    //검은 막을 눌렀을 때
    $("#mask").click(function () {  
        $(this).hide();  
        $(".window").hide();  
    });
});
// function sel(){
// 	var sel = document.getElementById("year_sel").value;
// 	$.ajax({
// 		type:'POST',
// 		url : 'list',
// 		data : {sel:sel},
// 		success : function(data){
// 			location.href='list';
// 		},
// 		error : function (request,status,error){
// 			console.log('code:' + request.status + "\n" + 'message : ' + request.responseText + "\n" + 'error:' + error);
// 		}
// 	});
// }

function graph(){
	
	var select_val =  $('#year_sel option:selected').val();
	
	<c:forEach var="dto" items="${data}">
	var month = ${dto.month}
	var month_total = ${dto.month_total}
	var i = month;
			if(${dto.year} == select_val){
				$('#gBar'+i).text(month_total);
			}
	</c:forEach>	
	
	<c:forEach var="dto" items="${data}">
			var month = ${dto.month};
			var month_total = ${dto.month_total}
			var i  = month;
					if(${dto.year}==select_val){
						var g =$('#gBar'+i).val(month_total);
						if(g.text() >= 1000000){
							$('#gBar'+i ).css("height" , "90%")
							$('#gBar'+i).css("background-color" , "#F781F3")
						}else if(g.text() >= 500000){
							$('#gBar'+i ).css("height" , "70%")
							$('#gBar'+i).css("background-color" , "#40FF00")
						}else if(g.text() >= 250000){
							$('#gBar'+i ).css("height" , "50%")
							$('#gBar'+i).css("background-color" , "#2E9AFE")
						}else if(g.text() >= 100000){
							$('#gBar'+i ).css("height" , "30%")
							$('#gBar'+i).css("background-color" , "#FF4000")
						}else if(g.text() < 100000){
							$('#gBar'+i ).css("height" , "10%")	
							$('#gBar'+i).css("background-color" , "orange")
						}						
					}
			</c:forEach>	
}

</script>
<style type="text/css">
.container{
	height: 900px;
}
.wrap {
	width: 1100px;
	margin: 0 auto;
}


.order_header h1 {
	font-size: 30px;
	font-weight: 700;
	padding: 20px 0;
	border-bottom: 1px solid #ebebeb;
}

.order_list {
	margin: 0 auto;
	text-align: center;
	border: 1px solid #000;
	width: 900px;
}

.order_list_th {
	background-color: #f2f2f2;
	border: 1px solid #000;
	padding: 10px 0;
	font-weight: 700;
	text-align: center;
}

.order_list td {
	border: 1px solid #000;
	padding: 15px 0;
}

.btn_div {
	text-align: right;
	margin-right: 100px;
	margin-bottom: 40px;
}

.btn_c {
	padding: 15px 20px;
	color: #fff;
	background-color: #2E64FE;
	border-radius: 30px;
	border: none;
}

.form-inline {
	margin-left: 650px;
	padding: 20px 0;
}

.btn_c {
	margin: 20px 0;
}

.sum_h1 {
	font-size: 20px;
	font-weight: 700;
	float: left;
	padding: 25px 0;
	margin-left: 100px;
}

#sum {
	color: #FF4000;
}
/* 	딤처리 */
#mask {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}
/* 팝업으로 뜨는 윈도우 css  */
.window {
	display: none;
	position: absolute;
	left: 50%;
	top: 400px;
	margin-left: -500px;
	width: 1100px;
	height: 600px;
	background-color: #f0f0f0;
	z-index: 10000;
}

.pop_p1 {
	font-size: 30px;
	font-weight: 700;
	padding-top: 60px;
	margin-bottom: 20px;
}

.pop_table {
	border: 1px solid #000;
	width: 500px;
	margin: 0 auto;
	text-align: center;
}

.pop_table th {
	padding: 20px 0;
	border: 1px solid #000;
	background-color: #F2F2F2;
}

.pop_table td {
	padding: 20px 0;
	border: 1px solid #000;
}

.pop_p2 {
	margin-top: 40px;
}

.pop_btn {
	margin: 0 auto;
	text-align: center;
	padding-top: 10px;
}

.del_btn {
	width: 30px;
	height: 30px;
	text-align: center;
}

.vGraph {
	padding-top: 150px;
	padding-bottom: 75px;
}

.vGraph ul {
	margin: 0;
	padding: 0;
	height: 200px;
	border: 1px solid #ddd;
	border-top: 0;
	border-right: 0;
	font-size: 11px;
	font-family: Tahoma, Geneva, sans-serif;
	list-style: none;
}

.vGraph ul:after {
	content: "";
	display: block;
	clear: both;
}

.vGraph li {
	float: left;
	display: inline;
	width: 8.3%;
	height: 100%;
	position: relative;
	text-align: center;
	white-space: nowrap;
}

.vGraph .gTerm {
	position: relative;
	display: inline-block;
	width: 100%;
	height: 20px;
	line-height: 20px;
	margin: 0 -100% -20px 0;
	padding: 200px 0 0 0;
	vertical-align: bottom;
	color: #767676;
	font-weight: bold;
	font-size: 20px;
}

.vGraph .gBar {
	position: relative;
	display: inline-block;
	width: 100%;
	margin: -1px 0 0 0;
	border: 1px solid #ccc;
	border-bottom: 0;
	background-color:orange;
	vertical-align: bottom;
}

.vGraph .gBar span {
	position: absolute;
	width: 100%;
	top: -20px;
	left: 0;
	color: #767676;
}

.year_div {
	text-align: center;
}

.year_sel {
	width: 100px;
	padding: 10px 0;
}

.sum {
	text-align: center;
	padding-top: 20px;
	font-size: 24px;
	font-weight: 700;
}
.close{
	background-color: #0e0e0e;
	color: #fff;
	position: absolute;
	padding: 12px 20px;
	box-sizing: border-box;
	border: none;
	margin-left: 20px;
}
.openMask{
	padding: 15px 20px;
	color: #fff;
	background-color: #FF4000;
	border-radius: 30px;
	border: none;
}
</style>
</head>
<body>
	<div class="container">
		<div class="wrap">
			<div class="order_header">
				<h1>결제 내역</h1>
			</div>
				<c:choose>
				<c:when test="${sessionScope.id == 'admin'}">
					<div>
						<h2 class="sum_h1">
							총액 : <span id="sum">${sum}</span>
						</h2>
					</div>
				</c:when>
				</c:choose>
			<form class="form-inline" action="list">
				<div class="form-group">
					<select class="form-control" name="col">
						<option value="m_id" <c:if test="${col=='m_id'}">selected</c:if>>회원아이디</option>
						<option value="f_id" <c:if test="${col=='f_id'}">selected</c:if>>상품아이디</option>
						<option value="total" <c:if test="${col=='total'}">selected</c:if>>전체출력</option>
					</select>
				</div>
				<div class="form-group">
					<input type="search" class="form-control" placeholder="검색어"
						name="word" value="${word}">
				</div>
				<button class="btn btn-default">검색</button>
			</form>
			<table class="order_list">
				<thead>
					<tr>
						<th class="order_list_th">번호</th>
						<th class="order_list_th">회원ID</th>
						<th class="order_list_th">상품명</th>
						<th class="order_list_th">상품ID</th>
						<th class="order_list_th">수량</th>
						<th class="order_list_th">금액</th>
						<th class="order_list_th">구매날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="7">등록된 글이 없습니다.</td>
						</c:when>
						<c:when test="${sessionScope.id == 'admin'}">
							<c:forEach var="dto" items="${list}">
								<tr>
									<td>${dto.o_no}</td>
									<td>${dto.m_id}</td>
									<td>${dto.f_title}</td>
									<td>${dto.f_id}</td>
									<td>${dto.p_amount}</td>
									<td>${dto.p_total}</td>
									<td>${dto.o_date}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
								<c:forEach var="dto" items="${list}">
								<c:if test="${sessionScope.id == dto.m_id}">
										<tr>
											<td>${dto.o_no}</td>
											<td>${dto.m_id}</td>
											<td>${dto.f_title}</td>
											<td>${dto.f_id}</td>
											<td>${dto.p_amount}</td>
											<td>${dto.p_total}</td>
											<td>${dto.o_date}</td>
										</tr>
								</c:if>
								</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<div>${paging}</div>
		
		
		
		
		
		
		<div class="btn_div">
		<c:choose> 
			<c:when test="${sessionScope.id == 'admin'}">
				<input type="button" value="그래프" class="openMask">
				<input type="button" value="돌아가기" class="btn_c" onclick="history.back()">
			</c:when>
			<c:otherwise>
				<input type="button" value="돌아가기" class="btn_c" onclick="history.back()">
			</c:otherwise>
		</c:choose>
		</div>
	</div>

	<div id="wrap">
		<div id="container">
			<div id="mask"></div>
			<div class="window">
				<h1 class="sum">통계 그래프</h1>
				<div class="vGraph">
					<ul>
						<li><span class="gTerm">1</span><span class="gBar" id="gBar1"><span></span></span></li>
						<li><span class="gTerm">2</span><span class="gBar" id="gBar2"><span></span></span></li>
						<li><span class="gTerm">3</span><span class="gBar" id="gBar3"><span></span></span></li>
						<li><span class="gTerm">4</span><span class="gBar" id="gBar4"><span></span></span></li>
						<li><span class="gTerm">5</span><span class="gBar" id="gBar5"><span></span></span></li>
						<li><span class="gTerm">6</span><span class="gBar" id="gBar6"><span></span></span></li>
						<li><span class="gTerm">7</span><span class="gBar" id="gBar7"><span></span></span></li>
						<li><span class="gTerm">8</span><span class="gBar" id="gBar8"><span></span></span></li>
						<li><span class="gTerm">9</span><span class="gBar" id="gBar9"><span></span></span></li>
						<li><span class="gTerm">10</span><span class="gBar" id="gBar10"><span></span></span></li>
						<li><span class="gTerm">11</span><span class="gBar" id="gBar11"><span></span></span></li>
						<li><span class="gTerm">12</span><span class="gBar" id="gBar12"><span></span></span></li>
					</ul>
				</div>
				<div class="year_div">
					<select class="year_sel" id="year_sel" onchange="graph()" >
						<option>선택</option>
						<option class="year_op" value="2019">2019년</option>
						<option class="year_op" value="2018">2018년</option>
					</select> 
					<input type="button" class="close" value="닫기">
				</div>
			</div>
		</div>
	</div>

</body>
</html>