<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	int articleId = (Integer)request.getAttribute("articleId");
	int result = (Integer)request.getAttribute("result");
	System.out.println(articleId + " " + result);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판글수정</title>
</head>
<body>

<%  // 게시글 수정이 성공적으로 되었다면 그 해당 게시글을 보여주는 페이지로 이동하고
	// 그렇지 않다면, "암호가 잘못 입력되었습니다"를 출력
	if (result != 0) {
		response.sendRedirect("/Board?cmd=view-page&id=" + articleId);
	}
	else { %>
	<strong>암호가 잘못 입력되었습니다.</strong>
<%	}
%>

</body>
</html>