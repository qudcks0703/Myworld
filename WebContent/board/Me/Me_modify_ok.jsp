<%@page import="java.io.File"%>
<%@page import="com.jsp.db.Board_DTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
		
		Board_DAO bdao=Board_DAO.getInstance();
		//String savepath="\\\\PC-PC\\ridongjun\\Public\\Jsp\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\Team\\board\\upload";
		String savepath="\\\\192.168.0.136\\ridongjun\\Public\\Jsp\\bb\\WebContent\\board\\upload";
		MultipartRequest multi=new MultipartRequest(request,savepath,4*1024*1024,"utf-8",new DefaultFileRenamePolicy());
		String title=multi.getParameter("title");
		String content=multi.getParameter("content");
		String file=multi.getFilesystemName("file");
		int num=Integer.parseInt(multi.getParameter("num"));
		Board_DTO bdto1=bdao.getcontent(num);
		
		String originfile=bdto1.getFile();
		
		Board_DTO bdto2=new Board_DTO();
		bdto2.setTitle(title);
		bdto2.setContent(content);
		bdto2.setFile(file);
		bdto2.setNum(num);
		int result=bdao.update(bdto2);
		if(result==1){
			File f=new File(savepath+"/"+originfile);
			if(f.exists()){
				f.delete();
				System.out.println("삭제 성공");
			}else{
				System.out.println("삭제 실패");
			}%>
			<script type="text/javascript">
				alert('수정 성공');
				location.href="Me_contents.jsp?board_num=<%=num%>";
			</script>
		<% }else{%>
			<script type="text/javascript">
				alert('수정 실패');
				history.go(-1);
			</script>	
		<%}
		%>

</body>
</html>