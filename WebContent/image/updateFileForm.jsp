<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/image/ssi.jsp"%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
* { 
	font-size: 20px;
	font-family: MD아롱체;
	color: pink;
}

	

div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	color: red;
}

table {
	width: inherit;
	margin: 0 auto;
}

table, th, td {
	font-family: MD아롱체;
	color: pink;
	border: 1px solid gray;
	border-collapse: collapse;
}
</style>

<script type="text/javascript">
function inCheck(f){
if(f.fname.value==""){
	alert("사진을 선택하세요");
	f.fname.focus();
	return false;
}
}

</script> 
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
  
<div class="title">イラスト修正</div>
<form name='frm' method='post' 
enctype='multipart/form-data'
action='./updateFileProc.jsp'
onsubmit="return inCheck(this)"
>
<input type="hidden" name="imageno" value="<%=request.getParameter("imageno")%>">
<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile") %>">
<table>
<tr>
<th style="background-color: pink; color:white;">旧イラスト</th>
<td>
<img src="./storage/<%=request.getParameter("oldfile") %>">
원본파일명 : <%=request.getParameter("oldfile") %>
</td>
</tr>


<tr>
<th style="background-color: pink; color:white;">変更するイラスト</th>
<td>
  <input type="file" name="fname" accept=".png,.jpg,.gif">
</td>
</tr>


</table>
<div class="bottom">
<input type='submit' value="修正">
<input type="button" value="戻る" onclick="history.back()">
</div>
</form>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
 
</html> 
