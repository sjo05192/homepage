<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/memov3/ssi.jsp"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	boolean flag = dao.getRefnum(memono);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete form</title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
	text-align: center;
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
	<jsp:include page="/menu/top.jsp" />
	<div class='title'>削除確認</div>
	<%
		if (flag) {
	%>
	<div class="content">お答えが存在するので削除できません。</div>
	<div class='bottom'>
		<button type="button" onclick="history.back()">戻る</button>
		<button type="button" onclick="mlist()">リストへ</button>
	</div>
	<%
		} else {
	%>
	<form action="deleteproc.jsp" method='post'>
		<input type="hidden" name="memono" value="<%=memono%>">
		<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
		<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
		

		<pre>
削除した後には復元できません。
本当に削除しますか？
 </pre>

		<div class='bottom'>
			<button type="submit">削除</button>
			<button type="button" onclick="mlist()">戻る</button>
		</div>
		
	</form>
	<%
		}
	%>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>
