<%@page import="mybatis.guest.model.Comment" %>
<%--
  Created by IntelliJ IDEA.
  User: sunny
  Date: 2020-12-08
  Time: 오후 4:19
  To change this template use File | Settings | File Templates.
--%>

<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="comment" class="mybatis.guest.model.Comment">
    <jsp:setProperty name="comment" property="*"/>
</jsp:useBean>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수정하기</title>
</head>
<body>
메세지를 수정해주세요.
<form name="frm" action="modifyCommentSave.jsp">
    <input type="hidden" name="regDate" value="<%=comment.getRegDate()%>">
    <table>
        <tr>
            <td>글번호</td>
            <td><input type="text" name="commentNo" size="3" value="<%=comment.getCommentNo()%>"/></td>
        </tr>
        <tr>
            <td>메세지</td>
            <td>
                <textarea name="commentContent" rows="10" columns="40"><%=comment.getCommentContent()%></textarea>
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="수정"/></td>
        </tr>
    </table>
</form>
</body>
</html>
