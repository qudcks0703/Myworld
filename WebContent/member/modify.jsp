<%@page import="com.jsp.db.Member_DTO"%>
<%@page import="com.jsp.db.Member_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수정 폼</title>
	
</head>
<jsp:include page="../index2.jsp"></jsp:include>
<jsp:include page="../logxx.jsp"></jsp:include>
	<%  
			
		String id = (String)session.getAttribute("sId");
		Member_DAO dao = Member_DAO.getInstance();
		Member_DTO member = dao.getdto(id);
		%>
			<script>
		
	function check(){
		var a=document.forms[0];
		
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
		return true;
	}
	
	</script>
<body>
<br/>
	<h1> 회원정보 수정 </h1>
	<form action = "modify_ok.jsp" method = "post" onsubmit="return check()">
		<h3> 아이디 :<%=member.getId() %></h3>
		
		<h3> *비밀번호 :<input type="password" name="pw" value="<%= member.getPw() %>" /></h3>
		<h3> *비밀번호 확인 :<input type="password" name="pwCh" /></h3>
		
		<h3> 이름 : <%=member.getName() %></h3>
		<h3> 주민등록번호 :<%=member.getRrn1() %>-<%=member.getRrn2() %></h3>
		<h3> 이메일: 
		<%if(member.getEmail() == null){ %>
			<input type="text" name="email" />
			<%}else{ %>
			<input type="text" name="email" value="<%=member.getEmail()%>" />
			<% } %></h3>
		<h3> 휴대전화번호:
				<input type="text" name="phone1" value="<%=member.getPhone2()%>" />-
				<input type="text" name="phone2" value="<%=member.getPhone2() %>" />-
				<input type="text" name="phone3" value="<%=member.getPhone3() %>" /><br/><br/>
		</h3>		
				
			<input type="submit" value="수정하기"	/>
			<input type="button" value="취소하기" onclick="window.location.href='../index.jsp'"/>
	</form>
</body>
</html>