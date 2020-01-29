<%@page import="com.jsp.db.Board_DTO"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.db.Board_DAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<body>
<jsp:include page="../index2.jsp"></jsp:include>
<jsp:include page="../logxx.jsp"></jsp:include>
<br/><br/><br/>
	<h1 style="color:black">나의 게시글</h1><br/>
	<%
	String id=(String)session.getAttribute("sId");	
	String path="\\\\PC-PC\\ridongjun\\Public\\Jsp\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Team\\board\\upload\\";
	%>
	<table>
		<tr>
			<td ><button onclick="window.location='Me_write.jsp'">글 작성 </button></td>
		</tr>
	</table>


<%--dao.리스트 뽑고 2,4,8개중  몇개로 볼건지 확인하는 용도 --%>
		<%
		Board_DAO bdao=Board_DAO.getInstance();
		
		String sel = request.getParameter("sel");
		String search = request.getParameter("search");
		int pcount=0;
		List list =null;
		if(sel != null && search != null){
			list=bdao.getsearchlist(sel,search);
		}else{		
			list=bdao.getIdlist(id);			
		}			
		if(request.getParameter("pcount")==null){
			pcount=4;
		}else{
			pcount=Integer.parseInt(request.getParameter("pcount"));
		}
		
		%>
		
		<a href="?pcount=2">2개</a>
		<a href="?pcount=4">4개</a>
		<a href="?pcount=8">8개</a>
	<table>
	
	
	<!-- 2개일때 -->
			<%if(pcount==2){
				for(int i=0;i<Math.ceil((list.size()/2.0));i++){//
		%>
				<tr>
			<%
				int b=(2*i)+2;
				if(b>list.size()){
					b=list.size();
				}
			%>	
				<%for(int j=(2*i);j<b;j++){ //j=0; j<4 // j=4 ; j<8 4567
					Board_DTO bdto=(Board_DTO)list.get(j); 
					%>
					<td><a href="#" onclick="window.open('Me_contents.jsp?num=<%=bdto.getNum()%>','','width=500 ,height=600,top=300,left=500,scrollbars,resizable,toolbar=no');">
					<img width="400" height="400" src="upload/<%=bdto.getFile()%>"></a></td>
				<%} %>
				</tr>
		<% }}%>
	<!-- 4개일때 -->
		<%if(pcount==4){
				for(int i=0;i<Math.ceil((list.size()/4.0));i++){//12-> 3 11-> 2
		%>
				<tr>
			<%
				int b=(4*i)+4;
				if(b>list.size()){
					b=list.size();
				}
			%>	
				<%for(int j=(4*i);j<b;j++){ //j=0; j<4 // j=4 ; j<8 4567
					Board_DTO bdto=(Board_DTO)list.get(j); 
					String imgfile=path+"\\"+bdto.getFile();
					%>
					<td><a href="#" onclick="window.open('Me_contents.jsp?num=<%=bdto.getNum()%>','','width=500 ,height=600,top=300,left=500 ,scrollbars,resizable,toolbar=no');">
					<img width="200" height="200" src="upload/<%=bdto.getFile()%>"></a></td>
				<%} %>
				</tr>
		<% }}%>
	<!-- 8개일때 -->
		<%if(pcount==8){
				for(int i=0;i<Math.ceil((list.size()/8.0));i++){//12-> 3 11-> 2
		%>
				<tr>
			<%
				int b=(8*i)+8;
				if(b>list.size()){
					b=list.size();
				}
			%>	
				<%for(int j=(8*i);j<b;j++){ //j=0; j<4 // j=4 ; j<8 4567
					Board_DTO bdto=(Board_DTO)list.get(j); 
					%>
					<td><a href="#" onclick="window.open('Me_contents.jsp?num=<%=bdto.getNum()%>','','width=500 ,height=600,top=300,left=500 ,scrollbars,resizable,toolbar=no');">
					<img width="100" height="100" src="upload/<%=bdto.getFile()%>"></a></td>
				<%} %>
				</tr>
		<% }}%>
		
		<br/><br/>
			<form action= "All.jsp" method = "post">
				<select name="sel">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>
					<option value="all">전체</option>
				</select>
				<input type="text" name="search" >
				<input type="submit" value="검색" >
			</form>
	</table>
		<div style="width:24%; left:840px; top:290px; position:fixed;">
		<iframe src="/pratice/friendlist.jsp" width="300" height="500" style="border: none">
		</iframe>	
	</div>
</body>
</html>