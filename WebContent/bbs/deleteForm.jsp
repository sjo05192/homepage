<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = '/bbs/ssi.jsp' %>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	boolean flag = dao.getRefnum(bbsno);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
<style type="text/css">
* {
	font-family: THE외계인설명서;
	font-size: 20px;
}
</style>
<script type="text/javascript">
	function inputCheck(f) {
		if (f.passwd.value == "") {
			alert("비밀번호를 입력하세요");
			f.passwd.focus();
			return flase;
		}
	}
	function blist(){
		var url = "./list.jsp";
		url += "?col=<%=request.getParameter("col") %>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		location.href = url;
	}
</script>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<% 
		if(flag){
			
	%>
	<DIV class="content">答えが存在しているので、削除できません。 </div>
		<DIV class='bottom'>
			<input type='submit' value='リストへ' onclick = "blist()">
			 <input type='button' value='戻る' onclick="history.back()">
		</DIV>
		
		<% }else{ %>
	<FORM name='frm' method='POST' action='./deleteProc.jsp'
		onsubmit="return inputCheck(this)">
		<!-- 패스워드 입력창을 띄우기 위한 inputCheck -->
		<!-- this가 있는 위치의 tag가 객체 형태로 감 form => f -->
		<input type="hidden" name="bbsno" value="<%=bbsno%>">
		<input type = "hidden" name = "col" value = "<%=request.getParameter("col") %>">
		<input type = "hidden" name = "word" value = "<%=request.getParameter("word") %>">
		<input type = "hidden" name = "nowPage" value = "<%=request.getParameter("nowPage") %>">
		<div align="center">削除したら復元できません。本当に削除しますか？</div>
		<br>
		<br>
		<TABLE>
			<TR>
				<TH>パスワード入力</TH>
				<TD><input type="password" name="passwd"></TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='確認'>
			 <input type='button' value='戻る' onclick="history.back()">
		</DIV>
	</FORM>
	<% } %>
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>

</html>
