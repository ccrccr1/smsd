<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta charset="UTF-8">
<title>QnA 삭제</title>

<link type="text/css" rel="stylesheet" href="../css/layout.css">
<link type="text/css" rel="stylesheet" href="../css/information.css">
<link type="text/css" rel="stylesheet" href="../css/cert.css">
<link type="text/css" rel="stylesheet" href="../css/popup.css">
<link type="text/css" rel="stylesheet" href="../css/main.css">

<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/top.css">
<link rel="stylesheet" type="text/css" href="../css/footer.css">
<link rel="stylesheet" type="text/css" href="../css/h.css">

<style type="text/css">
  	#red {
  		color: red;
  		text-align: center;
  		font-size: 30px;
  	}
</style>

</head>
<body>

<div class="container">

<div class="wrapper">

<div class="h">
	<h1>QnA 삭제</h1>
</div>

<c:choose>
	<c:when test="${flag > 0}">
		<br><br><br><br><br><br><br><br>
		<p id="red">답글이 있어 삭제하지 못합니다.</p>
		<br><br><br><br><br><br><br><br>
		<div class="section __half __center">
			<button type="button" class="ui-button __square-large __black"
			onclick="history.back()">뒤로</button>
		</div>
	</c:when>
	
	<c:otherwise>
		<form action="delete" class="form-horizontal" method="post" 
				onsubmit="return input(this)">
		
		<input type="hidden" name="q_no" value="${param.q_no}">
		<input type="hidden" name="col" value="${param.col}">
		<input type="hidden" name="word" value="${param.word}">
		<input type="hidden" name="nowPage" value="${param.nowPage}">
		
		<div id="mast-body">
		
		<div id="infoDiv" style="">
			
			<div class="section __half __zero __wide h">
				
				<br><br>
				<p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다.</p>
			
			<br><br><br><br>
			<div class="section __half __center">
				<button type="submit" class="ui-button __square-large __black"
					>삭제</button>
				<button type="reset" class="ui-button __square-large __blue"
					>뒤로</button>
			</div>
			</div>
		
		</div>
		
		</div>
		</form>
	</c:otherwise>
	
</c:choose>

</div>
</div>

</body>
</html>