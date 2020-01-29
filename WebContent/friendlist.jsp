<%@page import="com.jsp.db.Friend_DAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

	h1{
		color:white
	}
	a{
		text-decoration: none;
		color:white;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="logxx.jsp"></jsp:include>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String id=(String)session.getAttribute("sId");	
	Friend_DAO fdao=Friend_DAO.getInstance();
	int list =0;
	if(request.getParameter("list")==null){
		list=1;
	}else{
		list=Integer.parseInt(request.getParameter("list"));
	}
	List listfriends = null;
	int result = 0;	
	int search = 0;%>

<body>
	
		<%if(list ==1){ //서로 친구 목록
				listfriends = fdao.list_firend(id);%>
				<h1> 친구 목록</h1>
				<% for(int i=0;i<listfriends.size();i++){%><br/>
					<%=i+1%>번째 친구:<a href="/Team/mes.jsp?friend=<%=listfriends.get(i)%>"><%=listfriends.get(i)%></a>
		<%		}
			}%>
		
</body>
</html>
</html>