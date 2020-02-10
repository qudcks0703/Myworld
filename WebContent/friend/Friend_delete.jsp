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
	Friend_DAO fdao=Friend_DAO.getInstance();%>
	
	<script>
		
	
	</script>
	
	<%int result=fdao.friend_delete(id, friend);
	if(result==1){%>
		<script type="text/javascript">
			alert("친구 삭제 성공");
			window.close();
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert("친구 삭제 실패");
		</script>
	<%}%>
<body>
	
		
</body>
</html>
