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
<title> 게시글 보기 </title>
</head>
<body>

	<h4> 게시판 글 보기 </h4><br/>
	<table border="1" bordercolor="red">
	<tr>
		<td> 제  목 : </td>
		<td><%= article.getTitle() %></td>
	</tr>
	<tr>
		<td> 작성자 : </td>
		<td><%= article.getWriterName() %></td>
	</tr>
	<tr>
		<td> 작성일자 : </td>
		<td><%= article.getPostingDate()%></td>
	</tr>
	<tr>
		<td> 내  용 : </td>
		<td><%= article.getContent() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="/Board?cmd=list-page">목록보기</a>
			<a href="/Board?cmd=reply-form&parentId=<%=article.getArticleId()%>">답변하기</a>
			<a href="/Board?cmd=modify-form&id=<%=article.getArticleId()%>">수정하기</a>
			<a href="/Board?cmd=delete-form&id=<%=article.getArticleId()%>">삭제하기</a>
		</td>
	</tr>
	</table>


</body>
</html>