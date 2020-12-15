<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.board.model.*,mvc.board.command.*" %>

<%
	// 2. Service클래스에 write() 함수호출
	int articleId = (Integer) request.getAttribute("articleId");
	response.sendRedirect("/Board?cmd=view-page&id=" + articleId); // 쿼리스트링
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판글저장</title>
</head>
<body>
입력되었는지 확인해보시구염...<br/>
만일 안되어도..환장하지 맙시다 !!! ^^<br/><br/>
</body>
</html>