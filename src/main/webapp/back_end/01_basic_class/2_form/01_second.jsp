<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("User"); // name이 parameter임
	String pw = request.getParameter("Pass");

	// 1. 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	// 2. 연결객체 얻어오기
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
	String user = "scott";
	String pass= "tiger";
	Connection con = DriverManager.getConnection(url, user, pass);
	// 3. sql 문장 만들기
	String sql = "SELECT * FROM emp WHERE ename = upper(?) AND empno = ?";
	// 4. 전송 객체 얻어오기
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, id);
	ps.setInt(2, Integer.parseInt(pw));
	// 5. 전송
	ResultSet rs = ps.executeQuery();

%> 
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 폼의 입력값 처리 </title>
</head>
<body>
	<% if (rs.next()) { %>
		해당 사원이 존재하여 로그인 성공하였습니다.
	<% } else { // end of if %>
		사원명이나 사번이 틀렸습니다.
	<% } // end of else %>
	<h2>폼의 입력값 넘겨받아 처리</h2>
	입력한 아이디 :  <%= id %><br/>
	입력한 패스워드 : <%= pw %>
</body>
</html>