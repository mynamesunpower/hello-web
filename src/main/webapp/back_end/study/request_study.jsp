<%--
  Created by IntelliJ IDEA.
  User: Kosmo_19
  Date: 2020-12-01
  Time: 오후 6:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
클라이언트 IP = <%= request.getRemoteAddr() %> <br/>
요청정보길이 = <%= request.getContentLength() %> <br/>
요청정보인코딩 = <%= request.getCharacterEncoding() %> <br/>
요청정보 컨텐츠 타입 = <%= request.getContentType() %> <br/>
요청정보 프로토콜 = <%= request.getProtocol() %> <br/>
요청정보 전송방식 = <%= request.getMethod() %> <br/>
요청 URI = <%= request.getRequestURI() %> <br/>
컨텍스트 경로 = <%= request.getContextPath() %> <br/>
서버이름 = <%= request.getServerName() %> <br/>
서버포트 = <%= request.getServerPort() %>
</body>
</html>
