<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/memov3/ssi.jsp" %>
<jsp:useBean id = "dto" class = "memo.MemoDTO" />
<jsp:setProperty name = "dto" property = "*" />
<%
	boolean flag = dao.update(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update </title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}
</style>
<script type="text/javascript">
function mlist() {
	var url = "./list.jsp";
	url += "?col=<%=request.getParameter("col") %>";
	url += "&word=<%=request.getParameter("word") %>";
	location.href = url;
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<div class = 'content'>
		<%
			if (flag) {
				out.print("修正しました。");
			} else {
				out.print("修正に失敗しました。");
			}
		%>
		</div>
		<div>
		<br> 
		<input type="button" value="戻る" onclick="mlist()">
	</div>
</body>
</html>
