<%@page import="com.jsp.db.Member_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원가입 처리 </title>
</head>
	<% request.setCharacterEncoding("UTF-8"); %> 
	<jsp:useBean id="member" class="com.jsp.db.Member_DTO"/>
	<jsp:setProperty property="*" name="member"/>
	<jsp:include page="../logok.jsp"></jsp:include>
	<% 
	Member_DAO dao =Member_DAO.getInstance();
	int result=dao.siunup(member);
	
	if(result==1){%>
	
	<script type="text/javascript">
		alert('가입을 축하합니다.');
		location.href="Login.jsp";
	</script>	
	<%}else{ %>
	<script type="text/javascript">
		alert('가입 실패');
		history.go(-1);
	</script>	
	<% }%>
<body>

</body>
</html>