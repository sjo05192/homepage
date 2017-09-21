<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "/memov3/ssi.jsp" %>
<jsp:useBean id = "dto" class = "memo.MemoDTO" />
<jsp:setProperty name = "dto" property = "*" />


<%
	Map map = new HashMap();
	map.put("grpno", dto.getGrpno());
	map.put("ansnum", dto.getAnsnum());
	dao.upAnsnum(map);
	boolean flag = dao.replyCreate(dto);
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
	<DIV class="title">처리결과</DIV>
	<DIV class="content">
		<%
			if (flag) {
				out.print("作成しました。");
			} else {
				out.print("作成に失敗しました。");
			}
		%>
		</div>
		<DIV class='bottom'>
		<input type="button" value="戻る" onclick="mlist()">
	</div>
</body>
</html>

