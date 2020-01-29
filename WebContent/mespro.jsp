<%@page import="com.jsp.db.MesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	MesDAO dao =MesDAO.getInstance();
%>
<%
	String mes=request.getParameter("mes");
	String id=(String)session.getAttribute("sId");
	String friend=request.getParameter("friend");
	dao.insertArticle(id,friend,mes); 
	response.sendRedirect("mes.jsp?friend="+friend);
%>
<h1>값 넣기 성공</h1>
<body>

</body>
</html>