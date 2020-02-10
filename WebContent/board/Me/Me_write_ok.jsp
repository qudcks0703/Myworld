<%@page import="java.io.File"%>
<%@page import="com.jsp.db.Board_DAO"%>
<%@page import="com.jsp.db.Board_DTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		//String savepath="\\\\PC-PC\\ridongjun\\Public\\Jsp\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Team\\board\\upload";
		String savepath="\\\\192.168.0.136\\ridongjun\\Public\\Jsp\\bb\\WebContent\\board\\upload";
		MultipartRequest multi=new MultipartRequest(request,savepath,4*1024*1024,"utf-8",new DefaultFileRenamePolicy());
				
		String writer=multi.getParameter("writer");
		String title=multi.getParameter("title");
		String content=multi.getParameter("content");
		String file=multi.getFilesystemName("file");
		String ip=request.getRemoteAddr();
		
		Board_DTO bdto=new Board_DTO();
		bdto.setWriter(writer);
		bdto.setFile(file);
		bdto.setTitle(title);
		bdto.setContent(content);
		bdto.setIp(ip);
		
		Board_DAO bdao=Board_DAO.getInstance();
		int result=bdao.write(bdto);
		if(result==1){
		%>
		
		<script>
			alert("글 작성 성공");
			location.href="Me.jsp";
		</script>
			<%
		}else{
			File f=new File(savepath+"/"+file);
			if(f.exists()){
				f.delete();
			}
		%>
		<script>
			alert("글 작성 실패");
			history.go(-1);
		</script>
		<%}
		
		
	%>

</body>
</html>