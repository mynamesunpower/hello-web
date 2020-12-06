<?xml version='1.0' encoding='UTF-8' ?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String result = "";
   result += request.getParameter("op1");
   result += request.getParameter("op2"); %>
<response>
	<op1>${param.op1}</op1>
	<opr>${param.opr}</opr>
		<op2>${param.op2}</op2>
	<result>${param.op1} + ${param.op2} = <%= result %></result>
</response>

