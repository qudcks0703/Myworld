<%@page import="com.jsp.db.Member_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수정 ok</title>
</head>
<jsp:include page="../logxx.jsp"></jsp:include>
<% 
	
	request.setCharacterEncoding("UTF-8");	%>
	
	<jsp:useBean id="member" class="com.jsp.db.Member_DTO"/>
	<jsp:setProperty property="*" name="member"/>
<% 	
	String id = (String)session.getAttribute("sId");
	member.setId(id);

	Member_DAO dao = Member_DAO.getInstance();
	int result=dao.update(member);
%>
<body>
	<% if(result==1){ %>
		<script type="text/javascript">
			alert('정보수정 성공');
			location.href='../index.jsp';			
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert('정보 수정 실패');
			history.go(-1);
		</script>
	
		
	<%}%>
</body>
</html>