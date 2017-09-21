<%@ page contentType="text/html; charset=UTF-8" %> 
<%
String id = (String)session.getAttribute("id");
String str = "はじめまして！";
if(id!=null){
	str  = "ようこそ"+id+"様";
}
// String title = "艦これ情報サイト";
// if(id!=null && grade.equals("A")){
// 	title = "管理者ページです。";
// }
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<link href="css/style.css" rel="sytlesheet">
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px;
  text-align: center; 
} 
</style> 
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">艦隊これくしょん</DIV>
<div class="content">
<h1><%=str %></h1> 
<img src = "menu/images/zuikaga.gif" width="50%">
<br>
<%if(id==null) {%>
<button type = "button" onclick="location.href='member/loginForm.jsp'">LOGIN</button>
<%}else{ %>
<button type = "button" onclick="location.href='member/logout.jsp'">LOGOUT</button>
<%} %>
</div>
<br>
<br>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 