<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.jsp.db.MesDTO2"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.db.MesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	MesDAO mdao =MesDAO.getInstance();
%>
<%
	//String id=(String)session.getAttribute("sId");
	String id=request.getParameter("id");
	String friend=request.getParameter("friend");
	List list=mdao.selectmes(id,friend);
	JSONObject result1=null;
	JSONArray array=new JSONArray();
	for(int i=0;i<list.size();i++){
		MesDTO2 mdto= (MesDTO2)list.get(i);
		result1=new JSONObject();
		result1.put("id", mdto.getId());
		result1.put("friend", mdto.getFriend());
		result1.put("mes", mdto.getMes());
		//result1.put("reg", mdto.getReg());
		array.add(result1);
	}
	JSONObject result2=new JSONObject();
	result2.put("result", array);
	out.println(result2);
%>
