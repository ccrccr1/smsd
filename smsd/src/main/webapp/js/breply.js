console.log("*****Reply Module........");

var replyService = (function() {

	function getList(param, callback, error) {
		var b_no = param.b_no;
		var sno = param.sno;
		var eno = param.eno;
		
		$.getJSON("./reply/list/" + b_no + "/" + sno + "/" + eno + ".json",
				function(data) {
					// alert(data);
					if (callback) {
						callback(data); // 댓글 목록만 가져오는 경우
						// callback(data.replyCnt, data.list); //댓글 숫자와 목록을 가져오는
						// 경우
					}
				});

	}

	function getPage(param, callback, error) {

		$.ajax({
			type : 'get',
			url : "./reply/page",
			data : param,
			contentType : "application/text; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function add(reply, callback, error) {
		console.log("add reply...............");

		$.ajax({
			type : 'post',
			url : './reply/create',
			data : JSON.stringify(reply), //json을 string으로 변환해서 사용
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function get(br_no, callback, error){
		$.get("./reply/"+br_no+".json", function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	function update(reply, callback, error){
	
		$.ajax({
			type : 'put',
			url : './reply/' + reply.br_no,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			}, error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	function remove(param, callback, error) {
		$.ajax({
			type : 'delete',
			url : './reply/' + param.br_no + '/' + param.b_no + '/' + param.nPage + '.json',
			success : function(deleteResult, status, xhr) {
				if(callback){
					callback(deleteResult);
				}
			}, error : function(xhr, status, er) {
				if(error){
					error(er);
				}
			}
		});
	}

	;
	return {
		getList : getList,
		getPage : getPage,
		add : add,
		get : get,
		update : update,
		remove : remove
	}

})();