<%@page import="com.jsp.db.Friend_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String search_id = request.getParameter("search_id");
	String id=(String)session.getAttribute("sId");
	Friend_DAO fdao=Friend_DAO.getInstance();
	int result= fdao.search_member(search_id,id);
	if(result==1){
%>

<body>
<jsp:include page="../logxx.jsp"></jsp:include>
	<form>
		<table>
			<tr>
				<td><%=search_id%>님을 친구추가 요청하시겠습니까?</td>
			</tr>		
			<tr>
				<td text-align = "right">
					<input type ="button" onclick = "window.location.href='/Team/friend/Friend_ok.jsp?search_id=<%=search_id%>'" value ="친구요청"></input>
					<input type ="button" onclick = "window.close()" value ="취소"></input>
				</td>
			</tr>		
		</table>
	</form>
<%}else if(result==-1){%>
	<script>
		alert('아이디가 존재하지 않습니다');
		window.close();
	</script>
<%}else{%>
	<script type="text/javascript">
		alert('이미 친구중이거나 친구추가가 와있습니다');
		window.close();
	</script>
	<%}%>

</body>
</html>