<%@page import="com.jsp.db.Likes_DAO"%>
<%@page import="com.jsp.db.Likes_DTO"%>
<%@page import="com.jsp.db.Board_DTO"%>
<%@page import="com.jsp.db.Board_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../logxx.jsp"></jsp:include>
</head>
<body>
	
	<%
		Likes_DAO ldao=Likes_DAO.getInstance();
		int num=Integer.parseInt(request.getParameter("num"));
		String id=(String)session.getAttribute("sId");
		Likes_DTO ldto=new Likes_DTO();
		ldto.setId(id);
		ldto.setNum(num);
		
		ldao.insert(ldto);
		
		int count=ldao.getdto(ldto).getCount();
		if(count==0){
		count++;
		 ldao.updatelikes(ldto,count);
	%>
	<script>
		alert('좋아요를 누르셨습니다.');
		window.close();
	</script>
	<%}else{
		count--; 
		ldao.updatelikes(ldto,count);
		%>
	<script>
		alert('좋아요를 취소하셨습니다.');
		window.close();
	</script>
	<%} %>
</body>
</html>