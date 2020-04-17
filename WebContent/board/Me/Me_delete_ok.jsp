<%@page import="com.jsp.db.Member_DTO"%>
<%@page import="com.jsp.db.Member_DAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.jsp.db.Board_DTO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.jsp.db.Board_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/logxx.jsp"></jsp:include>
	<%
	String id=(String)session.getAttribute("sId");
	String pw=request.getParameter("pw");
	Member_DAO mdao=Member_DAO.getInstance();
	Member_DTO mdto=mdao.getdto(id);
	
	if(mdto.getPw().equals(pw)){
	Board_DAO bdao=Board_DAO.getInstance();
	//String path="\\\\PC-PC\\ridongjun\\Public\\Jsp\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Team\\board\\upload";
	String path="\\\\192.168.0.136\\ridongjun\\Public\\Jsp\\pratice\\WebContent\\board\\upload";
	int num=Integer.parseInt(request.getParameter("num"));
	Board_DTO bdto=bdao.getcontent(num);
	String file=bdto.getFile();
	int result=bdao.delete(bdto);
	
	if(result==1){
			File f=new File(path+"/"+file);
			if(f.exists()){
				f.delete();
			}%>
			<script type="text/javascript">
				alert('삭제 성공');
				window.close();
			</script>
		<% }else{%>
			<script type="text/javascript">
				alert('삭제 실패');
				history.go(-1);
			</script>	
		<%}
	}else{%>
	<script type="text/javascript">
		alert('비번 틀렸음');
		history.go(-1);
	</script>
	
		<%}%>
		
</body>
</html>