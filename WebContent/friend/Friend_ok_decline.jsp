<%@page import="com.jsp.db.Friend_DAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../logxx.jsp"></jsp:include>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");	
	String friend=request.getParameter("friend");
	Friend_DAO fdao=Friend_DAO.getInstance();
	int result=fdao.no_friend(id, friend);
	if(result==1){%>
		<script type="text/javascript">
			alert("친구 거절 성공");
			window.close(); 
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert("친구 거절 실패");
			window.close();
		</script>
	<%}%>
<body>
	
		
</body>
</html>
