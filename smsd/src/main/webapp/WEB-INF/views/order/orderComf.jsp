<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function list(){
		var url = "./list";
		
		location.href = url;
	}
</script>
<style type="text/css">
	.wrap{
		width : 1100px;
		margin: 0 auto;
		text-align: center;
	}
	.header{
		font-size: 30px;
		font-weight: 700;
		text-align: left;
		padding: 30px 0;
		border-bottom: 2px solid #000;
	}
	.header_text{
		padding: 200px 0;
	}
	.header_text h2{
		font-size: 30px;
		font-weight: 700;
		color:#2E9AFE;
		margin-bottom: 10px;
	}
	.header_text a{
		color: #000;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="wrap">
			<div class="header">
				<h1>주문완료</h1>
			</div>
			
			<div class="header_text">
				<h2>"감사합니다. 결제가 완료 되었습니다."</h2>
				<p>구매내역 확인하러 가기<a href="javascript:list()">클릭</a></p>
			</div>
		</div>
	</div>
</body>
</html>