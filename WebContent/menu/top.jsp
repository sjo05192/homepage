<%@ page contentType="text/html; charset=UTF-8" %> 
 
<%
String root = request.getContextPath();
String id = (String)session.getAttribute("id");
String grade = (String)session.getAttribute("grade");
%>
<!DOCTYPE html> 

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
/*
ul#menu li{
display : inline;
}
ul#menu li a{
background-color: black;
color:white;
pading : 10px 20px;
text-decoration:none;
border-radius:4px 4px 0 0;
}
ul#menu li a:hover{
background-color: orange;
}
*/
.table{
width: 100%;
} 
.table,.td{
border-style: none;
}
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 상단 메뉴 -->
<div style="background-color: #EEEEEE;">
<table class="table">
  <tr>
    <td class="button">
        <img src="<%=root %>/menu/images/mainvisuall.png" width='100%' height='100%'>
        
    </td>
  </tr>
   
  <tr>
    <td class="td">
       <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=root %>/index.jsp">homepage</a>
    </div>
    <ul class="nav navbar-nav">     
   <%if(id!=null){ %>
    <li><a href="<%=root %>/member/deleteForm.jsp">会員脱退</a></li>  
    <li><a href="<%=root %>/member/logout.jsp">LOGOUT</a></li>  
   <%}%>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">芳名録
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
      
       <li><a href="<%=root %>/bbs/createForm.jsp">作る</a></li>
       <li><a href="<%=root %>/bbs/list.jsp">目録</a></li>
      </ul>
     </li>
     <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Q&A
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
      
       <li><a href="<%=root %>/memov3/createForm.jsp">作る</a></li>
       <li><a href="<%=root %>/memov3/list.jsp">目録</a></li>
      </ul>
     </li>
     <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">イラスト
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
      
       <li><a href="<%=root %>/image/createForm.jsp">作る</a></li>
       <li><a href="<%=root %>/image/list.jsp">目録</a></li>
      </ul>
     </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
     <%if(id==null) {%>
      <li><a href="<%=root %>/member/agreement.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="<%=root %>/member/loginForm.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
     <%}else{ %>
      <li><a href="<%=root %>/member/read.jsp"><span class="glyphicon glyphicon-user"></span> My Info</a></li>
      <li><a href="<%=root %>/member/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
     
     <%}%> 
     <%if(id!=null && grade.equals("A")) { %> 
     <li><a href="<%=root %>/member/list.jsp"><span class="glyphicon glyphicon-user"></span> 회원목록</a></li>
    <%} %>
    
    </ul>
   </div>
</nav>
    </td> 
  </tr>
 
</table>
</div>
<!-- 상단 메뉴 끝 -->
  
<!-- 내용 시작 -->
