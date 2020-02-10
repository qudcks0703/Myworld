<%@page import="com.jsp.db.Board_DTO"%>
<%@page import="com.jsp.db.Board_DAO"%>
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
	int num=Integer.parseInt(request.getParameter("num"));
	Board_DAO bdao=Board_DAO.getInstance();
	Board_DTO dto=new Board_DTO();
	dto.setWriter(id);
	dto.setNum(num);
	bdao.delete(dto);
%>
<script>
	alert("게시글 삭제 성공");
	window.close();
</script>
</body>
</html>