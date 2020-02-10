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
<style>
	html{
		background-color: gray;
		
	}
	
	.fix1{
		 position:fixed;
		 left:1125px; 
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
	Member_DAO mdao=Member_DAO.getInstance();
	List list= mdao.getAlldto();
	
%>
<div class="content1">
	<%for(int i=0;i<list.size();i++){ 
		Member_DTO mdto=(Member_DTO)list.get(i);
	%>
	<h3>ID:<%=mdto.getId()%></h3> 
	<a style="color:white;" href="#" onclick="window.open('/bb/admin/admin_users_delete.jsp?id=<%=mdto.getId()%>','','width=400,height=200')">아이디 삭제
	</a>
	<hr/>
	<%} %>
</div>
</body>
</html>