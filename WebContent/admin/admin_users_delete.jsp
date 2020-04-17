<%@page import="com.jsp.db.Member_DTO"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.db.Member_DAO"%>
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
	String id=request.getParameter("id");
	Member_DAO mdao=Member_DAO.getInstance();
	mdao.delete(id);
%>
<script>
	alert("아이디 삭제 성공");
	window.close();
</script>
</body>
</html>