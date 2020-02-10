<%@page import="java.io.File"%>
<%@page import="com.jsp.db.Member_DTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.jsp.db.Member_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수정 ok</title>
</head>
<jsp:include page="../logxx.jsp"></jsp:include>
<% 
	
	request.setCharacterEncoding("UTF-8");	%>
	
<% 	

	String id = (String)session.getAttribute("sId");
	
	Member_DAO dao =Member_DAO.getInstance();
	String savepath="\\\\192.168.0.136\\ridongjun\\Public\\Jsp\\bb\\WebContent\\member\\member_img";
	MultipartRequest multi=new MultipartRequest(request,savepath,4*1024*1024,"utf-8",new DefaultFileRenamePolicy());
	String pw=multi.getParameter("pw");
	String phone=multi.getParameter("phone");
	String email=multi.getParameter("email");
	String home=multi.getParameter("home");
	String file1=multi.getFilesystemName("file1");
	String file2=multi.getParameter("file2");
	
	Member_DTO mdto=new Member_DTO();
	mdto.setId(id);
	mdto.setPw(pw);
	mdto.setPhone(phone);
	mdto.setEmail(email);
	mdto.setHome(home);
	if(file1==null){
		mdto.setFile(file2);
	}else{
		mdto.setFile(file1);
	}
	
	int result=dao.update(mdto);
%>
<body>
	<% if(result==1){
		if(file1!=null){
			File f=new File(savepath+"/"+file2);
			if(f.exists()){
				f.delete();
			}
		}
	%>
		<script type="text/javascript">
			alert('정보수정 성공');
			location.href='/bb/member/manage.jsp';			
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert('정보 수정 실패');
			history.go(-1);
		</script>
	
		
	<%}%>
</body>
</html>