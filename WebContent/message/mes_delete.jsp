<%@page import="com.jsp.db.MesDTO2"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.db.MesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id=(String)session.getAttribute("sId");
	String friend=request.getParameter("friend");
	MesDAO mdao=MesDAO.getInstance();
	mdao.deletemes(id,friend);
	response.sendRedirect("/bb/friend/friendlist.jsp");
	%>
</body>
</html>