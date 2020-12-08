<%@ page import="mybatis.guest.service.CommentService" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="comment" class="mybatis.guest.model.Comment">
    <jsp:setProperty name="comment" property="*"/>
</jsp:useBean>

<!-- 서비스의 메소드 호출  -->
<% CommentService.getInstance().modifyComment(comment); %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수정</title>
</head>
<body>

수정되었는지 확인해보세요. <br/>
<a href="listComment.jsp">목록보기</a>

</body>
</html>
