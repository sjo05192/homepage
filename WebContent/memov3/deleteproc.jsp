<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/memov3/ssi.jsp" %>

<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	Integer.parseInt(request.getParameter("memono"));
	boolean flag = dao.delete(memono);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete </title>
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
				out.print("削除しました。");
			} else {
				out.print("削除できませんでした。");
			}
		%>
		<br>  
		<input type="button" value="戻る" onclick="location.href='./list.jsp'">
	</div>
</body>
</html>

