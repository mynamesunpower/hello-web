<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
<script type="text/javascript">
$(function () {
	let param = { cate: 'IT', name:'홍길동'};
	$.ajax({
		type : 'get', // get or post 전송 방식
		data : param, // 보내는 데이터
		url : '03_server.jsp', // 요청 서버 페이지
		dataType : 'xml', // 받을 데이터의 타입
		success : function (xmlData) {  // 성공시 연결 함수
			$('#cate').val($(xmlData).find('first').text());
		},
		error : function (err) { // 실패시 연결 함수
			alert('실패' + err);
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


