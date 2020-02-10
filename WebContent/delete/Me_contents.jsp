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
	<%
		String id=(String)session.getAttribute("sId");
		int num=Integer.parseInt(request.getParameter("num"));
		Board_DAO bdao=Board_DAO.getInstance();
		Board_DTO bdto=bdao.getcontent(num);
		bdao.getLikes(num);
		bdao.hits(num);
	%>
<script>
	
	function like(){
			window.open('likes.jsp?num=<%=num%>','','width=500,height=150,top=300,left=500 ,scrollbars,resizable,toolbar=no');
	}
	
</script>
</head>
<body>
	<table>
		<tr>
			<td colspan="2"><b>제목:</b><%=bdto.getTitle() %></td>
		</tr>
		<tr>
			<td><b>글쓴이:</b><%=bdto.getWriter() %></td>
			<td><b>조회수:</b><%=bdto.getReadcount() %></td>
		</tr>
		<tr>
			<td><img src="upload/<%=bdto.getFile() %>" width="300" height="300"> </td>
			<td><%=bdto.getContent() %></td>
		</tr>
		<tr>
			<td>좋아요 :</td>
			<td><%=bdto.getLikes()%></td>
		</tr>
	</table>
	<%if(bdto.getWriter().equals(id)){%>
		<a href="Me_modify.jsp?num=<%=num%>"><button>글 수정</button></a>
		<a href="Me_delete.jsp?num=<%=num%>"><button>글 삭제</button></a>
	<%} %>
		<a href="#" onclick="return like()"><button>좋아요</button></a>
</body>
</html>