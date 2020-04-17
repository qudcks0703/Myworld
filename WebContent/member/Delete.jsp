<%@page import="com.jsp.db.Member_DTO"%>
<%@page import="com.jsp.db.Member_DAO"%>
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
<style>
	html,body{
		background-color : #2e353d;
		background-size: cover;
		background-repeat: no-repeat;
		height: 100%;
		font-family: 'Numans', sans-serif;
	}

	.card{
	height:250px;
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
		<img src="../img/logo.png" width="300px;" style="margin-top: 100px; margin-bottom:0px; ">
	</div>
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>아이디 삭제</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fas fa-heart"></i></span>
				</div>
			</div>
			<div class="card-body">
				<form action="/bb/member/Delete_ok.jsp" method="post" onsubmit="return check()">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" name="pw" placeholder="패스워드 입력">
					</div>
					<div class="form-group">
						<input type="submit" value="삭제" class="btn float-right login_btn">
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center">
					<h5><a style="color:white" href="/bb/member/manage.jsp">뒤로 가기</a></h5>
				</div>
			</div>
		</div>
	</div>
</div>
		
		

</body>
</html>