<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/image/ssi.jsp"%>
<%
	int imageno = Integer.parseInt(request.getParameter("imageno"));
	ImageDTO dto = dao.read(imageno);
%>
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

.title { 
	
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
if(f.fname.value=="")
	alert("イラストを選んでください。");
	f.fname.focus();
	return false;
}
</style>

<script type="text/javascript">
function inCheck(f){
	if(f.pname.valuse==""){
		alert("イラストの名前を入力してください。");
		f.wname.focus();
		return false;
	}
	
	if(f.title.valuse==""){
		alert("題目を入力してください。");
		f.title.focus();
		return false;
	}
	if(f.content.valuse==""){
		alert("内容を入力してください。");
		f.content.focus();
		return false;
	}
	if(f.passwd.valuse==""){
		alert("パスワードを入力してください。");
		f.passwd.focus();
		return false;
	}
	
}

</script>

</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<div class="title">イラスト情報修正</div>
	<form name="frm" method='post' action="./updateProc.jsp"
	  onsubmit="return inCheck(this)">
		<input type="hidden" name="imageno" value="<%=imageno%>">
		<table>
			<tr>
				<th style="background-color: pink; color: white;">イラスト</th>
				<td><img style="margin-left: 60px; margin-right: 25px;"
					width="60%" src="./storage/<%=dto.getFname()%>"></td>
			</tr>

			<tr>
				<th style="background-color: pink; color: white;">投稿者</th>
				<td><input type="text" name="pname" style="width: 510px;"
					value="<%=dto.getPname()%>"></td>
			</tr>

			<tr>

				<th style="background-color: pink; color: white;">題目</th>
				<td><input type="text" name="title" value="<%=dto.getTitle()%>"
					style="width: 510px;"></td>
			</tr>
			<TR>
				<TH style="background-color: pink; color: white;">内容</TH>
				<TD><textarea rows="10" cols="45" name="content"><%=dto.getContent()%></textarea>
				</TD>
			</TR>
     <TR>
      <TH>パスワード</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>

		</table>
		  <DIV class='bottom'>
    <input type='submit'  style="background-color: pink; color: white;" value='修正'>
    <input type='button' style="background-color: pink; color: white;" value='戻る' onclick="history.back()">
  </DIV>
		
	</form>



	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->

</html>
