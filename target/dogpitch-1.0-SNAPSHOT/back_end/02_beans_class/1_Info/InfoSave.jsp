<%@ page contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%--<%@ page import="InfoBean" %>--%>
<%--<jsp:useBean id="infoBean" class="InfoBean">--%>
<%--<jsp:setProperty name="infoBean" property="name" />--%>
<%--<jsp:setProperty name="infoBean" property="id" />--%>
<%--&lt;%&ndash; 한꺼번에 모든 속성처리&ndash;%&gt;--%>
<%--&lt;%&ndash;<jsp:setProperty name="infoBean" property="*" />&ndash;%&gt;--%>
<%--</jsp:useBean>--%>
<jsp:useBean id="infoBean" class="info.beans.InfoBean" >
	<jsp:setProperty name="infoBean" property="*"></jsp:setProperty>
</jsp:useBean>
<!DOCTYPE html>
<html>
<body>
<h2>  당신의 신상명세서 확인 </h2>
이   름  : <jsp:getProperty name="infoBean" property="name"/><br/>
주민번호 : <jsp:getProperty name="infoBean" property="id"/><br/>
성  별   : <jsp:getProperty name="infoBean" property="gender"/><br/>
맞습니까????
</body>
</html>