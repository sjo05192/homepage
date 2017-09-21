<%@ page contentType="text/html; charset=UTF-8" %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
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
		alert("パスワードが違います");
		f.passwd.focus();
	return false;
	}
}
</script>
<!-- <link href="../css/style.css" rel="Stylesheet" type="text/css"> -->
</head> 


<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
 <div class="container"> 
<h2>作成</h2>
<FORM name='frm' method='POST' action='./createProc.jsp' 
		onsubmit = "return inCheck(this)">
<!-- 		this = 현재 있는 태그 => form -->
   <TABLE class="table table-bordered">
    <TR>
      <TH>名前</TH>
      <TD><input type = "text" name = "wname"></TD>
    </TR>
     <TR>
      <TH>題目</TH>
      <TD><input type = "text" name = "title"></TD>
    </TR>
     <TR>
      <TH>内容</TH>
      <TD><textarea rows = "10" cols = "45" name = "content"></textarea></TD>
<!--       name => setProperty , request.getParameter -->
    </TR>
     <TR>
      <TH>パスワード</TH>
      <TD><input type = "password" name = "passwd"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='作成'>
    <input type='button' value='キャンセル' onclick="history.back()">
<!--     history.back()  바로 전 화면으로 이동 -->
  </DIV>
</FORM>
 </div>
 
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html> 
