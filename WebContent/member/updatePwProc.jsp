<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp" %>
<jsp:useBean id="dao" class = "member.MemberDAO"/>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	Map map = new HashMap();
	map.put("id",id);
	map.put("passwd",passwd);
	
	boolean flag = dao.updatePw(map);
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px;
  text-align: center; 
}
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">비밀번호 변경처리</DIV>
<div class="content">
<%
	if(flag){
		out.print("패스워드 변경했습니다.<br>");
		out.print("로그인을 해보세용<br>");
	} else {
		out.print("패스워드 변경을 실패했습니다.");
	}
%>
</div>
  
  <DIV class='bottom'>
  <%if(flag){ %>
    <input type='button' value='로그인'>
  <%}else{ %> 
    <input type='button' value='다시시도' onclick="history.back()">
  <%} %>  
    <input type='button' value='Home' onclick="location.href='../index.jsp'">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 