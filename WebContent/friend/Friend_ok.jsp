<%@page import="com.jsp.db.Friend_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="../logxx.jsp"></jsp:include>
<%
	request.setCharacterEncoding("UTF-8"); 
	String id = (String)session.getAttribute("sId");	
	String search_id = request.getParameter("search_id"); 
	Friend_DAO fdao=Friend_DAO.getInstance(); 
	int result = fdao.add_friend(id, search_id); 
	if(result == 1){%>
		<script>
			alert("친구 신청이 완료되었습니다.");
			window.close();
		</script>
	<%}else if(result == 0){ %>
		<script>
			alert("오류")
			window.close();
		</script>
	<%} %>



<body>

</body>
</html>