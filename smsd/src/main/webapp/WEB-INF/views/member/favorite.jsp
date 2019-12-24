<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>                          
<meta charset="UTF-8">
<style type="text/css">
.p_btn_s{
		padding : 15px 20px;
		margin-top: 20px;
		color: #fff;
		background-color: #0092fa;
		border-radius: 0px;
		border: none;
	}
	.d_btn_c{
		padding : 15px 20px;
		margin-top: 20px;
		color: #fff;
		background-color: #333333;
		border-radius: 0px;
		border: none;
	}
	.u_btn_s{
		padding : 10px 10px;
		margin-top: 5px;
		color: #fff;
		background-color: #333;
		border-radius: 15px;
		border: none;
	}
	.wrapper2{
		width: 1100px;
		margin: 0 auto;
	}
	.like_h1{
	font-size: 250%;
	font-weight: bold;
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
	color: #666;
	border-bottom: 2px solid #ccc;
/* 	border-left: 10px solid #55555B; */
	text-height: 200%;
	padding: 10px 5px;
	margin: 5px 0;
	letter-spacing: 1px;
	word-spacing: 3px;
	}
</style>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/table.css">
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


function deleteAction(){
	  
	  var checkRow = '';
 	  
	  $("input[name='favoriteCheck']:checked" ).each (function (){
		    checkRow = checkRow + $(this).val()+"," ;
		  });
 	
 	
	  if(checkRow == ''){
	    alert("삭제할 대상을 선택하세요.");
	    return false;
	  }
	  console.log("### checkRow => {}"+checkRow);
	  
	  
	  var form = document.createElement("form");  

     
      form.setAttribute("method", "post");   //GET OR POST
      form.setAttribute("action", "favorite/delete");   //REQUEST URL

      var field = document.createElement("input");      

      field.setAttribute("type", "hidden");
      field.setAttribute("name", "f_ids");
      field.setAttribute("id", "f_ids");
      field.setAttribute("value", checkRow);                  
      
      form.appendChild(field);     

      document.body.appendChild(form);      	
	 
  	  if(confirm("즐겨찾기를 삭제 하시겠습니까?")){
  		 form.submit();       
 	  }
	}
	
	function payAction(){
		 
		  var checkRow = "";
		  var cnt = 0;
		  var amount = "";
		  var f_id = "";
		  
		  $( "input[name='favoriteCheck']:checked" ).each (function (){
			f_id = $(this).val();
		    checkRow = checkRow + f_id +",";
		    amount = amount + $("#amount"+f_id).val()+",";
		    cnt++;
		  });		 
		  //alert("amount: "+amount);
		  var form = document.createElement("form");
		     
	      form.setAttribute("method", "post");   //GET OR POST
	      form.setAttribute("action", "${root}/order/order");   //REQUEST URL

	      var field = document.createElement("input");       // 체크박스 value input
	      var field1 = document.createElement("input");      // 수량  value input

	      field.setAttribute("type", "hidden");
	      field.setAttribute("name", "f_ids");
	      field.setAttribute("id", "f_ids");
	      field.setAttribute("value", checkRow);    
	      
	      field1.setAttribute("type", "hidden");
	      field1.setAttribute("name", "amounts");
	      field1.setAttribute("id", "amounts");
	      field1.setAttribute("value", amount);                  
	      
	      form.appendChild(field);     
	      form.appendChild(field1);     

	      document.body.appendChild(form);

	      if(cnt < 1){
	    	  alert("1개이상 선택해야 합니다.");
	      		    	  
	      } else if (cnt > 5) {
	    	  alert("결제는 최대 5개까지 가능합니다.");
	      } else{
	      	form.submit();	    	  
	      }
	      
	}	
</script>

</head>
<body>
	
	<div class="wrapper2">
		<div class="h">
			<h1 class="like_h1">즐겨찾기</h1>
		</div>
		<br>
		<table style="width: 100%; align-content: center; ">
			<thead>
				<tr>
					<th style="width: 4px; display: table-cell; vertical-align: middle;"><input type="checkbox" name="allCheck" id="allCheck"></th>
					<th style="display: table-cell; vertical-align: middle;">축제사진</th>
					<th style="display: table-cell; vertical-align: middle;">축제명</th>
					<th style="display: table-cell; vertical-align: middle;">축제기간</th>
					<th style="display: table-cell; width:70px; vertical-align: middle;">즐겨찾기 날짜</th>
					<th style="width: 40px; display: table-cell; vertical-align: middle;">수량</th>
					<th style="width: 30px; display: table-cell; vertical-align: middle;">가격</th>					
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
						<input onclick="CountChecked(this)" type="checkbox" name="favoriteCheck" id="favoriteCheck" value="${dto.f_id}">					
					</td>
					<td style="display: table-cell; vertical-align: middle;"><img src="${dto.f_image}" width="150px" height="150px"/></td>
					<td style="width: 250px; display: table-cell; vertical-align: middle;">${dto.f_title}</td>
					<td style="display: table-cell; vertical-align: middle;">${dto.f_sdate} ~ ${dto.f_edate}</td>
					<td style="display: table-cell; vertical-align: middle;">${dto.f_date}</td>					
					<td style="width: 40px; display: table-cell; vertical-align: middle;">					
						<form action="favorite" method="post" class="form-horizantal" name="form1">
						
					
							<input type="number" min="1" max="20" name="amount" id="amount${dto.f_id}" value="${dto.f_amount}" style="width: 40px; text-align: center">
							
							<input type="hidden" name="f_id" id="f_id" value="${dto.f_id}">																																						
							<button class="u_btn_s" type="submit">변경</button>								
						</form>	
									
						</td>
						<td style="width: 100px; display: table-cell; vertical-align: middle;">
							<input type="text" name="price" id="price${dto.f_id}" value="${dto.f_price}원" readonly="readonly" style="width: 50px; text-align: center"/>
						</td>					
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>

			</tbody>

		</table>
		<br><br>
<!-- 	<div> -->
<%-- 	${paging} --%>
<!-- 	</div> -->
	<div style="text-align:center">
		<input class="p_btn_s" type="button" id="payBtn" name="payBtn" onclick="payAction()" value="결제하기">&nbsp;&nbsp;&nbsp;
		<input class="d_btn_c" type="button" id="deleteBtn" name="deleteBtn" onclick="deleteAction('${param.m_id}')" value="삭제하기">		
	</div>
	
	<br><br><br><br><br><br><br>	
	</div>	
	
</body>
</html>