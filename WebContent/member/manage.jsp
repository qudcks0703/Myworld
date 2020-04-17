<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" href="/bb/member/css_js/member.css?var=2" >
<style>
	html,body{
		background-color: #2e353d;
		background-size: cover;
		background-repeat: no-repeat;
		height: 100%;
		font-family: 'Numans', sans-serif;
	}
	.card{
	height:300px;
	}
	.card{
	margin-top: 90px;
	margin-bottom: auto;
	width: 400px;
	background-color: rgba(0,0,0,0.5) !important;
	}
</style>	
</head>
<body>
	<jsp:include page="../logxx.jsp"></jsp:include>
<div class="container">
	<div align= "center">
		<img src="../img/logo.png" width="300px;" style="margin-top:100px; margin-bottom:0px; ">
	</div>
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<br/>
				<h3>회원 관리</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fas fa-heart"></i></span>
				</div>
			</div>
			<div class="card-body">
					<div class="input-group form-group">
					</div>
					<div class="form-group">
						<a href="/bb/member/modify.jsp">
							<input type="button" value="회원 정보 수정" class="btn login_btn" style="width:360px;">
						</a>
					</div>
					<div class="form-group">
						<a href="/bb/member/Delete.jsp">
							<input type="button" value="아이디 삭제" class="btn login_btn" style="width:360px;">
						</a>
					</div>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center">
					<h5><a style="color:white" href="/bb/index.jsp">뒤로 가기</a></h5>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>