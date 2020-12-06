<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<title> 로그인창 </title>
</head>
<body>

<h3>로그인 확인하기 </h3> 
<form action="LoginService.jsp" method="get">
사원명: <input name='ename' type='text'><br/>
사번: <input name='empno' type='text'><br/>
<input type='submit' value='login'> 
</form>

</body>
</html>