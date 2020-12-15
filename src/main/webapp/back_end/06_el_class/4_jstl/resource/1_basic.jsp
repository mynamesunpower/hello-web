<%--
  Created by IntelliJ IDEA.
  User: sunny
  Date: 2020-12-10
  Time: 오전 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<!-- 변수 선언 -->
<c:set var="gender" value="male"/> <!-- String gender = "male";-->

<!-- 제어흐름 -->
<c:if test="${gender eq 'male'}">당신은 남자입니다</c:if>
<c:if test="${gender eq 'female'}">당신은 여자입니다</c:if>
<hr/>

<!-- age 변수에 24 지정 age가 20이상이면 성인 출력-->
<c:set var="age" value="11"/>
<c:if test="${age ge 20}">당신은 성인이군요</c:if>
<hr/>

<c:choose>
    <c:when test="${age lt 10}">어린이</c:when>
    <c:when test="${age lt 20}">청소년</c:when>
    <c:otherwise>성인</c:otherwise>
</c:choose>
<hr/>

<c:set var="sum">0</c:set>
<c:forEach var="i" begin="1" end="100">
    <c:set var="sum">${sum + i}</c:set>
</c:forEach>
1~100까지의 합 : ${sum}
<hr/>
<c:forEach var="i" begin="1" end="100" step="2">
    <c:set var="sumOdd">${sumOdd + i}</c:set>
</c:forEach>
1~100까지의 홀수의 합 : ${sumOdd}
<hr/>
<c:forEach var="i" begin="2" end="100" step="2">
    <c:set var="sumEven">${sumEven + i}</c:set>
</c:forEach>
1~100까지의 짝수의 합 : ${sumEven}
<hr/>
<c:forEach var="i" begin="2" end="9">
    <c:forEach var="j" begin="1" end="9">
        ${i} * ${j} = ${i*j} //
    </c:forEach>
    <br>
</c:forEach>
<br>
<c:forEach var="j" begin="1" end="9">
    <c:forEach var="i" begin="2" end="9">
        ${i} * ${j} = ${i*j} //
    </c:forEach>
    <br>
</c:forEach>

</body>
</html>
