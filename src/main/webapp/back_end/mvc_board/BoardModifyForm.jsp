<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.board.model.*" %>
<%
	BoardVO article = (BoardVO) request.getAttribute("article");
%>   
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정하기</title>
</head>
 <body>
	<h4> 게시판 글 수정하기 </h4><br/>
	<form action="/Board?cmd=modify-save" name='frm' method='post'>
		<input type="hidden" name="articleId" value="<%=article.getArticleId()%>"/>
		제  목 : <input type="text" name="title" value="<%=article.getTitle()%>"> <br/><br/>
	패스워드(수정/삭제시 필요) :
			<input type='password' name="password"><br/><br/>
	내  용 : <textarea name='content' rows='10' cols='40'><%=article.getContent()%></textarea><br/><br/>

	<input type='submit' value='수정하기'>
	<input type='button' value='목록보기' onclick="window.location='/Board?cmd=list-page'">
	</form>

</body>
</html>