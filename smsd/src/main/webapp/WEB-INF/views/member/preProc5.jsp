<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

			
		</div>
		<!-- mast head end -->
		<div id="mast-body">

			<div id="infoDiv" style="">
				<div class="container">
					<div class="section __half __zero __wide">						
						<div class="container">
							<h1 class="description" style="text-align: center">${str}</h1><br>
						</div>
					</div>
					<form class="form-horizontal" action="./회원가입.html" method="post"
						onsubmit="return send()" name="frm">
						<div class="section __half __center">
							<button type="button" class="ui-button __square-large __black"
								onclick="window.close()">확인</button>
							
						</div>
						</form>
				</div>
			</div>
		</div>
		
	</div>

</body>
</html>