<%@page import="com.jsp.db.Member_DAO"%>
<%@page import="com.jsp.db.Likes_DTO"%>
<%@page import="com.jsp.db.Likes_DAO"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.db.Board_DTO"%>
<%@page import="com.jsp.db.Board_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html{
	background-color: gray;
	
}

.fix1{
 position:fixed;
 left:1125px; 
}
.content1{
	float:left;
	margin-left:340px;
}

@media (max-width:767px) {
	.fix1{
		position:fixed;
 		left:300px; 
	}
	.content1{
		float:left;
		margin-left:0px;
	}
}

</style>
</head>
<jsp:include page="/index3.jsp"></jsp:include>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/javascript" src="/bb/board/Css_js/jquery.smartPop.js"></script>
<link rel="stylesheet" href="/bb/board/Css_js/jquery.smartPop.css" />
<jsp:include page="/logxx.jsp"></jsp:include>
<body>
	<%
	String id=(String)session.getAttribute("sId");	
	%>
		<%
		Board_DAO bdao=Board_DAO.getInstance();
		int pcount=0;
		List list =null;
		%>
<%	Likes_DAO ldao=Likes_DAO.getInstance();
	List numlist=ldao.getlikedto(id); //현재 이안에 특정아이디가 누른 num값들 다들어있음
	list=bdao.getNumlist(id, numlist);
%> 
	<div class="content1">	
		<div class="card-header">
					<div class="input-group">
						<div class="input-group-prepend">
							<a href="/bb/board/Me/Me_write.jsp" style="color:white;"><i style="padding-top:10px;" class="fas fa-pencil-ruler fa-2x"></i></a>
						</div>
					</div>
				</div>
		<table>
		<%
				for(int i=0;i<Math.ceil((list.size()/4.0));i++){//12-> 3 11-> 2
		%>
				<tr>
			<%
				int b=(4*i)+4;
				if(b>list.size()){
					b=list.size();
				}
			%>	
				<%for(int j=(4*i);j<b;j++){ //j=0; j<4 // j=4 ; j<8 4567
					Board_DTO bdto=(Board_DTO)list.get(j); 
					%>
					<td><a href="#" onclick="$.smartPop.open({title: '스마트팝', width: 500, height: 500, url:'/bb/board/Me/Me_contents.jsp?board_num=<%=bdto.getNum()%>'})">
					<img style="margin:10px;margin-top:20px;" width="180" height="180" src="/bb/board/upload/<%=bdto.getFile()%>"></a></td>
				<%} %>
				</tr>
				<% }%>
	</table>
	</div>
	<div class="fix1">
		<iframe src="/bb/friend/friendlist.jsp" width="400" height="550" style="border: none"></iframe>	
	</div>
</body>
</html>