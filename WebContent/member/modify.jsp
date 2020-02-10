<%@page import="com.jsp.db.Member_DTO"%>
<%@page import="com.jsp.db.Member_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수정 폼</title>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" href="/bb/member/css_js/member.css?var=3" >
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

	.card{
		height:630px;
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
</head>
		<%  
		String id = (String)session.getAttribute("sId");
		Member_DAO dao = Member_DAO.getInstance();
		Member_DTO member = dao.getdto(id);
		%>
		
	<script>
	function check(){
		
		var a=document.forms[0];
		var b= confirm("수정을 하시겠습니까?");
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
		}else if(b==true){
			
		return true;
		}
		return false;
		
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
    function can(){
    	var i = confirm("취소하시겠습니까?");
    	if(i==true){
    		alert("취소되었습니다.");
    		window.location.href="/bb/member/manage.jsp";
    	}
    }
	</script>
<body>

<div class="container"> 
	<div align= "center">
		<img src="../img/logo.png" width="300px;" style="margin-top:30px; margin-bottom:0px; ">
	</div>	
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>회원 정보 수정</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fas fa-heart"></i></span>
				</div>
			</div>
			<div class="card-body">
				<form action="/bb/member/modify_ok.jsp" enctype="multipart/form-data" method="post" onsubmit="return check()">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" value=<%=member.getId()%> name="id" readonly="readonly">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="far fa-grin-squint"></i></span>
						</div>
						<label for="file1" class="form-control">프로필 업로드</label>
						<input type="file" id="file1" value="프로필사진" name="file1" onchange="readURL(this);">
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" value="<%=member.getPw()%>" name="pw">
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" value="<%=member.getPw()%>" name="pwCh">
					</div>
					
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-smile-wink"></i></span>
						</div>
						<input type="text" class="form-control"  name="name" value="<%=member.getName()%>" readonly="readonly">
					</div>
					
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-portrait"></i></span>
						</div>
						<input type="text" class="form-control" value="<%=member.getRrn()%>" name="rrn" readonly="readonly">
					</div>
					
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-phone"></i></span>
						</div>
						<input type="text" class="form-control" placeholder="phone(010-xxxx-xxxx)" value="<%=member.getPhone()%>" name="phone">
					</div>
					
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-envelope-square"></i></span>
						</div>
						<input type="email" class="form-control" placeholder="email" value="<%=member.getEmail() %>" name="email">
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-home"></i></span>
						</div>
						<input type="hidden" value="<%=member.getFile()%>" name="file2">
						<input type="home" class="form-control" value="<%=member.getHome() %>" name="home">
					</div>
					
					<div class="form-group">
						<input type="submit" value="수정" class="btn float-right login_btn">
						<a ></a>
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center">
					<h5><a style="color:white" href="/bb/member/manage.jsp">뒤로 가기</a></h5>
				</div>
			</div>
		</div>
		<div class="card" style="height:631px;">
			<div class="card-header">
				<h4 style="color:white;">프로필 사진</h4>
			</div>
			<img id="img" height="500px" src="/bb/member/member_img/<%=member.getFile()%>">
		</div>
	</div>
</div>
	
</body>
</html>