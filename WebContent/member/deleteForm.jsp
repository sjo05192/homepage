<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="dao" class = "member.MemberDAO"/>
<%
	String id = request.getParameter("id");
	if(id==null)id=(String)session.getAttribute("id");
	String oldfile = request.getParameter("oldfile");
	if(oldfile==null){
		oldfile= dao.getFname(id);
	}
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
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원탈퇴</DIV>
 
<FORM name='frm' method='POST' action='./deleteProc.jsp'>
<input type="hidden" name = "id" value="<%=id %>">
<input type="hidden" name="oldfile" value="<%=oldfile %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
	<div class = "content">
	탈퇴하실 경우 회원정보는 저장되지 않으며 컨텐츠를 이용할수 없습니다.
	탈퇴를 원하시면 탈퇴버튼을 클릭하세요.
	</div>
  
  <DIV class='bottom'>
    <input type='submit' value='탈퇴'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 