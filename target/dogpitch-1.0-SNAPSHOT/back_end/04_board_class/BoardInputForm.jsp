<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function () {
	$('#writeBtn').click(function () {
		// dbgytjd rjatk
		$('form[name="frm"]').submit();
	});
});
</script>
</head>
 <body>
	<h4> 게시판 글 쓰기 </h4><br/>
	나중에 이쁘게 만드시오 <br/><br/>
	<form name='frm' method='post' action="BoardSave.jsp">
	작성자 : <input name='writerName' type='text'><br/><br/>
	제  목 : <input name='title' type='text'><br/><br/>
	내  용 : <textarea name='content' rows='10' cols='40'></textarea><br/><br/>
	패스워드(수정/삭제시 필요) :
			 <input name='password' type='password'><br/><br/>
	<input id='writeBtn' type='button' value='작성'>
	<input type='reset' value='취소'>
	</form>

</body>
</html>