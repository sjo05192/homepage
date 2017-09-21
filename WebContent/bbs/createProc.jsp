<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/bbs/ssi.jsp" %>
<jsp:useBean id="dto" class = "bbs.BbsDTO" />
<jsp:setProperty property="*" name="dto"/> 

<%
	boolean flag = dao.create(dto);
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
	
	location.href = url;
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 

<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<DIV class="title">結果</DIV>
 
<DIV class="content">
<% if (flag) {
	out.print("作成しました。");
}else{
	out.print("作成できません。");
}
	%>
  </DIV>
  
  <DIV class='bottom'>
    <input type='button' value='戻る' onclick= "blist()">
  </DIV>
 
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>

</html> 
