<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" href="/bb/member/css_js/member.css" >
			<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> 
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<style>
	html,body{
		background-color: #2e353d;
		background-size: cover;
		background-repeat: no-repeat;
		height: 100%;
		font-family: 'Numans', sans-serif;
	}
</style>
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
	<% String id=(String)session.getAttribute("sId");
	
	%>

<body>
<div class="container">
	<div align= "center">
		<img src="../../img/logo.png" width="300px;" style="margin-top:30px; margin-bottom:0px; ">
	</div>	
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>게시판 글작성</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fas fa-heart"></i></span>
				</div>
			</div>
			<div class="card-body">
				<form action="Me_write_ok.jsp" enctype="multipart/form-data" method="post">
				
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="far fa-comments"></i></span>
						</div>
						<input type="text" class="form-control" placeholder="Write title " name="title">
					</div>
					
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="far fa-file-image"></i></span>
						</div>	
						
						<input type="file" class="form-control" name="file"  onchange="readURL(this);" required="required">
					</div>
					
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="far fa-comments"></i></span>
						</div>
						<textarea rows="10" cols="40" class="form-control" name="content" placeholder="Write content"></textarea>
					</div>
					<input type="hidden" name="writer" value="<%=id%>"><br/>
					<div class="form-group">
						<input type="submit" value="Write" class="btn float-right login_btn">
					</div>
				</form>
				
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center">
					<h5><a style="color:white" href="/bb/index.jsp">back</a></h5>
				</div>
			</div>
		</div>
			<div class="card" style="height:611px;">
			<div class="card-header">
				<h4 style="color:white;">파일 샘플</h4>
			</div>
				<img id="img" height="500px" >
			</div>
	</div>
</div>

</body>
</html>