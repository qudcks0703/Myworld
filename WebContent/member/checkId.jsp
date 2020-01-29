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
		Member_DAO dao=Member_DAO.getInstance();
		boolean result=dao.checkid(id);
		if(result==true){%>
		<script type="text/javascript">
			alert("아이디가 존재합니다");
			window.close();
		</script>
	<% }else{%>
		<script type="text/javascript">
			alert("사용 가능한 아이디입니다.");
			window.close();
		</script>
	<%} %>
</body>
</html>