<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/member/ssi.jsp"%>
<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty name="dto" property = "*"/>
<jsp:useBean id="dao" class = "member.MemberDAO"/>
<%
	boolean flag = dao.update(dto);
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function read(){
	var url = "read.jsp?id=<%=dto.getId()%>";
	
	location.href=url;
}
</script>
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
 
<DIV class="title">정보수정</DIV>
 
<div class="content">
<%
	if(flag){
		out.print("정보를 수정했습니다.");
	}else{
		out.print("정보수정에 실패했습니다.");
	}

%>


</div>
  
  <DIV class='bottom'>
    <input type='button' value='정보확인' onclick="read()">
    <input type='button' value='다시시도' onclick="history.back()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 