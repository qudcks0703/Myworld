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
<jsp:include page="../logxx.jsp"></jsp:include>
<%
	String id=(String)session.getAttribute("sId");
	String pw=request.getParameter("pw");
%>
	<%
		Member_DAO dao=Member_DAO.getInstance();
		Member_DTO dto=dao.getdto(id);
		String pw2=dto.getPw();
		if(pw.equals(pw2)){
			dao.delete(id);
		%>
			<script >
				alert('아이디 삭제 성공');
				location.href="Logout.jsp";
			</script>
		<%
		}else{%>
			<script type="text/javascript">
				alert('비밀번호가 틀렸습니다.')
				history.go(-1);
			</script>
		<%}%>

</body>
</html>