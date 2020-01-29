<%@page import="com.jsp.db.Member_DTO"%>
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
<jsp:include page="../index2.jsp"></jsp:include>
<jsp:include page="../logxx.jsp"></jsp:include>

	<br/><br/><h1 style="color:black;">회원 삭제</h1>
	<br/>
		<form action="Delete_ok.jsp" method="post">
			패스워드:<input type="text" name="pw"><br/>
				<input type="submit" value="삭제">
		</form>	
		
		

</body>
</html>