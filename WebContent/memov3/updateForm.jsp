<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/memov3/ssi.jsp"%>
<%
int memono = Integer.parseInt(request.getParameter("memono"));

	MemoDTO dto = dao.read(memono);	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: THE외계인설명서;
	font-size: 20px;
}

</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
<jsp:include page="/menu/top.jsp"/>

	<div>修正</div>
	<form name='frm' method='post' action='./updateproc.jsp'>
		<input type="hidden" name="memono" value="<%=memono %>">
		<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
		<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
		<table>
			<tr>
				<th>題目</th>
				<td><input type='text' name='title' size='30'
					value='<%=dto.getTitle() %>' /></td>
			</tr>

			<tr>
				<th>内容</th>
				<td><textarea rows='10' cols='30' name="content">
				<%= dto.getContent() %></textarea></td>
			</tr>
		</table>

		<div>
			<input type='submit' value='作成'>
		</div>
	</form>
		<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>

