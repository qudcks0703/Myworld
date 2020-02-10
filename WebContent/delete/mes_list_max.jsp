<%@page import="com.jsp.db.MesDTO2"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.jsp.db.MesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	request.setCharacterEncoding("UTF-8");
	MesDAO dao =MesDAO.getInstance();
%>

<%
	//String id=(String)session.getAttribute("sId");
	String id=request.getParameter("id");
	String friend=request.getParameter("friend");
	
	MesDTO2 mdto=dao.selectmes_max(id, friend);
	
	JSONObject result1=new JSONObject();
	
	result1.put("id", mdto.getId());
	result1.put("friend", mdto.getFriend());
	result1.put("mes", mdto.getMes());
	//{"friend":"tmddh","mes":"반가워요","id":"fgs"}
	
		//result1.put("reg", mdto.getReg());
	JSONArray array=new JSONArray();
	array.add(result1);
	//[{"friend":"tmddh","mes":"반가워요","id":"fgs"}]
		
	JSONObject result2=new JSONObject();
	result2.put("result", array);
	//{"result":[{"friend":"tmddh","mes":"반가워요","id":"fgs"}]}
		System.out.println(result2);
	out.println(result2);
%>
