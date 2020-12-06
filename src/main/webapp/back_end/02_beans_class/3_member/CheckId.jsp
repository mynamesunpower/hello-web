<%@ page import="member.beans.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("userId");
	MemberDao dao = MemberDao.getInstance();
	boolean check = dao.isDuplicatedId(id);
%>
<% if(check) {%>
	사용중인 아이디가 있습니다. 다시 입력하여 주십시오.
<%  } else { %>
	사용할 수 있는 아이디입니다.
<%  } %>
