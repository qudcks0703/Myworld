<%@page import="com.jsp.db.Board_DTO"%>
<%@page import="com.jsp.db.Board_DAO"%>
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
	String id=(String)session.getAttribute("sId");
	 int num=Integer.parseInt(request.getParameter("num"));
	Board_DAO bdao=Board_DAO.getInstance();
	Board_DTO bdto=bdao.getcontent(num);
%>
	<h1 align="center">글 수정</h1>
	<form action="Me_modify_ok.jsp" enctype="multipart/form-data" method="post">
		작성자:<input type="text" disabled="disabled" name="writer" value="<%=id%>">
		<input type="hidden" name="writer" value="<%=id%>"><br/>
		<input type="hidden" name="num" value="<%=num%>"><br/>
		제목:<input type="text" name="title" value="<%=bdto.getTitle()%>"><br/>
		파일:<input type="file" name="file" value="<%=bdto.getFile()%>"><br/>
		 <!-- //파일 어캐가져와용 ㅠㅠ 꾸루루ㅜㄱㄱ규-ㅠ-->
		내용:<textarea rows="20" cols="20" name="content" ><%=bdto.getContent()%></textarea><br/>
		<input type="submit" value="작성">
		<a href="Me_contents.jsp?num=<%=num%>"><button type="button">뒤로 가기</button></a>
	</form>
</body>
</html>