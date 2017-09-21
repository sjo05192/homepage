<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/memov3/ssi.jsp" %>

<% 
	int memono = Integer.parseInt(request.getParameter("memono"));
    MemoDTO dto = dao.replyRead(memono);
%>

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
<link href = '<%=root%>/css/style.css' rel = 'stylesheet' type = 'text/css'>
</head>

<body>
<jsp:include page="/menu/top.jsp"/>
	<div class = 'title'>お答え</div>
	<form name='frm' method='post' action='./replyProc.jsp' >
	<input type = 'hidden' name = 'memono' value = '<%=memono%>'>
	<input type = 'hidden' name = 'grpno' value = '<%=dto.getGrpno()%>'>
	<input type = 'hidden' name = 'indent' value = '<%=dto.getIndent()%>'>
	<input type = 'hidden' name = 'ansnum' value = '<%=dto.getAnsnum()%>'>
		<table>
			<tr>
				<th>題目</th>
				<td><input type='text' name='title' size='30' value='<%=dto.getTitle() %>' /></td>
				
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
	<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>
