<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/bbs/ssi.jsp" %>
<%
int bbsno = Integer.parseInt(request.getParameter("bbsno"));
dao.upViewcnt(bbsno);
BbsDTO dto = dao.read(bbsno);
String content = dto.getContent();
content = content.replaceAll("\r\n", "<br>");
%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>読んでいるサイト</title> 
<style type="text/css"> 
*{ 
  font-family: THE외계인설명서; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function blist(){
	var url = "./list.jsp";
	url += "?col=<%=request.getParameter("col") %>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
}
function bupdate(){
	var url = "updateForm.jsp";
	url += "?bbsno=<%=bbsno%>";
	url += "&col=<%=request.getParameter("col") %>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
}
function bdelete(){
	var url = "deleteForm.jsp";
	url += "?bbsno=<%=bbsno%>";
	url += "&col=<%=request.getParameter("col") %>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
}
function breply(){
	var url = "replyForm.jsp";
	url += "?bbsno=<%=bbsno%>";
	url += "&col=<%=request.getParameter("col") %>";
	url += "&word=<%=request.getParameter("word")%>";
	url += "&nowPage=<%=request.getParameter("nowPage")%>";
	location.href = url;
}

</script>
</head> 

<body>
<jsp:include page="/menu/top.jsp" flush="false"/>

 
<DIV class="title"><span class="glyphicon glyphicon-th-list"></span>照会</DIV>
  <TABLE class = "table table-hover">
    <TR>
      <TH>題目</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
  	 <TR>
      <TH>内容</TH>
      <TD><%=dto.getContent() %></TD>
    </TR>
     <TR>
      <TH>名前</TH>
      <TD><%=dto.getWname() %></TD>
    </TR>
     <TR>
      <TH>登録日時</TH>
      <TD><%=dto.getWdate() %></TD>
    </TR> 
    <TR>
      <TH>クリック数</TH>
      <TD><%=dto.getViewcnt() %></TD>
    </TR>
      </TABLE>
    
  <DIV class='bottom'>
    <input type='button' value='登録'  onclick="location.href='createForm.jsp'">
    <input type='button' value='リストへ' onclick = "blist()">
    <input type='button' value='修正' onclick = "bupdate()">
    <input type='button' value='削除' onclick="bdelete()">
    <input type='button' value='答えする' onclick="breply()">
  </DIV>

 
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>

</html> 
