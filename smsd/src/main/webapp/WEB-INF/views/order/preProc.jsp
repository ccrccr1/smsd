<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html>
<head>
<title>회원가입중</title>
<meta charset="utf-8">
<style type="text/css">
	.wrap {
	width: 1100px;
	margin: 0 auto;
	}
	.container{
		text-align: center;
		padding: 200px 0;
	}
	.well{
		margin-bottom: 20px;
	}
	.well h1{
		font-size: 24px;
		font-weight: 700;
		color: #FF0000;
		margin-bottom: 10px;
	}
	.well h2{
		font-size: 14px;
		font-weight: 400;
	}
	.btn{
		padding: 15px 20px;
		color: #fff;
		background-color: #2E64FE;
		border-radius: 30px;
		border: none;
		margin-bottom: 50px;
	}
</style>
</head>
<body>
	<div class="wrap">
		<div class="container">
			<div class="well well-lg">
				<h1>
					${str0}
				</h1>
				<h2>
					${str}
				</h2>
			</div>
			<div class="col-sm-offset-2 col-sm-8">
				<button onclick="history.back()" class="btn btn-default">다시시도</button>
			</div>
		</div>
	</div>
</body>
</html>