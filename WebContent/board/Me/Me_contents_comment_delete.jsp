<%@page import="com.jsp.db.Comment_DTO"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.db.Comment_DAO"%>
<%@page import="com.jsp.db.Board_DTO"%>
<%@page import="com.jsp.db.Board_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/logxx.jsp"></jsp:include>

</head>
<body>
	<%
		String id=(String)session.getAttribute("sId");
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		int num=Integer.parseInt(request.getParameter("num"));
		Comment_DAO cdao=Comment_DAO.getInstance();
		int result=cdao.delete(board_num,id,num); 
		if(result==1){%>
			<script>
				alert("댓글 삭제 성공");
				window.close();
			</script>
		<%}else{%>
			<script>
				alert("댓글 삭제 실패");
				window.close();
			</script>
		<%} %>

</body>
</html>