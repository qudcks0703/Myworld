<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../logxx.jsp"></jsp:include>
	<%
		int num=Integer.parseInt(request.getParameter("num"));
	%>
		<h1>글 삭제</h1>
	<form action="Me_delete_ok.jsp">
			패스워드:<input type="text" name="pw"><br/>
				<input type="hidden" name="num" value="<%=num%>">
			<input type="submit" value="삭제">
	</form>
</body>
</html>