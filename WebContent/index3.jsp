<%@page import="com.jsp.db.Friend_DAO"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.db.MesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">

<style>
.nav-side-menu {
  overflow: auto;
  font-family: verdana;
  font-size: 12px;
  font-weight: 200;
  background-color: #2e353d;
  position: fixed;
  top: 0px;
  width: 300px;
  height: 100%;
  color: #e1ffff;
}
.nav-side-menu .brand {
  background-color: #23282e;
  line-height: 50px;
  display: block;
  text-align: center;
  font-size: 14px;
}
.nav-side-menu .toggle-btn {
  display: none;
}
.nav-side-menu ul,
.nav-side-menu li {
  list-style: none;
  padding: 0px;
  margin: 0px;
  line-height: 35px;
  cursor: pointer;
  /*    
    .collapsed{
       .arrow:before{
                 font-family: FontAwesome;
                 content: "\f053";
                 display: inline-block;
                 padding-left:10px;
                 padding-right: 10px;
                 vertical-align: middle;
                 float:right;
            }
     }
*/
}
.nav-side-menu ul :not(collapsed) .arrow:before,
.nav-side-menu li :not(collapsed) .arrow:before {
  font-family: FontAwesome;
  content: "\f078";
  display: inline-block;
  padding-left: 10px;
  padding-right: 10px;
  vertical-align: middle;
  float: right;
}
.nav-side-menu ul .active,
.nav-side-menu li .active {
  border-left: 3px solid #d19b3d;
  background-color: #4f5b69;
}
.nav-side-menu ul .sub-menu li.active,
.nav-side-menu li .sub-menu li.active {
  color: #d19b3d;
}
.nav-side-menu ul .sub-menu li.active a,
.nav-side-menu li .sub-menu li.active a {
  color: #d19b3d;
}
.nav-side-menu ul .sub-menu li,
.nav-side-menu li .sub-menu li {
  background-color: #181c20;
  border: none;
  line-height: 28px;
  border-bottom: 1px solid #23282e;
  margin-left: 0px;
}
.nav-side-menu ul .sub-menu li:hover,
.nav-side-menu li .sub-menu li:hover {
  background-color: #020203;
}
.nav-side-menu ul .sub-menu li:before,
.nav-side-menu li .sub-menu li:before {
  font-family: FontAwesome;
  content: "\f105";
  display: inline-block;
  padding-left: 10px;
  padding-right: 10px;
  vertical-align: middle;
}
.nav-side-menu li {
  padding-left: 0px;
  border-left: 3px solid #2e353d;
  border-bottom: 1px solid #23282e;
}
.nav-side-menu li a {
  text-decoration: none;
  color: #e1ffff;
}
.nav-side-menu li a i {
  padding-left: 10px;
  width: 20px;
  padding-right: 20px;
}
.nav-side-menu li:hover {
  border-left: 3px solid #d19b3d;
  background-color: #4f5b69;
  -webkit-transition: all 1s ease;
  -moz-transition: all 1s ease;
  -o-transition: all 1s ease;
  -ms-transition: all 1s ease;
  transition: all 1s ease;
}
@media (max-width: 767px) {
  .nav-side-menu {
    position: relative;
    width: 100%;
    margin-bottom: 10px;
  }
  .nav-side-menu .toggle-btn {
    display: block;
    cursor: pointer;
    position: absolute;
    right: 10px;
    top: 10px;
    z-index: 10 !important;
    padding: 3px;
    background-color: #ffffff;
    color: #000;
    width: 40px;
    text-align: center;
  }
  .brand {
    text-align: left !important;
    font-size: 22px;
    padding-left: 20px;
    line-height: 50px !important;
  }
}
@media (min-width: 767px) {
  .nav-side-menu .menu-list .menu-content {
    display: block;
  }
}
body {
  margin: 0px;
  padding: 0px;
}
</style>
</head>
<script>
function logout(){
	var a=confirm("로그 아웃 하시겠습니까?");
	if(a==true){
		window.location.href="/bb/member/Logout.jsp";
	}
	
	
}


</script>

<body>
<%
	if(session.getAttribute("sId")==null){
%>		
		<script type="text/javascript">
			alert("로그인 해주세요.")
			location.href="/bb/index.jsp";
		</script>
		
	<%}%>
<%
String id=(String)session.getAttribute("sId");  //null
Friend_DAO fdao=Friend_DAO.getInstance();
int f_count=fdao.count_friend(id);
String aa= request.getRequestURI();
int num =0;
if(request.getParameter("list")==null){
	num=0;
}else{
	num=Integer.parseInt(request.getParameter("list"));
}
%>
<div class="nav-side-menu">
    <div class="brand">
		<img src="/bb/img/main1.png" width="300px;" style="margin-top:10px; margin-bottom:20px; ">
    </div>
    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
        <div class="menu-list">
            <ul id="menu-content" class="menu-content collapse out">
            	<%if(aa.equals("/bb/index.jsp")){ %>
            	<li class="active">
                  <a href="/bb/index.jsp" style="color:#FFCD4A">
            	<%}else{ %>
                <li>
                  <a href="/bb/index.jsp">
                <%} %>
                	
                  <i class="fas fa-home"></i> 홈
                  </a>
                </li>
                <%if(aa.equals("/bb/board/All/All.jsp") || aa.equals("/bb/board/Me/Me.jsp") || aa.equals("/bb/board/Custom/Custom.jsp")){ %>
                <li data-toggle="collapse" data-target="#products" class="collapsede active">
                <a href="#" style="color:#FFCD4A">
                 <%}else{ %>
                <li data-toggle="collapse" data-target="#products" class="collapsede">
                  <a href="#">
                <%} %>
                  <i class="far fa-clipboard"></i> 게시판 <span class="arrow"></span></a>
                </li>
                
                <ul class="sub-menu collapse" id="products"> 
                	<%if(aa.equals("/bb/board/All/All.jsp")){ %>
	                    <li class="active"><a href="/bb/board/All/All.jsp">전체</a></li>
	                    <li><a href="/bb/board/Me/Me.jsp">나</a></li>
	                    <li><a href="/bb/board/Custom/Custom.jsp">좋아요</a></li>
                    <% }else if(aa.equals("/bb/board/Me/Me.jsp")){%>
	                    <li><a href="/bb/board/All/All.jsp">전체</a></li>
	                    <li class="active"><a href="/bb/board/Me/Me.jsp">나</a></li>
	                    <li><a href="/bb/board/Custom/Custom.jsp">좋아요</a></li>
                    <%}else if(aa.equals("/bb/board/Custom/Custom.jsp")){ %>
	                    <li><a href="/bb/board/All/All.jsp">전체</a></li>
	                    <li><a href="/bb/board/Me/Me.jsp">나</a></li>
	                    <li class="active"><a href="/bb/board/Custom/Custom.jsp">좋아요</a></li>
                    <%}else{ %>
	                    <li><a href="/bb/board/All/All.jsp">전체</a></li>
	                    <li><a href="/bb/board/Me/Me.jsp">나</a></li>
	                    <li><a href="/bb/board/Custom/Custom.jsp">좋아요</a></li>
                    <%} %>
                </ul>
                
				<%if(aa.equals("/bb/friend/Friend.jsp")){ %>
	                <li data-toggle="collapse" data-target="#service" class="collapsed active">
	                <a href="#" style="color:#FFCD4A"><i class="fa fa-users fa-lg"></i> 친구 
                <%}else{ %>
	                <li data-toggle="collapse" data-target="#service" class="collapsed">
	                <a href="#"><i class="fa fa-users fa-lg"></i> 친구 
                <%} %>
                <%   if(f_count!=0){%>
                  		<span class="badge badge-danger"> <%=f_count %></span>
                  <% }%>
                <span class="arrow"></span></a>
                	</li>  
               	 <ul class="sub-menu collapse" id="service">
                
                 <%if(num==1){ %>
	                  	<li class="active"><a href="/bb/friend/Friend.jsp?list=1"> 친구 추가</a></li>
	                 	<li><a href="/bb/friend/Friend.jsp?list=2"> 친구 신청 목록</a>
                  <%if(f_count!=0){ %>
                 		<span class="badge badge-danger"> <%=f_count %></span>
                  <%}%>
                  		</li>
                  		<li><a href="/bb/friend/Friend.jsp?list=3"> 전체 친구 목록</a></li>
                  <%}
                 
                  else if(num==2){ %>
                  
                  <li><a href="/bb/friend/Friend.jsp?list=1"> 친구 추가</a></li>
                  <li class="active"><a href="/bb/friend/Friend.jsp?list=2"> 친구 신청 목록</a>
                  <%if(f_count!=0){ %>
                 	 <span class="badge badge-danger"> <%=f_count %></span>
                  <%}%>
                  </li>
                  <li><a href="/bb/friend/Friend.jsp?list=3"> 전체 친구 목록</a></li>
                  
                  <%}else if(num==3){ %>
                  <li><a href="/bb/friend/Friend.jsp?list=1"> 친구 추가</a></li>
                  <li><a href="/bb/friend/Friend.jsp?list=2"> 친구 신청 목록</a>
                  <%if(f_count!=0){ %>
                 	 <span class="badge badge-danger"> <%=f_count %></span>
                  <%}%>
                  </li>
                  <li class="active"><a href="/bb/friend/Friend.jsp?list=3"> 전체 친구 목록</a></li>
                  
                  <%}else{ %>
                  <li><a href="/bb/friend/Friend.jsp?list=1"> 친구 추가</a></li>
                  <li><a href="/bb/friend/Friend.jsp?list=2"> 친구 신청 목록</a>
                  <%if(f_count!=0){ %>
                 	 <span class="badge badge-danger"> <%=f_count %></span>
                  <%}%>
                  </li>
                  <li><a href="/bb/friend/Friend.jsp?list=3"> 전체 친구 목록</a></li>
                  <%} %>
                </ul>

                <li>
                  <a href="/bb/member/manage.jsp">
	                  <i class="fa fa-user fa-lg"></i> 회원정보
                  </a>
                </li>
                <%if(id!=null){%>
	                <%if(id.equals("admin")){ %>
	                <li>
	                  <a href="/bb/admin/admin.jsp">
		                  <i class="fas fa-smile"></i> 관리자 페이지
	                  </a>
	                </li>
	                <%} %>
                <%} %>
                 <li>
                  <a href="#" onclick="logout()" >
                  <i class="fas fa-hand-paper"></i> 로그아웃
                  </a>
                </li>
            </ul>
     </div>
     <div style="position:absolute; bottom:0px;">
	     <small style="color:#e1ffff">
	     <p>
	     	대표자명: 이동준 외 3명
	     </p>
	     <p>	
	     	주소:안알려줌 사업자등록번호:없음
	     </p>
	     <p> 
	     	본 사이트의 콘텐츠는 저작권법의 보호를 받는 바 무단 전재, 복사, 배포 등을 금합니다.
	     </p>
	     <p>	
	     	ⓒ 2017 MyWorld. ALL RIGHTS RESERVED
	     </p>
	     </small>
     </div>
</div>
</body>
</html>