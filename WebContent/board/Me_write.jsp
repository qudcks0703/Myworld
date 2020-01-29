<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String id=(String)session.getAttribute("sId");%>
	<jsp:include page="../index2.jsp"></jsp:include>
	<jsp:include page="../logxx.jsp"></jsp:include>
<br/><br/><br/>
	<h1 align="center">글작성</h1>
	<form action="Me_write_ok.jsp" enctype="multipart/form-data" method="post">
		작성자:<input type="text" disabled="disabled" name="writer" value="<%=id%>">
		<input type="hidden" name="writer" value="<%=id%>"><br/>
		제목:<input type="text" name="title"><br/>
		파일:<input type="file" name="file"><br/>
		내용:<textarea rows="20" cols="20" name="content"></textarea><br/>
		<input type="submit" value="작성">
		<a href="Me.jsp"><button type="button">뒤로 가기</button></a>
	</form>

</body>
</html>