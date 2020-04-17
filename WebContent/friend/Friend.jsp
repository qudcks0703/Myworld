<%@page import="com.jsp.db.Member_DTO"%>
<%@page import="com.jsp.db.Member_DAO"%>
<%@page import="com.jsp.db.Board_DAO"%>
<%@page import="com.jsp.db.Friend_DAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/index3.jsp"></jsp:include>
<meta charset="UTF-8">
	<!--link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"-->
	<link rel="stylesheet" href="/bb/friend/css_js/mes.css">
<title>Insert title here</title>
<style>

		body,html{
			background:gray;
			color: white;
		}
		
		.friend{
			margin:10px;
			color:white;
		}
		.clear{
			clear:both;
		}
		.card{
			height:700px;
		}
		.container-fluid{
			margin-left:300px;
		}
@media(max-width:767px){		
		.container-fluid{
			margin-left:0px;
		}
		
}
		
</style>

<jsp:include page="../logxx.jsp"></jsp:include>
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
	String search = request.getParameter("search_id");
%>
<body>
	
	<div class="container-fluid h-100">
		<div class="row justify-content-left" style="margin-top:50px">
			<div class="col-md-7 col-xl-7 chat">
				<div class="card mb-sm-3 mb-md-0 contacts_card">
					<%if(list ==1){%>
						<div class="card-header">
							<span><a class="friend" href="Friend.jsp?list=1" style="color:green">
								<i class="fas fa-user-plus fa-2x"></i>
							</span></a>
							<span><a class="friend" href="Friend.jsp?list=2">
								<i class="fas fa-user-check fa-2x"></i>
							</span></a>
							<span><a class="friend" href="Friend.jsp?list=3">
								<i class="fas fa-user-times fa-2x"></i>
							</span></a>
							<%if(search!=null){ %>
							<span ><a style="float:right" class="friend" href="Friend.jsp?list=1">
								<i class="fas fa-undo-alt fa-2x"></i>
							</span></a>
							<%} %>
							<br/><br/><form action="Friend.jsp" method="post">
								<div class="input-group">
									<input type="text" placeholder="친구 찾기" name="search_id" class="form-control search" style="height:50px;font-size:25px; ">
									<div class="input-group-prepend">
										<span class="input-group-text search_btn"><i class="fas fa-search fa-2x" onclick="document.forms[0].submit();"></i></span>
									</div>
								</div>
							</form>
						</div>
						<%listfriends = fdao.list_search(id, search);%>
						<div class="card-body contacts_body">
							<ui class="contacts">
								<% for(int i=0;i<listfriends.size();i++){%>
								<%
									Member_DAO mdao=Member_DAO.getInstance();
									Member_DTO mdto=(Member_DTO)mdao.getdto((String)listfriends.get(i));
								%>
								<li class="active">
									<div class="d-flex bd-highlight" style="height:70px">
										<div class="img_cont">
											<img src="/bb/member/member_img/<%=mdto.getFile()%>" class="rounded-circle user_img">
											<span class="online_icon"></span>
										</div>
										<div class="user_info">
											<span><a href ="#" onclick ="window.open('/bb/member/profile.jsp?search_id=<%=listfriends.get(i)%>','','width=500,height=500,top=300,left=500,scrollbars,resizable,toolbar=no')"><%=listfriends.get(i)%></a></span>
											<a style="color:white; margin-left:60px;" href="#" onclick="window.open('Friend_pop.jsp?id=<%=id%>&search_id=<%=listfriends.get(i)%>',
											'','width=500,height=200,top=300,left=500,scrollbars,resizable,toolbar=no')">
												<i class="fas fa-plus fa-2x"></i>
											</a>
											<p>온라인</p>
										</div>
									</div>
								</li>
								<%}%>
							</ui>
						</div>
					<div class="card-footer"></div>
					
					<%}else if(list==2){//나를 친추한 목록%>
						<div class="card-header">
								<span><a class="friend" href="Friend.jsp?list=1">
									<i class="fas fa-user-plus fa-2x"></i>
								</span></a>
								
								<span><a class="friend" href="Friend.jsp?list=2" style="color:green">
									<i class="fas fa-user-check fa-2x"></i>
								</span></a>
								
								<span><a class="friend" href="Friend.jsp?list=3">
									<i class="fas fa-user-times fa-2x"></i>
								</span></a>
						</div>
						<div class="card-body contacts_body">
							<ui class="contacts">
								<li class="active">
									<div class="d-flex bd-highlight">
									<%listfriends = fdao.list_firend_you(id);%>
										<% for(int i=0;i<listfriends.size();i++){%>
									<%
									Member_DAO mdao=Member_DAO.getInstance();
									Member_DTO mdto=(Member_DTO)mdao.getdto((String)listfriends.get(i));
									%>
										<div class="img_cont">
											<img src="/bb/member/member_img/<%=mdto.getFile()%>" class="rounded-circle user_img">
											<span class="online_icon"></span>
										</div>
										<div class="user_info">
										<ul style="float:left;margin-top:20px;margin-left:10px; list-style: none">
											<li style="float:left;margin-right:30px;">
												<span style="font-size:20px;margin-right:50px;"><a href ="#" onclick ="window.open('/bb/member/profile.jsp?search_id=<%=listfriends.get(i)%>','','width=500,height=200,top=300,left=500,scrollbars,resizable,toolbar=no')"><%=listfriends.get(i)%></a></span>
												<a style="color:white;margin-right:30px;" href="#" onclick="window.open('Friend_receive.jsp?id=<%=id%>&friend=<%=listfriends.get(i)%>',
												'','width=500,height=200,top=300,left=500,scrollbars,resizable,toolbar=no')"><i class="fas fa-check fa-2x"></i></a>
												<a style="color:white" href="#" onclick="window.open('Friend_ok_decline.jsp?id=<%=id%>&friend=<%=listfriends.get(i)%>',
												'','width=500,height=200,top=300,left=500,scrollbars,resizable,toolbar=no')"><i class="fas fa-times fa-2x"></i></a>
											</li>
										</ul>
										</div>
										<%}%>
									</div>
								</li>
							</ui>
						</div>
						<div class="card-footer"></div>
						<%}else if(list==3){%>
							<div class="card-header">
								<span><a class="friend" href="Friend.jsp?list=1">
									<i class="fas fa-user-plus fa-2x"></i>
								</span></a>
								<span><a class="friend" href="Friend.jsp?list=2">
									<i class="fas fa-user-check fa-2x"></i>
								</span></a>
								
								<span><a class="friend" href="Friend.jsp?list=3" style="color:green">
									<i class="fas fa-user-times fa-2x"></i>
								</span></a>
							</div>
							<div class="card-body contacts_body">
								<%listfriends = fdao.list_firend(id);%>
								<ui class="contacts">
									<%for(int i=0;i<listfriends.size();i++){%>
									<%
									Member_DAO mdao=Member_DAO.getInstance();
									Member_DTO mdto=(Member_DTO)mdao.getdto((String)listfriends.get(i));
									%>
										<li class="active">
											<div class="d-flex bd-highlight">
												<div class="img_cont">
													<img src="/bb/member/member_img/<%=mdto.getFile()%>" class="rounded-circle user_img">
													<span class="online_icon"></span>
												</div>
												<div class="user_info">
													<a style="color:white;" href="#" onclick ="window.open('/bb/member/profile.jsp?search_id=<%=listfriends.get(i)%>','','width=480,height=480,top=300,left=500,scrollbars,resizable,toolbar=no')"><span><%=listfriends.get(i)%></span></a>
													<p>온라인</p>
												</div>
											</div>
										</li>
									<%}%>
								</ui>
							</div>
						<div class="card-footer"></div>
						<%}%>
						</div>
					</div>
				</div>
			</div>
</body>
</html>
</html>