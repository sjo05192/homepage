<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/memov3/ssi.jsp"%>
<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	String col = request.getParameter("col");
	String word = request.getParameter("word");
	/* 조회수 증가 */
	dao.upviewcnt(memono);
	/* 조회수 증가 end*/

	/* 조회 */
	MemoDTO dto = dao.read(memono);
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>what am i doing here</title>
<style type="text/css">
* {
	font-family: THE외계인설명서;
	font-size: 24px;
}
</style>
<link href='<%=root%>/css/style.css' rel='stylesheet' type='text/css'>

<script type="text/javascript">

function mupdate(memono){
	var url = "./updateform.jsp";
	url += "?memono="+memono;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	location.href=url;
	}
function mdelete(memono){
	var url = "./deleteform.jsp";
	url += "?memono="+memono;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	location.href=url;
	}
function mreply(memono){
	var url = "./replyForm.jsp";
	url += "?memono="+memono;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
		location.href = url;
	}
function mlist() {
	var url = "./list.jsp";
	url += "?col=<%=request.getParameter("col") %>";
	url += "&word=<%=request.getParameter("word") %>";
	location.href = url;
}
</script>
</head>

<body>
	<jsp:include page="/menu/top.jsp" />

	<div class='title'>照会</div>
	<table>
		<tr>
			<th>題目</th>
			<td><%=dto.getTitle()%></td>
		</tr>
		<tr>
			<th>内容</th>
			<td><%=content%></td>
		</tr>
		<tr>
			<th>クリック数</th>
			<td><%=dto.getViewcnt()%></td>
		</tr>
		<tr>
			<th>作成日時</th>
			<td><%=dto.getWdate()%></td>
		</tr>

	</table>
	<div class='bottom'>
		<input type="button" value="作成"
			onclick="location.href = './createform.jsp'"> <input
			type="button" value="修正" onclick="mupdate('<%=memono%>')"> <input
			type="button" value="削除" onclick="mdelete('<%=memono%>')"> <input
			type="button" value="お答え" onclick="mreply('<%=memono%>')"> <input
			type="button" value="目録" onclick="mlist()">
		<!-- memono 라는 primary key 를 가져감 -->
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>
</html>

