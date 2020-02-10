<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<jsp:include page="index2.jsp"></jsp:include>
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
	
	</script>

</head>
<jsp:include page="../logok.jsp"></jsp:include>
<body>
	<br/><br/><br/><br/>
	<h1 style="color:black"> 회원가입 </h1>
	<br/>
	<form action = "Form_ok.jsp" method="post" name="input" onsubmit="return check()" > 
	<h3>* 아이디를 입력해주세요. </h3>
		<input type="text" name="id" placeholder="아이디를 입력해주세요." />
		<input type="button" value="중복검사"  onclick="checkid(this.form)"></button>	
	<h3>* 비밀번호를 입력해주세요. </h3>
		<input type="password" name="pw" placeholder="비밀번호를 입력해주세요." /> 
	<h3>* 비밀번호를 재입력해주세요. </h3> 
		<input type="password" name="pwCh" placeholder="비밀번호를 입력해주세요." /> 
	<h3> *이름을 입력해주세요. </h3> 
		<input type="text" name="name" placeholder="성함을 입력해주세요." />
	<h3>* 주민등록번호를 입력해주세요. </h3>
		<input type="text" name="rrn1" width="3"/>-
		<input type="text" name="rrn2" width="3"/>
	<h3> 이메일을 입력해주세요. </h3>
		<input type="text" name="email" /> 
	<h3> 전화번호를 입력해주세요. </h3>
		<input type="text" name="phone1" width="2"/>-
		<input type="text" name="phone2" width="2" />-
		<input type="text" name="phone3" width="2"/>
		<%-- 깔끔하게 해결하는 방안이 있었으면 좋겠음. --%>
		<br/> 
		<br/>
	<input type="submit" value="가입" />
	<input type="reset" value="취소하기" />
	</form>
</body>
</html>