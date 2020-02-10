<%@page import="com.jsp.db.Member_DTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.jsp.db.Member_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원가입 처리 </title>
</head>
	<% request.setCharacterEncoding("UTF-8"); %> 
	<jsp:useBean id="member" class="com.jsp.db.Member_DTO"/>
	<jsp:setProperty property="*" name="member"/>
	<jsp:include page="../logok.jsp"></jsp:include>
	<% 
	Member_DAO dao =Member_DAO.getInstance();
	String savepath="\\\\192.168.0.136\\ridongjun\\Public\\Jsp\\bb\\WebContent\\member\\member_img";
	MultipartRequest multi=new MultipartRequest(request,savepath,4*1024*1024,"utf-8",new DefaultFileRenamePolicy());
	
	String id=multi.getParameter("id");
	String pw=multi.getParameter("pw");
	String name=multi.getParameter("name");
	String rrn=multi.getParameter("rrn");
	String phone=multi.getParameter("phone");
	String email=multi.getParameter("email");
	String home=multi.getParameter("home");
	String file=multi.getFilesystemName("file");
	System.out.println(file);
	
	Member_DTO mdto=new Member_DTO();
	mdto.setId(id);
	mdto.setPw(pw);
	mdto.setName(name);
	mdto.setRrn(rrn);
	mdto.setPhone(phone);
	mdto.setEmail(email);
	mdto.setHome(home);
	if(file==null){
		mdto.setFile("b.png");
	}else{
		mdto.setFile(file);
	}
	int result=dao.siunup(mdto);
	
	if(result==1){%>
	
	<script type="text/javascript">
		alert('가입을 축하합니다.');
		location.href="/bb/member/login2.jsp";
	</script>	
	<%}else{ %>
	<script type="text/javascript">
		alert('가입 실패');
		history.go(-1);
	</script>	
	<% }%>
<body>

</body>
</html>