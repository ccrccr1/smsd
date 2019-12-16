<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

<link type="text/css" rel="stylesheet" href="../css/layout.css">


<link rel="stylesheet" type="text/css" href="../css/reset.css">
<link rel="stylesheet" type="text/css" href="../css/top.css">
<link rel="stylesheet" type="text/css" href="../css/footer.css">
<link rel="stylesheet" type="text/css" href="../css/h.css">

<style type="text/css">
  	#red {
  		color: red;
  	}
</style>

</head>
<body>

<div class="container">

<div class="wrapper">

<form action="delete" class="form-horizontal" method="post">

<input type="text" name="n_no" value="${param.n_no}">
<input type="hidden" name="col" value="${param.col}">
<input type="hidden" name="word" value="${param.word}">
<input type="hidden" name="nowPage" value="${param.nowPage}">

<div id="mast-body">

<div id="infoDiv">
	
	<div class="section __half __zero __wide h">
		<h1>공지사항 삭제</h1>
		
		<br><br>
		<p id="red" class="col-sm-offset-2 col-sm-6">삭제하면 복구할 수 없습니다.</p>
	
	<br><br><br><br>
	<div class="section __half __center">
		<button type="submit" class="ui-button __square-large __black"
			>삭제</button>
		<button type="button" class="ui-button __square-large __blue"
			onclick="history.back()">뒤로</button>
	</div>
</div>

</div>

</div>
</form>

</div>
</div>

</body>
</html>