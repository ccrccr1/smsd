<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>                          
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/top.css">
<link rel="stylesheet" type="text/css" href="css/table.css">
<link rel="stylesheet" type="text/css" href="css/footer.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<script>

$(document).ready(function(){

$("#allCheck").click(function() {
    //만약 전체 선택 체크박스가 체크된상태일경우
    if($("#allCheck").prop("checked")) {
        //해당화면에 전체 checkbox들을 체크해준다
        $("input[type=checkbox]").prop("checked", true);
    }
    // 전체선택 체크박스가 해제된 경우
    else {
        //해당화면에 모든 checkbox들의 체크를해제시킨다.
        $("input[type=checkbox]").prop("checked",false);
    } 
});
});

function deleteAction(id){
	  var id = id;
	  var checkRow = "";
	  $( "input[name='favoriteCheck']:checked" ).each (function (){
	    checkRow = checkRow + $(this).val()+"," ;
	  });
	  checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
	  	  
	  
// 	  $("#f_ids").val(checkRow);
	 
	  if(checkRow == ''){
	    alert("삭제할 대상을 선택하세요.");
	    return false;
	  }
	  console.log("### checkRow => {}"+checkRow);
	  
	  //alert(checkRow);	  
	 
	  
	  var form = document.createElement("form");  

     
      form.setAttribute("method", "post");   //GET OR POST
      form.setAttribute("action", "favorite/delete");   //REQUEST URL

      var field = document.createElement("input");
      var field2 = document.createElement("input");

      field.setAttribute("type", "hidden");
      field.setAttribute("name", "f_ids");
      field.setAttribute("id", "f_ids");
      field.setAttribute("value", checkRow);
      
      field2.setAttribute("type", "hidden");
      field2.setAttribute("name", "m_id");
      field2.setAttribute("id", "m_id");
      field2.setAttribute("value", id);      
      
      form.appendChild(field);
      form.appendChild(field2);

      document.body.appendChild(form);

      form.submit();	
	 
  	  if(confirm("즐겨찾기를 삭제 하시겠습니까?")){
  		 form.submit();       
 	  }
	}
	
	function payAction(f_id){
		 
		var checkRow = "";
		var checkRow_amount = "";
		var checkRow_price = "";
		var checkRow_total = "";				
		
		//$( "input[id='favoriteCheck${dto.f_id}']:checked" )
			
		$("#favoriteCheck"+f_id).each (function (){
			  checkRow_amount = checkRow_amount + $("#amount"+f_id).val()+"," ;
			  checkRow_price = checkRow_price + $("#price"+f_id).val()+"," ;
			});
		
	
		
		alert("amount: "+checkRow_amount+"price: "+checkRow_price);
		//alert("total: "+checkRow_total);
		
	}

</script>

</head>
<body>
	
	<div class="wrapper">
		<h1 style="font-size: 250%">즐겨찾기</h1>
		<br>
		<table style="width: 100%; align-content: center; ">
			<thead>
				<tr>
					<th style="width: 4px; display: table-cell; vertical-align: middle;"><input type="checkbox" name="allCheck" id="allCheck"></th>
					<th style="display: table-cell; vertical-align: middle;">축제사진</th>
					<th style="display: table-cell; vertical-align: middle;">축제명</th>
					<th style="display: table-cell; vertical-align: middle;">축제기간</th>
					<th style="display: table-cell; vertical-align: middle;">즐겨찾기 날짜</th>
					<th style="width: 40px; display: table-cell; vertical-align: middle;">수량</th>
					<th style="width: 50px; display: table-cell; vertical-align: middle;">가격</th>					
				</tr>
			</thead>
		<tbody>
		<c:choose>
			<c:when test="${empty list}">			
				<tr><td colspan="7">등록된 즐겨찾기가 없습니다.</td>
			</c:when>			
			<c:otherwise>
				<c:forEach var="dto" items="${list}" >				
					<tr>
					<td style="width: 4px; display: table-cell; vertical-align: middle;">
						<input type="checkbox" name="favoriteCheck" id="favoriteCheck${dto.f_id}" value="${dto.f_id}">					
					</td>
					<td style="display: table-cell; vertical-align: middle;"><img src="${dto.f_image}" width="150px" height="150px"/></td>
					<td style="width: 250px; display: table-cell; vertical-align: middle;">${dto.f_title}</td>
					<td style="display: table-cell; vertical-align: middle;">${dto.f_sdate} ~ ${dto.f_edate}</td>
					<td style="display: table-cell; vertical-align: middle;">${dto.f_date}</td>					
					<td style="width: 40px; display: table-cell; vertical-align: middle;">					
						<form action="favorite" method="post" class="form-horizantal" name="form1">
						
					
							<input type="number" min="1" max="100" name="amount" id="amount${dto.f_id}" value="${dto.f_amount}" style="width: 30px">
							
							<input type="hidden" name="f_id" id="f_id" value="${dto.f_id}">					
							<input type="hidden" name="m_id" id="m_id" value="${dto.m_id}">																																
							<button type="submit">변경</button>	
						</form>	
									
						</td>
						<td style="width: 50px; display: table-cell; vertical-align: middle;">
							<input type="text" name="price" id="price${dto.f_id}" value="${dto.f_price}" style="width: 40px"/>원
						</td>					
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>

			</tbody>

		</table>
		<br><br>
	<div>
	${paging}
	</div>
	<div>
		<button type="button" id="payBtn" name="payBtn" onclick="payAction('${dto.f_id}')">결제하기</button>
		<button type="button" id="deleteBtn" name="deleteBtn" onclick="deleteAction('${param.m_id}')">삭제하기</button>		
	</div>
	
	<br><br><br><br><br><br><br>	
	</div>	
	
</body>
</html>