<%@page import="com.jsp.db.Member_DTO"%>
<%@page import="com.jsp.db.Member_DAO"%>
<%
	String id=(String)session.getAttribute("sId");//qudcks0703
	//String id=request.getParameter("id");
	String friend=request.getParameter("friend");//tmddh
	%>
<%@page import="com.jsp.db.MesDTO2"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.db.MesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- http-equiv="Refresh" content="5;url=mes.jsp?friend=//friend" -->	
<meta charset="UTF-8" >
<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<link rel="stylesheet" href="/bb/friend/css_js/mes.css?ver=1.11">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
		body,html{
			background:gray;
			color: white;
		}
</style>
</head>
<script>
	$(document).ready(function list(){
		$.ajax({
			type:"POST",
			url:"mes_list.jsp",
			data:{
				id:"<%=request.getParameter("id")%>",
				friend:"<%=friend%>"
			},
			success:function(data){
				console.log(data);
				var parsed=JSON.parse(data);
				var result=parsed.result;
				for(var i=0;i<result.length;i++){
					addChat(result[i].id, result[i].friend, result[i].mes);
				}
			}
		});
	});
	
	function chatlist(){
		$.ajax({
			type:"POST",
			url:"mes_list_max.jsp",
			data:{
				id:"<%=request.getParameter("id")%>",
				friend:"<%=friend%>"
			},
			success:function(data){
				console.log(data);
				var parsed=JSON.parse(data);
				var result=parsed.result;
				addChat(result[0].id, result[0].friend, result[0].mes);
			}
		});
	}
	
	function formCheck(){
		var name=$("#name").val();
		var mes=$("#mes").val();
		$.ajax({
			type:"POST",
			url:"mes_submit.jsp",
			data:{
				id:"<%=request.getParameter("id")%>",
				friend:name,
				mes:mes,
			},
			success:function(){
				chatlist();
				focus();
			}
		});
			$("#mes").val("");
	}
	
	
	function addChat(Id,Friend,Content){
		$('#a').append('<div class="d-flex justify-content-end mb-4">'+
					'<div class="msg_cotainer_send">'+Content+
					'<span class="msg_time_send">'+
					'</span>'+
					'</div>'+
					'<div class="img_cont_msg">'+
					'</div>'+
					'</div>'
		);
	}
	
	function focus(){
		document.forms[0].mes.focus();
		var a=document.getElementById("a");
		a.scrollTop=a.scrollHeight;
	}
	
</script>

<body onload="focus()">
	<% MesDAO mdao=MesDAO.getInstance();
	mdao.check_ok(id, friend);
	List list=mdao.selectmes(id,friend);
	int count=mdao.mes_count(id, friend);
	Member_DAO mbdao=Member_DAO.getInstance();
	Member_DTO mbdto1= mbdao.getdto(id);
	Member_DTO mbdto2= mbdao.getdto(friend);
	/**
						'<div class="d-flex justify-content-start mb-4">'+
					'<div class="img_cont_msg">'+
					'<img src="/bb/member/member_img/" class="rounded-circle user_img_msg">'+
					'</div>'+
					'<div class="msg_cotainer">'+
					'<span class="msg_time">></span>'+
					'</div>'+'</div>'
	*/
	%>
	<div class="container-fluid h-100">
			<div class="col-md-8 col-xl-6 chat">
				<div class="card">
					<div class="card-header msg_head">
						<div class="d-flex bd-highlight">
							<div class="img_cont">
								<img src="/bb/member/member_img/<%=mbdto2.getFile()%>" class="rounded-circle user_img">
								<span class="online_icon"></span>
							</div>
							<div class="user_info">
								<span  style="color:white;"><%=friend%>와의 대화</span>
								<p>메세지 <%=count %>통</p>
							</div>
						</div>
					</div>
					<div class="card-body msg_card_body" id="a">
					
					</div>
					<form >
						<div class="card-footer">
							<div class="input-group">
								<textarea name="mes" id="mes" class="form-control type_msg" placeholder="글적으셈" onkeypress="if(event.keyCode == 13) formCheck();"></textarea>
								<input type="hidden" id="name" name="friend" value="<%=request.getParameter("friend")%>">
								<div class="input-group-append">
									<span class="input-group-text send_btn"><i class="fas fa-location-arrow" onclick="formCheck()"></i></span>
								</div>
							</div>
						</div>
					</form>
					<div>
						<ul style="list-style:none;	margin:5px;">
							<li style="float:left; margin-right:200px;"><a href="/bb/friend/friendlist.jsp"><i class="fas fa-arrow-left" style="font-size:28px;color:white;"></i></a></li>
							<li style="float:left;"><a href="/bb/message/mes_delete.jsp?friend=<%=friend%>"><i class="far fa-times-circle" style="font-size:28px;color:white;"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<button onclick="chatlist()">z</button>
</body>
</html>