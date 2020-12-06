<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 고객관리 프로그램 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
	$('#input').click(function () {
		let param = {
			name : $('#name').val(),
			age : $('#age').val(),
			tel : $('#tel').val(),
			addr : $('#addr').val()
		}
		$.ajax({
			type : 'get',
			url : 'DataInput.jsp',
			data : param,
			success : function (result) {
				if (result.trim() == '1') alert("성공");
				else alert("입력 실패");

				$('input[type="text"]').val("");
			},
			error : function (err) {
				console.log(err);
			}
		});
		// 정상적인 통신
		//$('form[name="inForm"]').attr('action', 'DataInput.jsp');
		//$('form[name="inForm"]').submit();
	});

	$('#getter').click(function () {
		// ES6에서 비슷한 게 생겻음. 확인할 것.
		$('#listTable tr:nth-child(n+2)').detach();
		$.ajax({
			url : 'DataSelect.jsp',
			dataType : 'xml',
			success : function (result) {
				let person = $('person', result);
				person.each(function () {
					$('#listTable').append('<tr>');
					$('#listTable tr:last').append('<td>' + $('name', this).text() + '</td>');
					$('#listTable tr:last').append('<td>' + $('age', this).text() + '</td>');
					$('#listTable tr:last').append('<td>' + $('tel', this).text() + '</td>');
					$('#listTable tr:last').append('<td>' + $('addr', this).text() + '</td>');
					$('#listTable').append('</tr>')
				});
			},
		});
	});
})

</script>

</head>


<!-- <body> -->
<body>

<h2> 고객정보 입력 </h2>

<form name="inForm" method="get">
<table border = 1>
	<tr>
		<td width="80" align="center">Name</td>
		<td width="50" align="center">Age</td>
		<td width="100" align="center">Tel</td>	
		<td width="250" align="center">Addr</td>
	</tr>
	<tr>
		<td align="center"><input type="text" size="8" name="name" id="name"></td>
		<td align="center"><input type="text" size="4" name="age" id="age"></td>
		<td align="center"><input type="text" size="12" name="tel" id="tel"></td>
		<td align="center"><input type="text" size="30" name="addr" id="addr"></td>
	</tr>
	<tr>
		<td colspan="4" align="center"> 
			<input id="input" type="button" value="입력">
		</td>
	</tr>
</table>

<br>
<hr>

<h2> 고객정보 목록보기  </h2>
<table border='0' width="510"> 
	<tr>
		<td align="right"><input id="getter" type="button" value="가져오기"></td>
	</tr>
</table>
<table border = 1 id="listTable">
	<tr>
		<td width="80" align="center">Name</td>
		<td width="50" align="center">Age</td>
		<td width="100" align="center">Tel</td>	
		<td width="250" align="center">Addr</td>
	</tr>
</table>
<div id="myDiv"> </div>

</form>
</body>
</html>