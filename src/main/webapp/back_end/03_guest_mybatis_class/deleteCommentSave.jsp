<%@ page import="mybatis.guest.service.CommentService" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="comment" class="mybatis.guest.model.Comment">
    <jsp:setProperty name="comment" property="*"/>
</jsp:useBean>
<%
    CommentService.getInstance().deleteComment(comment);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>추억이...삭제된 순간</title>
</head>
<body>
아.. 매정한 사람.......
<br><br><br><br><br><br>
<a href="listComment.jsp">목록보기</a>
</body>
</html>
