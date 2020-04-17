<%@page import="com.jsp.db.Likes_DAO"%>
<%@page import="com.jsp.db.Member_DTO"%>
<%@page import="com.jsp.db.Member_DAO"%>
<%@page import="com.jsp.db.Comment_DTO"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.db.Comment_DAO"%>
<%@page import="com.jsp.db.Board_DTO"%>
<%@page import="com.jsp.db.Board_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/logxx.jsp"></jsp:include>
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<link href="https://fonts.googleapis.com/css?family=Rokkitt" rel="stylesheet"> 
		<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> 
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="/bb/board/Css_js/Me_content_css.css?ver=1.11" />

</head>
<body>
	<%
		String id=(String)session.getAttribute("sId");
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		Board_DAO bdao=Board_DAO.getInstance();
		Board_DTO bdto=bdao.getcontent(board_num);
		bdao.getLikes(board_num);
		bdao.hits(board_num);
		Comment_DAO cdao=Comment_DAO.getInstance();
		int count=cdao.count_comment(board_num);
		List list=null;
		Member_DAO mdao=Member_DAO.getInstance();
		Member_DTO mdto1=(Member_DTO)mdao.getdto(bdto.getWriter());
		Member_DTO mdto2=(Member_DTO)mdao.getdto(id);
	%>
									
									
<script>
	function like(){
			window.open('/bb/board/like/likes.jsp?board_num=<%=board_num%>','','width=500,height=150,top=300,left=500 ,scrollbars,resizable,toolbar=no');
	}
	function delete1(){
			window.open('/bb/board/Me/Me_delete.jsp?board_num=<%=board_num%>','','width=500,height=150,top=300,left=500 ,scrollbars,resizable,toolbar=no');
	}
	function c_delete(){
			window.open('/bb/board/Me/Me_contents_comment_delete.jsp?board_num=<%=board_num%>','','width=500,height=150,top=300,left=500 ,scrollbars,resizable,toolbar=no');		
	}
	function profile(){
			window.open('/bb/member/profile.jsp?search_id=<%=bdto.getWriter()%>','','width=480,height=480,top=300,left=500,scrollbars,resizable,toolbar=no');
	}
	
	function check_comment(){
		var a=document.forms[0];
		if(!a.comment.value){
			alert("댓글을 입력해주세요.");
			return false;
		}
		document.forms[0].submit();
	}
	
</script>

<section class="hero">
	<div class="container">
		<div class="row">	
			<div class="col-lg-6 offset-lg-3" style="margin-top: 40px;">
				<div class="cardbox shadow-lg bg-white">
					<div class="cardbox-heading">
					
					  <!-- START dropdown-->
						<div class="dropdown float-right">
							<!--a href="#" onclick="window.close();"><i class="fas fa-times"></i></a-->
							<%if(id.equals(bdto.getWriter())){ %>
				   			<button class="btn btn-flat btn-flat-icon" type="button" data-toggle="dropdown" aria-expanded="false">
							<em class="fa fa-ellipsis-h"></em>
				   			</button>
				   			<div class="dropdown-menu dropdown-scale dropdown-menu-right" role="menu" style="position: absolute; transform: translate3d(-136px, 28px, 0px); top: 0px; left: 0px; will-change: transform;" id="z">
									<a class="dropdown-item" href="Me_modify.jsp?board_num=<%=board_num%>">게시물 수정</a>
									<a class="dropdown-item" href="#" onclick="delete1()">게시물 삭제</a>
				   			</div>
				   			<% }%>
			  			</div><!--/ dropdown -->
			  			
			  			<div class="media m-0">
			   				<div class="d-flex mr-3">
							<a href="#" onclick="profile()"><img class="img-fluid rounded-circle" src="/bb/member/member_img/<%=mdto1.getFile()%>" alt="User"></a>
			   				</div>
			   				<div class="media-body">
			   					<p class="m-0">제목:<%=bdto.getTitle() %></p>
			    				<p class="m-0"><a href='#' onclick = "profile()"><%=bdto.getWriter()%></a></p>
								<small><span><i class="icon ion-md-pin"></i><%=mdto1.getHome() %></span></small>
								<small><span><i class="icon ion-md-time"></i><%=bdto.getBoardReg() %></span></small>
			   				</div>
			 			 </div><!--/ media -->
			 		</div><!--/ cardbox-heading -->
			 		
			 		<div class="cardbox-item" style="text-align: center;">
			  			<img class="img-fluid" style="height:400px;" src="/bb/board//upload/<%=bdto.getFile()%>" alt="Image">
					</div><!--/ cardbox-item -->
					<div class="cardbox-base" style="text-align: center;">
					<p>
						<h4><em class="mr-5"><%=bdto.getContent() %></em></h4>
					</p>
					</div>
			 		<div class="cardbox-base">
				  		<ul class="float-right">
						   <li><a><i class="fa fa-comments"></i></a></li>
						   <li><a><em class="mr-5"><%=count %></em></a></li>
						   <li><a><i class="fas fa-eye"></i>
						   </a></li>
			   				<li><a><em class="mr-3"><%=bdto.getReadcount() %></em></a></li>
				  		</ul>
				  		<ul>
						   <li><a href="#" onclick="like()"><i class="fa fa-thumbs-up"></i></a></li>
						   <%
						   	Likes_DAO ldao=Likes_DAO.getInstance();
						   	list=ldao.wholike(board_num);
						   	System.out.println(list.size());
						   %>
						   <%for(int i=0;i<list.size();i++){ 
							   Member_DTO mdto3=(Member_DTO)mdao.getdto((String)list.get(i));
						   %>
						   		<li><a href="#"><img src="/bb/member/member_img/<%=mdto3.getFile()%>" class="img-fluid rounded-circle" alt="User"></a></li>
						   <%
						   		if(i==3){
						   			break;
						   		}
						   } %>
						   <li><a><span><%=bdto.getLikes() %></span></a></li>
				  		</ul>			   
			 		</div><!--/ cardbox-base -->
			 		
			 		<div class="cardbox-comments">
						<span class="comment-avatar float-left">
							<a href=""><img class="rounded-circle" src="/bb/member/member_img/<%=mdto2.getFile()%>" alt="..."></a>                            
						</span>
			  			<div class="search">
			  				<form action="Me_contents_comment.jsp" method="post">
			   					<input placeholder="댓글을 적으세요." type="text" name="comment">
			   					<input type="hidden" name="id" value="<%=id %>">
			   					<input type="hidden" name="board_num" value="<%=board_num %>">
			   					<button type="button" onclick="check_comment()"><i class="fas fa-pencil-alt"></i></button>
			   				</form>
			  			</div><!--/. Search -->
			 		</div><!--/ cardbox-like -->			  
				</div><!--/ cardbox -->
			</div><!--/ col-lg-6 -->
			<div class="col-lg-3">
				<div class="shadow-lg p-4 mb-2 bg-white author">
				<%
					list=cdao.select(board_num);
					for(int i=0;i<list.size();i++){
					Comment_DTO cdto=(Comment_DTO)list.get(i);
					Member_DTO mdto3=(Member_DTO)mdao.getdto(cdto.getWriter());
				%>
						<span class="comment-avatar float-left">
							<a href=""><img width="30px" height="25px"  class="rounded-circle" src="/bb/member/member_img/<%=mdto3.getFile()%>" alt="..."></a>                            
						</span>
					 	<p><%=cdto.getWriter()%>:<%=cdto.getComment() %>
					 	<%if(cdto.getWriter().equals(id)){ %> 
					 		<a href="#" onclick="window.open('/bb/board/Me/Me_contents_comment_delete.jsp?board_num=<%=board_num%>&num=<%=cdto.getNum()%>','','width=500,height=150,top=300,left=500 ,scrollbars,resizable,toolbar=no');" style="color:green"><i class="fas fa-eraser"></i></a>
					 		<%}%> 
					 		 
					 	</p>
					 	<%} %>
				</div>
			</div><!--/ col-lg-3 -->
			
		</div><!--/ row -->
	</div><!--/ container -->
</section>


</body>
</html>