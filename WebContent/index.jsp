<%@page import="java.util.List"%>
<%@page import="com.jsp.db.MesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="index2.jsp"></jsp:include>
<%String id=(String)session.getAttribute("sId");
	if(id==null){%>
		<br/><br/><br/><br/>
	<h1 style="color:black">로그인 하세요</h1>
<%	}else{%>
		<jsp:include page="board/All.jsp"></jsp:include>
		<%
			MesDAO mes=MesDAO.getInstance();
			String friend= mes.check(id);
				if(friend!=""){%>
				<script>
					alert("<%=friend%>님께 메세지가 도착했습니다.");
				</script>				
	<%			}
	}%>
</body>
</html>