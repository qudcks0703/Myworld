<%@page import="com.jsp.db.Friend_DAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../logxx.jsp"></jsp:include>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String id=(String)session.getAttribute("sId");	
	Friend_DAO fdao=Friend_DAO.getInstance();
	int list =0;
	if(request.getParameter("list")==null){
		list=1;
	}else{
		list=Integer.parseInt(request.getParameter("list"));
	}
	List listfriends = null;
	int result = 0;	
	int search = 0;%>
	
			<script>
			function check(){
				var a=document.forms[0].search_id.value;
				window.open("Friend_pop.jsp?search_id="+a,"","width=500 ,height=200,top=350,left=500,scrollbars,resizable,toolbar=no");
				window.close();
			}
			</script>
<body>
	<jsp:include page="../index2.jsp"></jsp:include>
	<br/><br/><br/>
	<h1 style="color:black">검색하기</h1>
	<form action ="#" method="post" onsubmit="return check()">
		<tr>
			<td>					
				<input type = "text" name ="search_id"/>
				<input type = "submit" value="검색"/>
			</td>
		</tr>		
	</form>
	<a href="Friend.jsp?list=1"><button>친구목록</button></a>
	<a href="Friend.jsp?list=2"><button>나를 친구추가한 목록</button></a>
	<a href="Friend.jsp?list=3"><button>내가 친구추가한 목록</button></a>
	
		<%if(list ==1){ //서로 친구 목록
				listfriends = fdao.list_firend(id);%>
				<br/><h1 style="color:black"> 친구 목록</h1>
				<% for(int i=0;i<listfriends.size();i++){%><br/>
					<%=i+1%>번째 친구:<a href="messeage.jsp?friend=<%=listfriends.get(i)%>"><%=listfriends.get(i)%></a>
		<%		}
		}else if(list==2){//나를 친추한 목록
				listfriends = fdao.list_firend_you(id);%>
				<br/><h1 style="color:black"> 추가온 목록</h1><br/>
				<% for(int i=0;i<listfriends.size();i++){%>
					<%=listfriends.get(i)%>님에게 친구추가가 왔습니다.<br/>
					<a href="#" onclick="window.open('Friend_receive.jsp?id=<%=id%>&friend=<%=listfriends.get(i)%>','','width=500,height=200,top=300,left=500,scrollbars,resizable,toolbar=no')"><button>친구 수락</button></a>
					<a href="#" onclick="window.open('Friend_delete.jsp?id=<%=id%>&friend=<%=listfriends.get(i)%>','','width=500,height=200,top=300,left=500,scrollbars,resizable,toolbar=no')"><button>친구 거절</button></a>
					<hr/>
		<%		}
		}else if(list==3){//내가 추가한 목록
				listfriends = fdao.list_firend_me(id);%>
				<br/><h1 style="color:black"> 추가한 목록</h1><br/>
				<% for(int i=0;i<listfriends.size();i++){%>
				
					<%=listfriends.get(i)%>님에게 친구추가를 하셨습니다.
					<hr/>
		<%		} 
		}%>
		
</body>
</html>
</html>