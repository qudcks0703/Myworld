<%@page import="com.jsp.db.Friend_DAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.jsp.db.Member_DAO"%>
<%@page import="com.jsp.db.Member_DTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile page</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<style>

			html, body{
				height: 100%;
				padding: 0;
				background: rgba(0,0,0,0.02) !important;
			}
			.card-header{
				background-image: url('http://www.latestseotutorial.com/wp-content/uploads/2016/12/love-dp-for-facebook.jpg') !important;
				padding: 0 !important;
				background-position: center;
				background-repeat: no-repeat;
				background-size: cover;
				height: 150px;
				position: relative;
				display: flex;
				justify-content: center;
				text-align:center;
			}
			.card{
				overflow: hidden;
				border:0 !important;
				width: 300px;
				box-shadow: 0px 0px 15px 1px;
				-webkit-box-shadow:0px 0px 15px 1px;
			}
			.profile_pic{
				position: absolute;
				bottom: -50px;
				height: 112px;
				width: 112px;
				padding: 5px;
				border: 2px solid #f39c12;
				border-radius: 50%;
			}
			.card-body{
				padding-top: 55px !important;
			}
			.profile_pic img{
				height: 100px;
				width: 100px;
				border-radius: 50%;
			}
			.name_container{
				display: flex;
				justify-content: center;
			
			}
			.name{
				font-size: 20px;
				font-weight: 700;
				color: gray;
				position: relative;
			}
			.name::after{
				font-family: "Font Awesome 5 Free";
				content: '\f058';
				position: absolute;
				right: -15px;
				top:0;
				font-size: 15px;
				font-weight: 700;
				color: #4CAF50;
			}
			.address{
				display: flex;
				justify-content: center;
				font-size: 12px;
				color: gray;
			}
			.follow{
				padding-top: 20px;
				display: flex;
				justify-content: center;
			}
			.follow_btn{
				background: #2196F3;
				padding: 7px;
				color: #fff;
				border-radius: 12px;
				cursor: pointer;
			}

			.follow_btn::before{
				font-family: "Font Awesome 5 Free";
				content: "\f234";
				font-weight: 600;
				margin-right: 5px;
			


			}
			.follow_btn:hover{
				background: #f39c12;
			}
			.info_container{
				padding-top: 20px;
				display: flex;
				justify-content: space-around;
				flex-direction: row;
			}
			.info{
				display: flex;
				flex-direction: column;
			}
			.info p:first-child{
				margin-bottom: 0;
				font-size: 12px;
				color: gray;
				text-transform: uppercase;
				text-align: center;
			}
			.info p:last-child{
				margin-bottom: 0;
				font-size: 20px;
				font-weight: 700;
				color: gray;
				text-transform: uppercase;
				text-align: center;
			}
			.card-footer{
				padding: 0 !important;
				background: #fff !important;
				display: flex;
				border-top: 0 !important;
			}
			.message{
				display: flex;
				justify-content: center;
				padding: 10px;
				width: 50%;
				text-transform: uppercase;
				background: #f39c12;
				color: #fff;
				cursor: pointer;
				border-bottom-right-radius: calc(0.25rem - 1px);
			}

			.message::before{
				font-family: "Font Awesome 5 Free";
				content: "\f27a";
				font-weight: 600;
				margin-right: 5px;
			}
		.view_profile{
				display: flex;
				justify-content: center;
				padding: 10px;
				width: 50%;
				text-transform: uppercase;
				background: #e74c3c;
				color: #fff;
				cursor: pointer;
				border-bottom-left-radius: calc(0.25rem - 1px);
				
			}
			.view_profile::before{
				font-family: "Font Awesome 5 Free";
				content: "\f406";
				margin-right: 5px;
				font-weight: 600;
			}

</style>
</head>
<%
	String search_id = request.getParameter("search_id");
	Member_DAO mdao=Member_DAO.getInstance();
	String id=(String)session.getAttribute("sId");
	Friend_DAO fdao=Friend_DAO.getInstance();
	int result=fdao.friend_check(id, search_id);
	Member_DTO mdto = (Member_DTO)mdao.getdto(search_id);
%>
<script>
	function friend_delete(){
		var a=confirm("친구를 삭제 하시겠습니까?");
		if(a==true){
			window.location.href="/bb/friend/Friend_delete.jsp?id=<%=id%>&friend=<%=search_id%>";
		}
	}
</script>
<body>
	<div class="container h-100">
			<div class="row h-100 justify-content-center align-items-center">
				<div class="card">
					<div class="card-header">
						<div class="profile_pic">
							<img src="/bb/member/member_img/<%=mdto.getFile()%>">
						</div>
					</div>
					<div class="card-body">
						<div class="d-lfex justify-content-center flex-column">
							<div class="name_container">
								<div class="name"><%=search_id%></div>
							</div>
							<div class="address"><%=mdto.getHome() %></div>
						</div>
						
						<%if(!id.equals(search_id)){ 
								if(result==0){
						%>
								<div class="follow">
									<div class="follow_btn" onclick="window.open('/bb/friend/Friend_pop.jsp?search_id=<%=search_id%>','','width=500,height=200,top=300,left=500,scrollbars,resizable,toolbar=no')">친구 신청</div>
								</div>
						<%		}else{%>
								<div class="follow">
									<div class="follow_btn" onclick="friend_delete()">친구 끊기</div>
								</div>
						<%		}
						}%>
						
						<div class="info_container">
							<div class="info">
								<p>친구 수</p>
								<p><%=mdao.getProfileFriendCount(search_id) %></p>								
							</div>
							<div class="info">
								<p>게시글 수</p>
								<p><%=mdao.getProfileBoardCount(search_id) %></p>						
							</div>			
						</div>
					</div>
					<div class="card-footer">
						<!-- <div class="view_profile">
							View profile
						</div>
						<div class="message">
							Message
						</div> -->
					</div>
				</div>
			</div>
		</div>
</body>
</html>