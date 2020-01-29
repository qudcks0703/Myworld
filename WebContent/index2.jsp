<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<style>		
		*{margin:0; padding: 0;}
		li{list-style : none;}
		a{text-decoration : none;}
		
		.wrapper{width: 1170px; margin: 0 auto;}
		.clearfix{content:''; display:block; clear :both;}
		
		header{height:75px; background-color: #EB7B39; border: 1px solid #EB7B39;
		position: fixed; width: 100%; z-index: 9999; top: 0; left: 0;}
		
		body{
			background-color: #F5B995;
			color: white;
		}
		
		h1{color: white; line-height: 75px float: left;}
		.menu{float: left;} 
		.menu li{float: left;}
		.menu a{line-height: 40px; color: white; padding: 0 25px; display: block;} // line-height: 글 높낮이 padding: 메뉴간의 거리조절
		

	</style>

</head>
<body>
		<%
		if(session.getAttribute("sId")==null){
		%>
		<header>
			<div class = "wrapper">
				<nav>
					<!--  <h1><img src="img/Koala.jpg" width="50" heigth="50" onclick="location.href='index.jsp'"></h1>-->
					<ul class = "menu">						
						<li><a  href="/pratice/member/Login.jsp">로그인</a></li>
						<li><a  href="/pratice/member/Form.jsp">회원가입</a></li>
					</ul>
					
				</nav>
			</div>
		</header>
		<%}
		else{
		%>
		<header>
			<nav class = "wrapper">
				<!-- <h1><img src="img/Koala.jpg" width="50" heigth="50" onclick="location.href='index.jsp'"></h1> -->
				<ul class="menu">
					<li><a href="/pratice/board/All.jsp">전체</a></li>
					<li><a href="/pratice/board/Me.jsp">나</a></li>
					<li><a href="/pratice/board/Custom.jsp">맞춤</a></li>
					<li><a href="/pratice/friend/Friend.jsp">친구</a></li>
					<li><a href="/pratice/member/manage.jsp">회원 정보</a></li>									
				</ul>
			</nav>
		</header>
	<%}%>
	<br/><br/>
</body>
</html>