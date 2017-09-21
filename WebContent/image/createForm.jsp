<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html> 
<html>  
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"> [ イラスト投稿 ] </DIV>
 
<FORM name='frm' method='POST' action='./createProc.jsp' enctype="multipart/form-data">
  <TABLE class="table table-bordered">
    <TR>
      <TH>作成者</TH>
      <TD><input type="text" name="pname"></TD>
    </TR>
    <TR>
      <TH>題目</TH>
      <TD><input type="text" name="title"></TD>
    </TR>
    <TR>
      <TH>内容</TH>
      <TD><textarea name="content" cols="35" rows="5"></textarea></TD>
    </TR>
    <TR>
      <TH>パスワード</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
    <TR>
      <TH>ファイル</TH>
      <TD><input type="file" name="fname"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='投稿'>
    <input type='button' value='戻る' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
