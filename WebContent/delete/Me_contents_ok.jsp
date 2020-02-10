<%@page import="java.sql.Timestamp"%>
<%@page import="com.jsp.db.Board_DTO"%>
<%@page import="com.jsp.db.Board_DAO"%>
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

%>
<jsp:useBean id="commen"   class = "com.jsp.db.Comment_DTO"/>
<jsp:setProperty property="*" name="commen"/>
<%
	commen.setReg(new Timestamp(System.currentTimeMillis()));
	Board_DAO bdao=Board_DAO.getInstance();
	bdao.write(commen);
	
	response.sendRedirect("/pratice/board/Me_contents.jsp");
%>

<body>

</body>
</html>