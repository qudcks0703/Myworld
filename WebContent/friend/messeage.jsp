<%@page import="com.jsp.db.MesDTO2"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.db.MesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="../logxx.jsp"></jsp:include>
<script>
	function formCheck(){
		var z=document.forms[0];
		if(!z.mes.value){
			alert('입력해주세요.');
			return false;
		}
		z.submit();
	}
	function focus(){
		document.forms[0].mes.focus();
	}
</script>
<body onload="focus()">


<jsp:include page="../index2.jsp"></jsp:include>
<%
	String id=(String)session.getAttribute("sId");//qudcks0703
	String friend=request.getParameter("friend");//tmddh
	MesDAO mdao=MesDAO.getInstance();
	mdao.check_ok(id, friend);
	List list=mdao.selectmes(id,friend);%>
	<br /> <br/><br/>
	<h1 style="color:black">메세지</h1><br/>
	<form action="messeagePro.jsp" method="get">
		<table>
			<tr>
				<td >
				<textarea rows="20" cols="70" readonly>
					<% for(int i=0;i<list.size();i++){
						MesDTO2 mdto=(MesDTO2)list.get(i);
					%><%=mdto.getId()%>:<%=mdto.getMes()%>/
					<%}%>
				
				</textarea>
				</td>
			</tr>
			<tr>
				<td align="center">
				<textarea rows= "5" cols="40" name="mes" onkeypress="if(event.keyCode == 13) formCheck();" ></textarea>
				<input type="hidden" name="friend" value="<%=request.getParameter("friend")%>">
				<input type="submit" value="전송"/>
				</td>
			</tr>
		</table>
	</form>
	<a href="Friend.jsp">뒤로 가기</a>
	<a href="messeage_delete.jsp?friend=<%=friend%>">채팅방 나가기</a>
</body>
</html>