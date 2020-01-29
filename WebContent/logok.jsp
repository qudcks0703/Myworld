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
	if(session.getAttribute("sId")!=null){
%>		
		<script type="text/javascript">
			alert("로그인된 상태입니다.")
			location.href="/pratice/index.jsp";
		</script>
		
	<%}%>
</body>
</html>