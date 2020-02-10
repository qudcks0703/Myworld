<%@page import="com.jsp.db.MesDAO"%>
<%@page import="com.jsp.db.Member_DTO"%>
<%@page import="com.jsp.db.Member_DAO"%>
<%@page import="com.jsp.db.Friend_DAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<link rel="stylesheet" href="/bb/friend/css_js/mes.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../logxx.jsp"></jsp:include>
		<style>
		body,html{
			background:gray;
			color: white;
		}
		</style>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String id=(String)session.getAttribute("sId");	
	Friend_DAO fdao=Friend_DAO.getInstance();
	List listfriends = null;
	int result = 0;	
	String search=request.getParameter("search");
	Member_DAO mdao=Member_DAO.getInstance();
	MesDAO mes_dao=MesDAO.getInstance();
	%>

<body>
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100">
				<div class="col-md-4 col-xl-3 chat"><div class="card mb-sm-3 mb-md-0 contacts_card">
					<div class="card-header">
						<form action="friendlist.jsp">
							<div class="input-group">
								<input type="text" placeholder="친구 찾기" name="search" class="form-control search">
								<div class="input-group-prepend">
									<span class="input-group-text search_btn"><i class="fas fa-search" onclick="document.forms[0].submit()"></i></span>
								</div>
							</div>
						</form>
					</div>
					<div class="card-body contacts_body">
						<%if(search==null || search==""){ %>
							<%listfriends = fdao.list_firend(id);%>
							<ui class="contacts">
								<%for(int i=0;i<listfriends.size();i++){%>
								<% Member_DTO mdto= (Member_DTO)mdao.getdto((String)listfriends.get(i));
									int mes_count=mes_dao.count_mes(id, mdto.getId());
								%>
									<li class="active">
										<div class="d-flex bd-highlight">
											<div class="img_cont">
												<img src="/bb/member/member_img/<%=mdto.getFile() %>" class="rounded-circle user_img">
												<span class="online_icon"></span>
											</div>
											<div class="user_info">
												<a style="color:white;" href="/bb/message/mes.jsp?friend=<%=listfriends.get(i)%>"><span><%=listfriends.get(i)%></span></a>
												<%if(mes_count!=0){%>
												 <span class="badge badge-warning"><%=mes_count %></span>
												  <%}%>
												<p>온라인</p>
											</div>
										</div>
									</li>
								<%}%>
							</ui>
						<%}else{ %>
						<%listfriends = fdao.list_firend_search(id,search);%>
							<ui class="contacts">
								<%for(int i=0;i<listfriends.size();i++){%>
									<% Member_DTO mdto= (Member_DTO)mdao.getdto((String)listfriends.get(i));%>
									<li class="active">
										<div class="d-flex bd-highlight">
											<div class="img_cont">
												<img src="/bb/member/member_img/<%=mdto.getFile() %>" class="rounded-circle user_img">
												<span class="online_icon"></span>
											</div>
											<div class="user_info">
												<a style="color:white;" href="/bb/message/mes.jsp?friend=<%=listfriends.get(i)%>"><span><%=listfriends.get(i)%></span></a>
												<p>온라인</p>
											</div>
										</div>
									</li>
								<%}%>
							</ui>
						 <%} %>
					</div>
					<div class="card-footer"></div>
				</div></div>
			</div>
		</div>
		
</body>
</html>
</html>