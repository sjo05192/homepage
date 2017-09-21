<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/image/ssi.jsp"   %> 
<%
	int imageno = Integer.parseInt(request.getParameter("imageno"));
	ImageDTO dto = dao.read(imageno);
	List list = dao.readImg(imageno);
	int[] arrNo = (int[])list.get(0);
	String[] fileName = (String[])list.get(1);
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
  text-align : center;
} 
textarea {
	background-color :white;
}
img {
	display: block;
	margin-left: auto;
	margin-right: auto;
	text-align : center;
	
}
.t2 {
	width: 50%;
	height: 100px;  
}
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function preply(){
	var url = "replyForm.jsp";
	url += "?imageno=<%=imageno%>";
 	url += "&oldfile=<%=dto.getFname()%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	
	location.href=url;
}

function pdelete(){
	var url = "deleteForm.jsp";
	url += "?imageno=<%=imageno%>";
	url += "&oldfile=<%=dto.getFname()%>"
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	
	location.href=url;
}

function pupdate(){
	var url = "updateForm.jsp";
	url += "?imageno=<%=imageno%>";
 
	url += "&oldfile=<%=dto.getFname()%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	
	location.href=url;
}

function pupdateFile(){
	var url = "updateFileForm.jsp";
	url += "?imageno=<%=imageno%>";
	url += "&oldfile=<%=dto.getFname()%>";
	url += "&col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	
	location.href=url;
}

function read(imageno){
	var url = "read.jsp";
	url += "?imageno="+imageno;
	location.href = url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"> [ イラスト ] </DIV>
 
<FORM name='frm' method='POST' action='./.do'>
  <TABLE>
    <TR>
      <TD colspan="2"><img src="./storage/<%=dto.getFname()%>"></TD>
    </TR>
    <TR>
      <TH>イラスト番号</TH>
      <TD><%=dto.getImageno() %></TD>
    </TR>
    <TR>
      <TH>作成者</TH>
      <TD><%=dto.getPname() %></TD>
    </TR>
    <TR>
      <TH>題目</TH>
      <TD><%=dto.getTitle()%></TD>
    </TR>
    <TR>
      <TH>内容</TH>
      <TD><textarea rows="5" cols="35" name="content" disabled="disabled"><%=dto.getContent() %></textarea> </TD>
    </TR>
    <TR>
      <TH>作成日時</TH>
      <TD><%=dto.getWdate() %></TD>
    </TR>
  </TABLE>
  <br><br>
  
  
  <!-- ㅆㅓㅁㄴㅔㅇㅣㄹㅇㅣㅁㅣㅈㅣ -->
  <div >
  <table style="width: 70%; ">
  		<tr >
  		<%
  			for(int i=0; i<5; i++){
  		%>
  		<td style="width: 100px; height: 10px">
  				<%
  				if(fileName[i] == null){
  				%>
  					<img src="./storage/default.png " style="width: 100px; height: 50px; ">
  				<%
  				}else{
  					if(arrNo[i] == imageno){
  				%>
	  				<a href="javascript:read('<%=arrNo[i]%>')">
	  				<img src="./storage/<%=fileName[i]%> " style="width: 100px; height: 50px; border: 2px solid red;">
	  				</a>
	  			<%
  					}else{
	  			%>	
	  				<a href="javascript:read('<%=arrNo[i]%>')">
	  				<img src="./storage/<%=fileName[i]%> " style="width: 100px; height: 50px;">
	  				</a>
	  			<%  } %>
  		</td>
  		<% 
  				}
  			} 
  		%>
  		</tr>
  
  </table>
  </div>
</FORM>
  <DIV class='bottom'>
    <input type='button' value='修正' onclick="pupdate()">
    <input type='button' value='イラスト修正' onclick="pupdateFile()">
    <input type='button' value='お答え' onclick="preply()">
    <input type='button' value='削除' onclick="pdelete()">
    <input type='button' value='戻る' onclick="location.href='./list.jsp'">
  </DIV>
 
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
