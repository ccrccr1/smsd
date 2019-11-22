<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/top.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<style type="text/css">
	.wrap {
	width: 1100px;
	margin: 0 auto;
	}
	.order_div{
		margin: 40px;
	}
	.order_header h1{
		font-size: 30px;
		font-weight: 700;
		margin-top: 40px;
		padding-bottom:20px;
		border-bottom: 2px solid #000;		
	}
	.order_list{
		margin: 0 auto;
		text-align: center;
		border: 1px solid #000;
		width: 900px;
	}
	.order_list_th{
		background-color: #f2f2f2;
		border: 1px solid #000;
		padding: 10px 0;
		font-weight: 700;
	}
	.order_list td{
		border: 1px solid #000;
		padding: 15px 0;
	}
	
	.btn_div{
		text-align: right;
		margin-right: 100px;
		margin-bottom: 40px;
	}
	.btn_c{
		padding : 15px 20px;
		color: #fff;
		background-color: #2E64FE;
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
			<div class="order_div">
				<table class="order_list">
					<thead>
					<tr>
						<th class="order_list_th">번호</th>
						<th class="order_list_th">상품명</th>
						<th class="order_list_th">금액</th>
						<th class="order_list_th">구매 수단</th>
						<th class="order_list_th">구매 날짜</th>
					</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>로지텍마우스</td>
							<td>20,000</td>
							<td>신용카드</td>
							<td>2019.11.15</td>
						</tr>
						<tr>
							<td>1</td>
							<td>로지텍마우스</td>
							<td>20,000</td>
							<td>신용카드</td>
							<td>2019.11.15</td>
						</tr>
						<tr>
							<td>1</td>
							<td>로지텍마우스</td>
							<td>20,000</td>
							<td>신용카드</td>
							<td>2019.11.15</td>
						</tr>
						<tr>
							<td>1</td>
							<td>로지텍마우스</td>
							<td>20,000</td>
							<td>신용카드</td>
							<td>2019.11.15</td>
						</tr>
						<tr>
							<td>1</td>
							<td>로지텍마우스</td>
							<td>20,000</td>
							<td>신용카드</td>
							<td>2019.11.15</td>
						</tr>
						<tr>
							<td>1</td>
							<td>로지텍마우스</td>
							<td>20,000</td>
							<td>신용카드</td>
							<td>2019.11.15</td>
						</tr>
						<tr>
							<td>1</td>
							<td>로지텍마우스</td>
							<td>20,000</td>
							<td>신용카드</td>
							<td>2019.11.15</td>
						</tr>
						<tr>
							<td>1</td>
							<td>로지텍마우스</td>
							<td>20,000</td>
							<td>신용카드</td>
							<td>2019.11.15</td>
						</tr>
					</tbody>
				</table>	
			</div>
			<div class="btn_div">
				<input type="button" value="돌아가기" class="btn_c">
			</div>
		</div>
	</div>
</body>
</html>