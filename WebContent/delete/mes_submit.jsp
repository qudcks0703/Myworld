<%@page import="com.jsp.db.MesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	request.setCharacterEncoding("UTF-8");
	MesDAO dao =MesDAO.getInstance();
%>

<%
	String mes=request.getParameter("mes");
	//String id=(String)session.getAttribute("sId");
	String id=request.getParameter("id");
	String friend=request.getParameter("friend");
	int result=dao.insertArticle(id,friend,mes);
	if(mes.equals("")){
		out.write("0");
	}else{
		out.write("1");
	}
%>
