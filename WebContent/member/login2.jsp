<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css?var=2" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" href="/bb/member/css_js/member.css?var=1" >
	
<style>
@import url('https://fonts.googleapis.com/css?family=Numans');

.card{
height: 370px;
}

html,body{
background-color: #2e353d;
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}-->

.container{
height: 100%;
align-content: center;
}

.card{
margin-top: 90px;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #FFCD4A;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header h3{
color: white;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;
background-color: #FFCD4A;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: black;
background-color: #FFCD4A;
width: 100px;
}

.login_btn:hover{
color: black;
background-color: white;
}

.links{
color: white;
}

.links a{
margin-left: 4px;
}
</style>	
</head>
<body>
<div class="container">
	<div align= "center">
		<img src="../img/logo.png" width="300px;" style="margin-top:100px; margin-bottom:0px; ">
	</div>
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>로그인</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fas fa-heart"></i></span>
				</div>
			</div>
			<div class="card-body">
				<form action="/bb/member/Login_ok.jsp" method = "post">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" placeholder="아이디를 적어주세요." name="id">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" placeholder="패스워드를 적어주세요." name="pw">
					</div>
					<div class="row align-items-center remember">
						<input type="checkbox">로그인 저장
					</div>
					<div class="form-group">
					<br/>
						<input type="button" value="홈" class="btn float-right login_btn" onclick="window.location.href='/bb/index.jsp'">
						<input type="submit" value="로그인" class="btn float-left login_btn">
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center">
					<h5><a style="color:white" href="/bb/member/signup.jsp">회원가입</a></h5>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>