<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="member.beans.*" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    Member m = new Member();
    m.setName("박길자");
    m.setId("800808-1234567");
%>
이름 : ${m.name} / 번호 : ${m.id}<br/>
이름 :<%= m.getName() %>/ 번호 :<%= m.getId() %><br/>
<hr/>
<c:set var='m2' value='<%=m %>'/>
이름 : ${m2.name} / 번호 : ${m2.id}<br/>
<hr/>
</body>
</html>