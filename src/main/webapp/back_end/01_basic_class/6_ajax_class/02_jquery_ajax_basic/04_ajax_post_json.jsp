<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
	<script>
$(function () {
	let param = { cate : 'it', name : 'hong'};
	$.ajax({
		type : "post",
		data : param ,
		dataType : 'text', // 우선은 text로 받고 나중에 json으로 받아줘
		url : '04_server.jsp',
		success : function (result) {
			//alert(result);
			let obj = {};
			obj = eval("("+result+")"); // text -> json 객체
			$('#cate').val(obj.second);
		},
		error : function () {

		}
	});
});
	</script>
</head>

<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


