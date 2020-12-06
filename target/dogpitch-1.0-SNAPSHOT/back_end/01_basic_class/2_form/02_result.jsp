<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: Kosmo_19
  Date: 2020-12-01
  Time: 오전 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 0. 한글 처리
    request.setCharacterEncoding("utf-8");

    // 1. 이전 화면에서 사용자 입력값을 얻어오기
    String name = request.getParameter("name");
    String gender = request.getParameter("gender").equals("male")?
            "남자" : "여자";
    String job;
    switch (request.getParameter("occupation")){
        case "programmer":
            job = "프로그래머";
            break;
        case "web designer":
            job = "웹디자이너";
            break;
        case "white hand":
            job = "백수";
            break;
        case "people":
            job = "사람";
            break;
        default:
            job = "없음";
            break;
    }
    String[] hobby = request.getParameterValues("hobby");
    if (hobby == null) {
        hobby = new String[1];
        hobby[0] = "취미가 없어요";
    }
%>

<html>
<head>
    <title>result</title>
</head>
<body>
<%
    // 2. 얻어온 입력값 출력
%>
이름: <%= name %> <br/>
성별: <%= gender %> <br/>
직업: <%= job %> <br/>
취미: <%= Arrays.toString(hobby) %>
</body>
</html>
