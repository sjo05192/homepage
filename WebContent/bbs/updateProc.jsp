<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/bbs/ssi.jsp" %>
<jsp:useBean id="dto" class = "bbs.BbsDTO" />
<jsp:setProperty property="*" name="dto"/> 

<%
	Map map = new HashMap();
	map.put("bbsno", dto.getBbsno());
	map.put("passwd", dto.getPasswd());
	boolean pflag = dao.passwdCheck(map);
	boolean flag =  false;
	if(pflag) {
		flag = dao.update(dto);
	}
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: THE외계인설명서; 
  font-size: 20px; 
} 
*{
	margin: 10px auto;
	text-align: center;
} 
</style> 
<script type="text/javascript">
function blist(){
	var url = "list.jsp";
	url = url + "?col=<%=request.getParameter("col") %>";
	url = url + "&word=<%=request.getParameter("word")%>";
	url = url + "&nowPage<%=request.getParameter("nowPage")%>";
	location.href = url;
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 

<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<DIV class="title">処理結果</DIV>
 
<DIV class="content">
<% if (!pflag) {
	out.print("パスワードが違います.もう一度確認して下さい。");
}else if(flag){
	out.print("修正されました。");
}else{
	out.print("修正に失敗しました。");
}
	%>
  </DIV>
  
  <DIV class='bottom'>
	<% if(!pflag){ %>
    <input type='button' value='リトライ' onclick = "history.back()">
	<% }else{ %>	
    <input type='button' value='戻る' onclick= "blist()">
 
    <% } %>
  </DIV>
 
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>

</html> 
