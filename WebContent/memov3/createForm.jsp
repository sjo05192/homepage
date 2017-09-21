<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>create</title>
<style type="text/css">
* {
	font-family: THE외계인설명서;
	font-size: 20px;
}
</style>
<!-- <link href = '../css/style.css' rel = 'stylesheet' type = 'text/css'> -->
</head>

<body>
<jsp:include page="/menu/top.jsp"/>
	<div class="container"> 
<h2>등록</h2>
	<form name='frm' method='post' action='./createProc.jsp'>
		<table class="table table-bordered">
			<tr>
				<th>題目</th>
				<td><input type='text' name='title' size='30' /></td>
			</tr>

			<tr>
				<th>内容</th>
				<td><textarea rows='10' cols='30' name='content'></textarea></td>
			</tr>
		</table>

		<div class = 'bottom'>
			<input type='submit' value='作成'>
		</div>
	</form>
	</div>
	<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>
