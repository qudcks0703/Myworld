<%@page import="com.jsp.db.Board_DTO"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.db.Board_DAO"%>
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
<style>

html{
	background-color: gray;
	
}

.fix1{
 position:fixed;
 left:1150px; 
 top:225px;
}
.content1{
	float:left;
	margin-left:340px;
}

@media (max-width:767px) {
	.fix1{
		position:fixed;
 		left:300px; 
	}
	.content1{
		float:left;
		margin-left:0px;
	}
}

</style>
</head>
<jsp:include page="/index3.jsp"></jsp:include>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/javascript" src="/bb/board/Css_js/jquery.smartPop.js"></script>
<link rel="stylesheet" href="/bb/board/Css_js/jquery.smartPop.css" />
<body>
	<%
	String id=(String)session.getAttribute("sId");	
	%>
	
<%--dao.리스트 뽑고 2,4,8개중  몇개로 볼건지 확인하는 용도 --%>
		<%
		Board_DAO bdao=Board_DAO.getInstance();
		
		String sel = request.getParameter("sel");
		String search = request.getParameter("search");
		List list =null;
		if(sel != null && search != null){	// 검색했을 때
			list=bdao.getsearchlist(sel,search);
		}else{								// 검색하지 않을 때
			list=bdao.getlist();			
		}			
		%>
		<div class="content1">
			<div class="card-header">
				<form action="/bb/board/All/All.jsp" method="post">
					<div class="input-group">
						<select name="sel">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
							<option value="all">전체</option>
						</select>
						<input type="text" placeholder="게시글 찾기" name="search" class="form-control search">
						<div class="input-group-prepend">
							<span class="input-group-text search_btn"><a href="#"><i class="fas fa-search" onclick="document.forms[0].submit()"></i></a></span>
						</div>
					</div>
				</form>
				<a href="/bb/board/Me/Me_write.jsp" style="color:white;"><i style="padding-top:10px;" class="fas fa-pencil-ruler fa-2x"></i></a>
			</div>
			<table>
		<%
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
					%>
					<td><a href="#" onclick="$.smartPop.open({title: '스마트팝', width: 500, height: 500, url:'/bb/board/Me/Me_contents.jsp?board_num=<%=bdto.getNum()%>'})">
					<img style="margin:10px; max-width:100%;" width="180" height="180" src="/bb/board/upload/<%=bdto.getFile()%>"></a></td>
				<%} %>
				</tr>
		<% }%>
	</table>
	</div>
	<div class="fix1">
		<iframe src="/bb/friend/friendlist.jsp" width="400" height="550" style="border: none;max-width:100%;">
		</iframe>	
	</div>
</body>
</html>