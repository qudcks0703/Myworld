<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<jsp:include page="../index2.jsp"></jsp:include>
<jsp:include page="../logok.jsp"></jsp:include>
<body>
	<br/><br/><br/><br/>
	<h1 style="color:black"> 로그인 </h1>
	<br/>
		<form action="Login_ok.jsp" method="post">
	<h3> 아이디 </h3>
		<input type="text" name = "id" /> <br />
	
	<h3> 비밀번호 </h3>
		<input type="password" name = "pw" /> <br />
	
	<h3> 자동 로그인 
	<input type="checkbox" name="auto" value="1" /> <br />
		</h3>
	
	<input type="submit" value="로그인" />
	<input type="button" value="회원가입" onclick="window.location.href='Form.jsp'"; />
	
		</form>
</body>
</html>