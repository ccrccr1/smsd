<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/top.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script> 
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
    
    $(".p_btn_s").click(function (){
    	var url = "./orderComf";
		location.href = url;
    })
}

$(document).ready(function(){
    //검은 막 띄우기
    $(".openMask").click(function(e){
        e.preventDefault();
        wrapWindowByMask();
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
</script>
<style type="text/css">
	.order_head{
		font-size: 30px;
		font-weight: 700;
		padding: 30px 0;
		border-bottom: 2px solid #000;
	}
	.information{
		width: 100%;
		padding: 30px 0;
	}
	.information h2{
		margin-bottom: 10px;
		font-size: 24px;
		font-weight: 700;
	}
	.information img{
		width: 100px;
		height: 70px;
		float: left;
		padding: 0;
		vertical-align: middle;
	}
	.info_table{
		width: 100%;
	}
	 .info_table td, .info_table th{
		border: 1px solid #000;
		border-left: none;
	}
	.info_table th{
		padding: 10px 0;
		background-color: #F2F2F2;
	}
	.info_table th:nth-child(6){
		border-right: none;
	}
	.info_th1{
		width: 55%;
	}
	.info_td{
		text-align: center;
		vertical-align: middle;
	}
	.info_td:nth-child(6){
		border-right: none;
	}
	.info_td:nth-child(1){
		text-align: left;
		padding:10px 0;
	}
	.info_td a{
		text-decoration: none;
		color: #000;
	}
	.goods{
		padding: 25px 0;
		float: left;
	}
	.clearfix{ 
		content: ''; 
		dispaly: table; 
		clear: both;
	}
	.choice{
		height: 350px;
	}
	.choice h2{
		margin-bottom: 10px;
		font-size: 24px;
		font-weight: 700;
		border-bottom: 1px solid #000;
		padding: 20px 0;
	}
	.choice_wrap{
		background-color: #F2F2F2;
		height: 300px;
		width: 100%;
	}
	.cash{
		width: 80%;
		background-color: #fff;
		margin: 0 auto;
		padding: 20px 0 ;
	}
	.c_span{
		padding-left: 20px;
		padding-right: 30px;	
		font-weight: 700;
	}
	.frm_div{
		padding: 10px 0;
	}
	.radio{
		margin-right: 10px;
	}
	.payment{
		height: 500px;
		margin-bottom: 120px;
	}
	.payment h2{
		margin-bottom: 10px;
		font-size: 24px;
		font-weight: 700;
		border-bottom: 1px solid #000;
		padding: 20px 0;
	}
	.pay_wrap{
		background-color: #F2F2F2;
		height: 450px;
		width: 100%;
	}
	.pay_wrap2{
		width: 80%;
		background-color: #fff;
		margin: 0 auto;
		padding: 50px 0 ;
		text-align: center;
	}
	.money{
		color: #FF0000;
		font-size: 30px;
		font-weight: 700;
	}
	.money2{
		font-size: 24px;
	}
	.money_p{
		padding-top: 20px;
		padding-bottom: 15px;
		font-size: 18px;
		
	}
	.p_t_div{
		height: 100px;
		width: 420px;
		text-align:center;
		margin:0 auto;
		overflow: scroll;
		overflow-x:hidden;
	}
	.pay_table{
		margin: 0 auto;
		height: 100px;
		padding: 10px;
		
	}
	.pay_table tr, .pay_table td{
		font-size: 12px;
	}
	.pay_td{
		text-align: left;
	}
	.pay_tr td:nth-child(1){
		background-color: #F2F2F2;
		width: 30%;
		padding: 5px;
	}
	.p_btn_s{
		padding : 15px 20px;
		margin-top: 20px;
		color: #fff;
		background-color: #FF4000;
		border-radius: 30px;
		border: none;
	}
	.p_btn_c{
		padding : 15px 20px;
		margin-top: 20px;
		color: #fff;
		background-color: #2E64FE;
		border-radius: 30px;
		border: none;
	}
	
/* 	딤처리 */
	#mask {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0;
	} 
/* 팝업으로 뜨는 윈도우 css  */ 
.window{
    display: none;
    position:absolute;  
    left:50%;
    top:800px;
    margin-left: -500px;
    width: 1000px;
    height:400px;
    background-color:#FFF;
    z-index:10000;  
 	}
	.pop_p1{
		font-size: 30px;
		font-weight: 700;
		padding-top: 60px;
		margin-bottom: 20px;
	}
	.pop_table{
		border : 1px solid #000;
		width: 500px;
		margin : 0 auto;
		text-align: center;
	}
	.pop_table th{
		padding: 20px 0;
		border: 1px solid #000;
		background-color: #F2F2F2;
	}
	.pop_table td{
		padding: 20px 0;
		border: 1px solid #000;
	}
	.pop_p2{
		margin-top: 40px;
	}
	.pop_btn{
		margin: 0 auto;
		text-align: center;
		padding-top: 10px;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="wrapper" >
			<div class="order">
			<div class="order_head">
				<h1>주문서</h1>
			</div>
			<div class="information">
				<h2>1.주문상품정보</h2>
				<table class="info_table clearfix" >
					<tr>
						<th class="info_th1">상품정보</th>
						<th>주문번호</th>
						<th>구매수량</th>
						<th>가격</th>	
						<th>구매날짜</th>											
					</tr>
					<tr class="clearfix">
						<td class="info_td"><img src="image/logo.jpg"><a href="#"><span class="goods">f_title</span></a></td>					
						<td class="info_td"><p>f_id</p></td>					
						<td class="info_td"><p>수량</p></td>					
						<td class="info_td"><p>f_price</p></td>					
						<td class="info_td"><p>sysdate</p></td>												
					</tr>
				</table>
			</div>
			
			<div class="choice">
				<div class="choice_wrap">
					<h2>2.결제수단 선택</h2>
					<div class="cash">
					<form action="" class="choice_frm">
						<div class="frm_div">
							<label><span class="c_span">신용/체크카드</span>
								<input type="radio" class="radio" name="pay_rull">신용/체크카드
							</label>
						</div>
						<hr>
						<div class="frm_div">
							<label><span class="c_span">온라인</span>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;<input type="radio" name="pay_rull"  class="radio" >계좌이체
							</label>
						</div>
						<hr>
						<div class="frm_div">
							<label><span class="c_span">기타</span>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="pay_rull" class="radio" >휴대폰 결제
							</label>
						</div>
					</form>
					</div>
				</div>
				
				
			</div>
				<div class="payment">
					<div class="pay_wrap">
					<h2>3.결제하기</h2>
						<div class="pay_wrap2">
							<div class="m_div"><span class="money">24,000</span><span class="money2">원</span></div>
							<p class="money_p">원활한 결제를 위한 판매자에게 정보가 제공됩니다.</p>
							<div class="p_t_div">
								<table class="pay_table">
									<tr class="pay_tr">
										<td>제공받는자</td>
										<td>이름</td>
									</tr>
									<tr class="pay_tr">
										<td>상품</td>
										<td class="pay_td">설명:ㅁㄴㅇㄹㅇㅁㄴㄻㄴㅇㄹㄴㅁㅇㄹㄴㅁㅇㄹㄴㅁㅇㄹ</td>
									</tr>
									<tr class="pay_tr">
										<td>항목</td>
										<td class="pay_td">설명:ㅁㄴㅇㄹㅇㅁㄴㄻㄴㅇㄹㄴㅁㅇㄹㄴㅁㅇㄹㄴㅁㅇㄹ</td>
									</tr>
									<tr class="pay_tr">
										<td>보유기간</td>
										<td class="pay_td">설명:ㅁㄴㅇㄹㅇㅁㄴㄻㄴㅇㄹㄴㅁㅇㄹㄴㅁㅇㄹㄴㅁㅇㄹ
										dddddd
										ㅇㅇㅇㅇㅇㅁㄴㄹㄴㅇㅁㄻㄴ
										ㅁㄴㅇㄻㄴㅇㄹㄴㅁㅇㄹㄴㅁㄹㅇㅁㄴㅇ</td>
									</tr>
								</table>
							</div>
							<a href="#" class="openMask"><input type="button" class="p_btn_s" value="결제하기"></a>
							<input type="button" class="p_btn_c" value="취소하기">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id ="wrap"> 
        <div id = "container">  
            <div id="mask"></div>
            <div class="window">
                <p style="text-align:center;vertical-align:middle;" class="pop_p1">결제</p>
                <div>
                	<table class="pop_table">
                		<tr>
                			<th>결제 방법</th>
                			<th>금액</th>
                		</tr>
                		<tr>
                			<td>신용카드/체크카드</td>
                			<td>20,000</td>
                		</tr>
                	</table>
                </div>
                <div class="pop_btn">
	                <input type="button" class="p_btn_s" value="결제하기">
					<input type="button" class="close p_btn_c" value="취소하기">
				</div>
            </div>
        </div>
    </div>
</body>
</html>