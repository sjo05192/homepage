<%@page import="utility.UploadSave"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/image/ssi.jsp" %>

<%
	int imageno = Integer.parseInt(request.getParameter("imageno"));
	boolean flag = dao.getRefnum(imageno);
%>



<!DOCTYPE html> 
<html> 
<head>
<meta charset="UTF-8"> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px;
  text-align: center; 
} 

</style>
<script type="text/javascript">
function inCheck(f){
	if(f.passwd.valuse==""){
		alert("パスワードを入力してください。");
		f.passwd.focus();
		return false;
	}
	}

</script>
 </head>
 <body>
 <%
if(flag){
%>
<div class="content" style="color:red;">
お答えが存在するので削除できません。
</div>
	 <div class="bottom">

	 <button type="button" onclick="location.href='./list.jsp'">戻る</button>
	 
	 </div>

<%}else{ %>

<form action="deleteProc.jsp" method="post" onsubmit="return inCheck(this)">
<input type="hidden" name="imageno" value="<%=imageno%>">
<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile")%>">

<div>削除した後には復元はできません。<br><br>
	  本当に削除しますか？<br><br>
	<br><br>
	 </div>
	      <TR>
      <TH>パスワード</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
	 <div class="bottom">
	 <br>
	 <input type='submit'  style="background-color: pink; color: white;" value='削除'>
    <input type='button' style="background-color: pink; color: white;" value='戻る' onclick="location.href='./list.jsp'">
	 
	 </div>
	 </form>

<%
}
%>


</body>