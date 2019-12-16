<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
	<title>모임 게시판</title>
	
	<!-- <link rel="stylesheet" type="text/css" href="../css/board.css"> -->
	
	<script type="text/javascript">
	
	function listb(){
		var url = "list";
		url += "?col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href = url;
	}

	function updateb(){
		var url = "update";
		url += "?b_no=${param.b_no}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href = url;
	}
	
	function replyb(){
		var url = "reply";
		url += "?b_no=${param.b_no}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href = url;
	}
	
	function deleteb(){
		
		if(confirm("게시글을 삭제하시겠습니까? ")){
			
		var url = "delete";
		url += "?b_no=${param.b_no}";
		url += "&oldfile=${dto.b_filename}";
		url += "&col=${param.col}";
		url += "&word=${param.word}";
		url += "&nowPage=${param.nowPage}";
		
		location.href = url;

		}
	}

	function filedown(filename){
		var url = "${pageContext.request.contextPath}/download";
		 url += "?dir=/storage";
		 url += "&filename="+filename;
		 location.href = url;
	}
	
	</script>
	
	<style type="text/css">
		.table{
			word-break : break-all; 
			
		}
		.b_img{
			width: 70%; height: 80%;
			margin: 30px;
		}
		#t-td{
			padding: 20px;
		}
	</style>
	
</head>

<body id="KOR">
	<div class="wrapper">
		
		<!-- mast head start -->
		<div id="mast-head">
			<div class="container">
				<h1 class="title" id="mastHeadTitle">모임 게시판</h1>
			</div>
		</div>
	
		<!-- mast head end -->
		
			<div id="infoDiv" style="">
				<div class="container">
					<div class="section __half __zero __wide">
						<h3 class="subject __underline">
						<br><br>
							<em>게시판 상세정보</em>
						</h3>
						
					</div>
				</div>
			</div>
			<div>
			<table class="table">
			<thead>
				<tr>
					<th style="width: 17%; display: table-cell; vertical-align: middle;">ID : ${dto.m_id}</th>
					<th style="width: 63%; display: table-cell; vertical-align: middle; text-align: center;">${dto.b_title} </th>
					<th style="width: 10%; display: table-cell; vertical-align: middle; ">${dto.b_date}</th>
					<th style="width: 10%; display: table-cell; vertical-align: middle;">조회수 : ${dto.b_cnt}</th>
				</tr>
			</thead>
			<tbody>
				<tr style="text-align: center;">
					<td colspan="4" id="t-td">
					<c:choose>
						<c:when test="${empty dto.b_filename }">
							${dto.b_content}
						</c:when>
						<c:otherwise>										
							<img class="b_img" src="${pageContext.request.contextPath}/storage/${dto.b_filename}">
							${dto.b_content}								
						</c:otherwise>
					</c:choose>	
					</td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: right; display: table-cell; vertical-align: middle;">
						<c:choose>
							<c:when test="${empty dto.b_filename }">
								첨부파일 : 없음
							</c:when>
							<c:otherwise>
								<a href="javascript:filedown('${dto.b_filename}')">첨부파일 : ${dto.b_filename}</a>
							</c:otherwise>
						</c:choose>					
					</td>
				</tr>
			</tbody>
			</table>
			</div>


			
			<div class="section __half __center">
			

			<c:if test="${sessionScope.id == dto.m_id}">
								
				<button type="button" class="ui-button __square-large __black" onclick="updateb()">수정</button>
				<button type="button" class="ui-button __square-large __black" onclick="deleteb()">삭제</button>
				
			</c:if>

			<button type="button" class="ui-button __square-large __black" onclick="replyb()">답변</button>
			<button type="button" class="ui-button __square-large __black" onclick="listb()">목록</button>
			
			<br><br>

			</div>

		
	

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-comments fa-fw"></i> 댓글
						<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글 쓰기</button>
					</div>

					<div class="panel-body">
						<ul class="chat list-group">
							<li class="left clearfix" data-br_no="12">
								<div>
									<div class="header">
										<strong class="primary-font">${dto.m_id}</strong> 
										<small class="pull-right text-muted">2019-05-12</small>
									</div>
									<p>댓글을 입력하세요.</p>

								</div>
							</li>
						</ul>
					</div>
					<div class="panel-footer"></div>
									
				</div>
			</div>
		</div>	
	</div><!-- container end -->
		
	 

	<!--   Modal   -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
	aria-hidden="true">
		<div class="modal-dialog">
			 <div class="modal-content">
				<div class="modal-header">
			 			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			 			<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			 	</div>
			 	<div class="modal-body">
			 			<div class="form-group">
			 				<label>내용</label>
							<textarea cols="10" rows="3" class="form-control" name='content'>New Reply!!!!</textarea>			 			
						</div>
			 	</div>
			 	<div class="modal-footer">
			 			<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
						<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
						<button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
						<button id='modalCloseBtn' type="button" class="btn btn-default">취소</button>
			 	</div>
			 </div>
			 <!--  /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal  -->

		<script type="text/javascript" src="${root}/js/breply.js"></script>
		
		
		
		 <script type="text/javascript">
		
		$(document).ready(function(){
			
			var b_no = "${b_no}";
			var sno = "${sno}";
			var eno = "${eno}";
			var replyUL = $(".chat");
			showList(); //댓글 목록 생성
			
			function showList(){
				replyService.getList({b_no:b_no, sno:sno, eno:eno}, function(list){
					var str = "";
					if(list==null||list.length==0){
						return;
					}
					
					for (var i = 0, len = list.length || 0; i < len; i++) {
						str +="<li class='list-group-item' data-br_no='"+list[i].br_no +"'>";
						str +="<div><div class='header'><strong class='primary-font'>"+ list[i].m_id +"</strong>"; 
						str +="<small class='pull-right text-muted'>"+list[i].br_date +"</small></div>";
						str +=replaceAll(list[i].br_content,'\n','<br>')+"</div></li>";
					}
					
					replyUL.html(str);
					showReplyPage(); // 댓글 목록 출력 후 보여줄 페이징
				});
			}
			
			function replaceAll(str, searchStr, replaceStr){
				return str.split(searchStr).join(replaceStr);
			}
			
			var nPage = '<c:out value="${nPage}"/>';
			var nowPage = '<c:out value="${nowPage}"/>';
			var colx = '<c:out value="${col}"/>';
			var wordx = '<c:out value="${word}"/>';
			var replyPageFooter = $(".panel-footer");
			
			var param = "nPage="+nPage;
			param += "&nowPage="+nowPage;
			param += "&b_no="+b_no;
			param += "&col="+colx;
			param += "&word="+wordx;
			
			function showReplyPage(){
				replyService.getPage(param,function(paging){
					var str ="<div><small class='text-muted'>"+paging+"</small></div>";
					replyPageFooter.html(str); 
				});		
			}
			
			var modal = $(".modal");
			var modalInputContent = modal.find("textarea[name='content']");
			
			var modalModBtn = $("#modalModBtn");
			var modalRemoveBtn = $("#modalRemoveBtn");
			var modalRegisterBtn = $("#modalRegisterBtn");
			
			$("#modalCloseBtn").on("click", function(e) { //cilick: event, function : handler
				modal.modal("hide");
			});
			
			$("#addReplyBtn").on("click", function(e) {
				if('${sessionScope.id}'==''){
					 if(confirm("로그인을 해야 댓글을 쓸 수 있습니다.")){
						var url = "../login";
						url += "?col=${col}";
				        url += "&word=${word}";
				        url += "&nowPage=${nowPage}";
				        url += "&nPage=${nPage}";
				        url += "&b_no=${b_no}";
				        url += "&rurl=../board/read";
				        location.href = url;
					}
				} else{
					
					modalInputContent.val("");
					modal.find("button[id !='modalCloseBtn']").hide();
					modalRegisterBtn.show();
					$(".modal").modal("show");
					
					
				}
			});
			
			$("#modalRegisterBtn").on("click", function(e) {
				if(modalInputContent.val()==''){
					alert("댓글을 입력하세요");
					return;
				}
				
				var reply = {
						br_content: modalInputContent.val(),
						m_id:'<c:out value="${sessionScope.id}"/>',
				        b_no:'<c:out value="${b_no}"/>'
				}
			
				//alert(reply.content);
				replyService.add(reply,function(result){
					alert(result);
					modal.find("input").val("");
					$(".modal").modal("hide");
					
					//showList(1);
					showList();
				});
			});
			
			$(".chat").on("click", "li", function(e) {
				var br_no = $(this).data("br_no");
				//alert(rnum)
				replyService.get(br_no, function(reply){
					modalInputContent.val(reply.br_content);				
					modal.data("br_no",reply.br_no);
					
					modal.find("button[id !='modalCloseBtn']").hide();
					
					if('${sessionScope.id}'==reply.m_id){
						modalModBtn.show();
						modalRemoveBtn.show();
					}
					$(".modal").modal("show");
				});
			});
			
			modalModBtn.on("click",function(e){
				var reply = {
						br_no:modal.data("br_no"), 
						br_content:modalInputContent.val()
				};
				//alert(reply.rnum);
				replyService.update(reply, function(result){
					alert(result);
					$(".modal").modal("hide");
					showList();
				});
			});
			
			modalRemoveBtn.on("click",function(e){
				var param  = {br_no:modal.data("br_no"), b_no:b_no, nPage:nPage};
				replyService.remove(param, function(result){
					location.href='./read?b_no=${b_no}&col=${col}&word=${word}&nowPage=${nowPage}&nPage='+result.nPage;
					alert(result.msg);
					$(".modal").modal("hide");
					showList();
				});
			});			
		});

		
		
		
	</script> 

</body>
</html>