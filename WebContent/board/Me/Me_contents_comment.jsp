<%@page import="com.jsp.db.Comment_DTO"%>
<%@page import="com.jsp.db.Comment_DAO"%>
<%@page import="com.jsp.db.Member_DTO"%>
<%@page import="com.jsp.db.Member_DAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.jsp.db.Board_DTO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:include page="/logxx.jsp"></jsp:include>
<%
	Comment_DAO dao=Comment_DAO.getInstance();
	Comment_DTO dto=new Comment_DTO();
	String id=request.getParameter("id");
	String comment=request.getParameter("comment");
	int board_num=Integer.parseInt(request.getParameter("board_num"));
	dto.setWriter(id);
	dto.setComment(comment);
	dto.setBoard_num(board_num);
	int result=dao.write(dto);
	if(result==1){%>
		<script type="text/javascript">
			window.location.href="/bb/board/Me/Me_contents.jsp?board_num=<%=board_num%>";
		</script>	
	<%}else{%>
		<script type="text/javascript">
			alert("댓글 달기 실패");		
			history.go(-1);
		</script>	
	
	<%} %>

		
</body>
</html>