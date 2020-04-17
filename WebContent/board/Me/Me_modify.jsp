<%@page import="com.jsp.db.Board_DTO"%>
<%@page import="com.jsp.db.Board_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<link href="https://fonts.googleapis.com/css?family=Rokkitt" rel="stylesheet"> 
		<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
		
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> 
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="/bb/board/Css_js/Me_content_css.css?ver=1.12" />

<script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#img').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
</script>
</head>
<body>
<jsp:include page="/logxx.jsp"></jsp:include>
<%
	String id=(String)session.getAttribute("sId");
	int num=Integer.parseInt(request.getParameter("board_num"));
	Board_DAO bdao=Board_DAO.getInstance();
	Board_DTO bdto=bdao.getcontent(num);
%>


<section class="hero">
	<div class="container">
		<div class="row">	
			<div class="col-lg-6 offset-lg-3" style="margin-top: 40px;">
				<div class="cardbox shadow-lg bg-white">
					<div class="cardbox-heading">
						<div class="cardbox-item">
							<img id="img" class="img-fluid" width="300px" height="250px" style="margin-left:85px;" src="/bb/board/upload/<%=bdto.getFile()%>">
						</div>
			 		</div>
			  		<form action="Me_modify_ok.jsp" method="post" enctype="multipart/form-data"  >
				 		<div class="cardbox-base" style="border-bottom-width: 30px;height: 60px;margin-top:50px;">
				  			<div class="search">
				   					<input placeholder="제목 입력" type="text" name="title" value="<%=bdto.getTitle()%>">
				  			</div><!--/. Search -->
				  		</div>
				  		<div class="cardbox-base" style="border-bottom-width: 50px;height: 25px;">
				  			<div class="search">
				   					<input type='file' name="file" onchange="readURL(this);" required="required"/>
				   			</div>
				   		</div>
				   		<div class="cardbox-base">
				   			<div class="search">
				   					<input placeholder="내용 입력" type="text" name="content" style="height:119px;" value="<%=bdto.getContent()%>">
				   			</div>
				   		</div>	
				   					<input type="hidden" name="num" value="<%=bdto.getNum()%>">
				   					<!--  input type="hidden" name="id" value="">
				   					<input type="hidden" name="num" value="">-->
				   		<div style="text-align:right">
				   			<button type="button" onclick="document.forms[0].submit();"><i class="fas fa-pencil-alt"></i></button>
				 		</div>
			   		</form>
				</div><!--/ cardbox -->
			</div><!--/ col-lg-6 -->
		</div><!--/ row -->
	</div><!--/ container -->
</section>

</body>
</html>