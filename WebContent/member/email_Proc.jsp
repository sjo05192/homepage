<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/member/ssi.jsp"%>
<jsp:useBean id="dao" class = "member.MemberDAO"/>
<%
	String email = request.getParameter("email");
	boolean flag = dao.duplicateEmail(email);
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
<script type="text/javascript">
	function use(){
		opener.frm.email.value='<%= email%>'
		window.close();
	}
</script>
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">email 중복 확인</DIV>
 
<div class="content">
입력된 Email:<%= email%><br><br>
<%
	if(flag){
		out.print("중복되어 사용할수 없습니다.");
	}else{
		out.print("사용 가능한 이메일입니다.");
		out.print("<button type= 'button' onclick='use()'>사용</button>");
	}
%>

</div>
  
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="location.href='email_Form.jsp'">
    <input type='button' value='닫기' onclick="window.close()">
  </DIV>

 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 