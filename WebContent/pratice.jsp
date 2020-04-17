<%@page import="java.util.List"%>
<%@page import="com.jsp.db.MesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html,body{
		background-color: gray;	
	}

</style>

</head>
<body>
<%String id=(String)session.getAttribute("sId");
	if(id==null){%>
	<jsp:include page="/index4.jsp"></jsp:include>
<%	}else{%>
	<jsp:include page="/board/All/All.jsp"></jsp:include>
		<%
			MesDAO mes=MesDAO.getInstance();
			String friend= mes.check(id);
				if(friend!=""){%>
				<script>
					alert("<%=friend%>님께 메세지가 도착했습니다.");
				</script> 			
	<%			}%>
	<%}%>
</body>
</html>