<%@page import="com.jsp.db.Board_DTO"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.db.Board_DAO"%>
<%@page import="com.jsp.db.Member_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html{
		background-color: gray;
		
	}
	.content1{
		float:left;
		margin-left:340px;
	}
</style>
</head>
<jsp:include page="admin.jsp"></jsp:include>
<body>
<%
	Board_DAO bdao=Board_DAO.getInstance();
	List list= bdao.getlist();
%>
<div class="content1">
	<%
		for(int i=0;i<list.size();i++){
		Board_DTO bdto=(Board_DTO)list.get(i);
	%>
	<h3>작성자:<%=bdto.getWriter()%></h3>
	제목:<%=bdto.getTitle() %> 내용:<%=bdto.getContent()%>
	<a style="color:white" href="#" onclick="window.open('/bb/admin/admin_board_delete.jsp?id=<%=bdto.getWriter()%>&num=<%=bdto.getNum() %>','','width=400,height=200')">게시글 삭제</a>
	<hr/>
	<%} %>
</div>

</body>
</html>