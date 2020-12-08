<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="comment" class="mybatis.guest.model.Comment">
    <jsp:setProperty name="comment" property="*"/>
</jsp:useBean>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>삭제각</title>
</head>
<body>
<form name="frm" action="deleteCommentSave.jsp" >
    <table>
        <tr>
            <td>이 글번호를.. 삭제할건가요?</td>
            <td><input type="text" name="commentNo" size="3" value="<%=comment.getCommentNo()%>"/></td>
        </tr>
        <tr>
            <td>이렇게 내용을 썼어요 당신 ▷</td>
            <td>
                <textarea name="commentContent" rows="10" columns="40"><%=comment.getCommentContent()%>
                </textarea>
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="WARNING: 돌이킬 수 없음"/></td>
        </tr>
    </table>
</form>
</body>
</html>
