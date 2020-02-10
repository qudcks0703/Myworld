<%@page import="com.jsp.db.Member_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 ok</title>
</head>
<jsp:include page="../logok.jsp"></jsp:include>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	//	String auto = request.getParameter("auto");
		
		//Cookie[] cs = request.getCookies();
		//if(cs != null){
			//for(Cookie coo : cs){
				//if(coo.getName().equals("autoId")) id = coo.getValue();
				//if(coo.getName().equals("autoPw")) pw = coo.getValue();
				//if(coo.getName().equals("autoCh")) auto = coo.getValue();
			//}
		// }
			/**if(auto != null){
				Cookie c1 = new Cookie("autoId", id);
				Cookie c2 = new Cookie("autoPw", pw);
				Cookie c3 = new Cookie("autoCh", auto);
				
				c1.setMaxAge(60*60*24);
				c2.setMaxAge(60*60*24);
				c3.setMaxAge(60*60*24);
				
				response.addCookie(c1);
				response.addCookie(c2);
				response.addCookie(c3);
			}*/
		//쿠키는 다음에 넣어야할듯
		
		Member_DAO dao = Member_DAO.getInstance();
		int check = dao.login(id, pw);
		
		if(check==1){
			session.setAttribute("sId", id);%>
			<script type="text/javascript">
				alert('로그인 성공');
				location.href="/bb/index.jsp";			
			</script>
			
		<% }else if(check==0){	%>
			<script>
				alert("비밀번호가 틀렸습니다.");
				history.go(-1);
			</script>
	<% 	}else{%>
			<script>
				alert("아이디가 틀렸습니다.");
				history.go(-1);
			</script>
		<%}%>
<body>
</body>
</html>