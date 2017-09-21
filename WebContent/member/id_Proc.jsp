<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/member/ssi.jsp"%>
<jsp:useBean id="dao" class = "member.MemberDAO"/>
<%
	String id = request.getParameter("id");
	boolean flag = dao.duplicateId(id);
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
<script>
	function use(){
		opener.frm.id.value='<%=id%>'
		window.close();
	}

</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

 
<DIV class="title">ID 중복 확인</DIV>
 
<div class="content">
입력된 ID:<%=id %><br><br>
<%
	if(flag){
		out.print("중복되어 사용할수 없습니다.");
	}else{
		out.print("사용 가능한 아이디입니다.");
		out.print("<button type= 'button' onclick='use()'>사용</button>");
	}
%>

</div>
  
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="location.href = 'id_Form.jsp'">
    <input type='button' value='닫기' onclick="window.close()">
  </DIV>

 
 

</body>
<!-- *********************************************** -->
</html> 