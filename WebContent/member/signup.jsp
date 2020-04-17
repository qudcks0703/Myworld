<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/member/css_js/member.css?var=11" type="text/css" >
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> 
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<style>
	.card{
		height: 630px;
	}
html,body{
	background-color: #2e353d;
	background-size: cover;
	background-repeat: no-repeat;
	height: 100%;
	font-family: 'Numans', sans-serif;
}
input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}
</style>

<script>
	function check(){
		var a=document.forms[0];
		
		if(!a.id.value){
			alert('아이디를 적으세요.')
			a.id.focus();
			return false;
		}
		if(!a.pw.value){
			alert('비밀번호를 적으세요.')
			a.pw.focus();
			return false;
		}
		if(!a.pwCh.value){
			alert('비밀번호 확인을 적으세요.')
			a.pwCh.focus();
			return false;
		}else if(a.pw.value != a.pwCh.value){
			alert('비밀번호와 비밀번호확인이 서로 다릅니다.')
			a.pw.focus();
			return false;
		}
		if(!a.name.value){
			alert('이름을 적으세요.')
			a.name.focus();
			return false;
		}
		if(!a.rrn1.value){
			alert('주민번호를 적으세요.')
			a.id.focus();
			return false;
		}
		if(!a.rrn2.value){
			alert('주민번호를 적으세요.')
			a.id.focus();
			return false;
		}
		return true;
	}
	
	function checkid(forms){
		if(!forms.id.value){
			alert('아이디 입력하세요.');
			return false;
		}else{
			var url="checkId.jsp?id="+forms.id.value;
			window.open(url,"","width=500 ,height=200,top=300,left=500,scrollbars,resizable,toolbar=no");
		}
			
	}
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
<div class="container">
	<div align= "center">
		<img src="../img/logo.png" width="300px;" style="margin-top:30px; margin-bottom:0px; ">
	</div>	
	<div class="d-flex justify-content-center h-100">					
			<div class="card">
				<div class="card-header">
					<h3>회원 가입</h3>
					<div class="d-flex justify-content-end social_icon">
						<span><i class="fas fa-heart"></i></span>
					</div>
				</div>
				<div class="card-body">
					<form action="/bb/member/signup_ok.jsp" onsubmit="return check()" method="post" enctype="multipart/form-data">
					
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="*아이디" name="id">
							
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="far fa-grin-squint"></i></span>
							</div>
							<label for="file1" class="form-control">프로필 업로드</label>
							<input type="file" id="file1" value="프로필사진" name="file" onchange="readURL(this);">
						</div>
						
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control" placeholder="*패스워드" name="pw">
						</div>
						
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control" placeholder="*패스워드 확인" name="pwCh">
						</div>
						
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-smile-wink"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="*이름" name="name">
						</div>
						
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-portrait"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="*주민등록번호 ex)94xxxx-xxxxxx" name="rrn">
							
						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-phone"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="휴대폰 번호 ex)010-xxxx-xxxx" name="phone">
						</div>
					
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-envelope-square"></i></span>
							</div>
							<input type="email" class="form-control" placeholder="이메일" name="email">
						</div>
						
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-home"></i></span>
							</div>
							<input type="home" class="form-control" placeholder="주소" name="home">
						</div>
						
						
						<div class="form-group">
							<input type="submit" value="회원가입" class="btn float-right login_btn">
						</div>
					</form>
				</div>
				<div class="card-footer">
					<div class="d-flex justify-content-center">
						<h5><a style="color:white" href="/bb/member/login2.jsp">로그인</a></h5>
					</div>
				</div>
			</div>
			
			<div class="card" style="height:631px;">
				<div class="card-header">
					<h4 style="color:white;">프로필 사진</h4>
				</div>
				<img id="img" height="500px" >
			</div>		
	</div>
</div>
	

</body>
</html>