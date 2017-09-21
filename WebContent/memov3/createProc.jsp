<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/memov3/ssi.jsp" %>
<jsp:useBean id = "dto" class = "memo.MemoDTO" />
<jsp:setProperty name = "dto" property = "*" />

<%
	boolean flag = dao.create(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>create</title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}

</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<div>
		<%
			if (flag) {
				out.print("作成しました。");
			} else {
				out.print("作成に失敗しました。");
			}
		%>
		<br>  
		<input type="button" value="戻る" onclick="location.href='./list.jsp'">
	</div>
</body>
</html>

