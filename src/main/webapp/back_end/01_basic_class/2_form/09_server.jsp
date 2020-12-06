<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="temp.*" %>
<%@ page import="java.util.zip.CheckedOutputStream" %>
<%
	// 0. 캐릭터 설정
	request.setCharacterEncoding("utf-8");

	// 1. 사용자 입력 값 얻어오기
	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");
	String deptno = request.getParameter("deptno");
	String job = request.getParameter("job");
	String sal = request.getParameter("sal");

	// 2. 위의 얻어온 입력값들을 EmpVO의 멤버로 지정
	EmpVO vo = new EmpVO();
	vo.setEmpno(Integer.parseInt(empno));
	vo.setEname(ename);
	vo.setDeptno(Integer.parseInt(deptno));
	vo.setJob(job);
	vo.setSal(Integer.parseInt(sal));
	// 3. EmpDao 객체를 getInstance()로 생성.
	EmpDao dao = EmpDao.getInstance();
	// 4. insertEmp() 호출
	dao.insertEmp(vo);

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 사원등록 </title>
</head>
<body>
	 성공적으로 입력되었지 DB에서 확인합니다.
</body>
</html>