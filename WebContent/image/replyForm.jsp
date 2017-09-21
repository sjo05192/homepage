<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/image/ssi.jsp" %>
<%
	int imageno = Integer.parseInt(request.getParameter("imageno"));
	ImageDTO dto = dao.replyRead(imageno);
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root %>/css/style.css" rel="stylesheet" 
type="text/css">
</head> 
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="title">답변</div>
<form name="frm" method="POST" action="./replyProc.jsp" enctype="multipart/form-data">
<input type="hidden" name="imageno" value="<%=imageno%>">
<input type="hidden" name="grpno" value="<%=dto.getGrpno()%>">
<input type="hidden" name="indent" value="<%=dto.getIndent()%>">
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum()%>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">

		<table>
			<tr>
				<th>作成者</th>
				<td><input type="text" name="pname" size="45"
					value="<%=dto.getPname()%>" /></td>
			</tr>
			<tr>
				<th>題目</th>
				<td><input type="text" name="title" size="45"
					value="<%=dto.getTitle()%>のお答え" /></td>
			</tr>
			<tr>
				<th>内容</th>
				<td><textarea rows="10" cols="45" name="content"></textarea>
				</td>
				
			</tr>
			<tr>
				<th>お答えイラスト</th>
				<td ><input type="file" name="fname" accept=".png,.jpg,.gif">
				</td>
			</tr>
			<tr>
				<th>パスワード</th>
				<td ><input type="password" name="passwd">
				</td>
			</tr>
		</table>
		<div class="bottom">
<input type="submit" value="登録">
</div>

</form>
<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html>