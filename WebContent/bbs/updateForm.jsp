<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/bbs/ssi.jsp" %>
<% 
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = dao.read(bbsno);
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>更新</title> 

<style type="text/css"> 
*{ 
  font-family: THE외계인설명서; 
  font-size: 20px; 
} 
</style> 

<script type="text/javascript">
function inCheck(f){
	if(f.wname.value==""){
		alert("名前を入力してください。");
		f.wname.focus();
	return false;
	}
	if(f.title.value==""){
		alert("題目を入力してください。");
		f.title.focus();
	return false;
	}
	if(f.content.value==""){
		alert("内容を入力してください。");
		f.content.focus();
	return false;
	}
	if(f.passwd.value==""){
		alert("パスワードを入力してください。");
		f.passwd.focus();
	return false;
	}
}
</script>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 


<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
 
<DIV class="title">修正</DIV>

<FORM name='frm' method='POST' action='./updateProc.jsp' 
		onsubmit = "return inCheck(this)">
<!-- 		this = 현재 있는 태그 => form -->

<input type = "hidden" name = "bbsno" value = "<%=bbsno %>">
<input type = "hidden" name = "col" value = "<%=request.getParameter("col") %>">
<input type = "hidden" name = "word" value = "<%=request.getParameter("word") %>">
<input type = "hidden" name = "nowPage" value = "<%=request.getParameter("nowPage") %>">
  <TABLE>
    <TR>
      <TH>성명</TH>
      <TD><input type = "text" name = "wname"  value = "<%=dto.getWname() %>"></TD>
    </TR>
    
     <TR>
      <TH>제목</TH>
      <TD><input type = "text" name = "title"  value = "<%=dto.getTitle() %>"></TD>
    </TR>
    
     <TR>
      <TH>내용</TH>
      <TD><textarea rows = "10" cols = "45" name = "content">
      <%=dto.getContent() %></textarea></TD>
<!--       name => setProperty , request.getParameter -->
    </TR>
    
     <TR>
      <TH>비번</TH>
      <TD><input type = "password" name = "passwd"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='修正'>
    <input type='button' value='戻る' onclick="history.back()">
<!--     history.back()  바로 전 화면으로 이동 -->
  </DIV>
</FORM>
 
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html> 
