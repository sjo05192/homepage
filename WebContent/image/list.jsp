<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/image/ssi.jsp"   %> 
<%
	
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
		//갯파라미터로 콜이랑워드를 object로 가져와서 지정해준걸로 변환해
	
		if (col.equals("total"))
		word = "";
		
	int nowPage = 1;
	if(request.getParameter("nowPage") != null){  //갯파라미터로 일단 나우페이지를 어떤형식이든 가져와 
		nowPage = Integer.parseInt(request.getParameter("nowPage")); //그리고 널값이 아니면 여기서 이제 인티저로형변환해
	}
	int recordPerPage = 3;
	int sno = ((nowPage-1)*recordPerPage) +1;
	int eno = nowPage * recordPerPage;
	
	Map<String,Object> map = new HashMap<String,Object>();
	map.put("col", col); //문자열이든뭐든 일단 오브젝트로가져와서 선정햊ㅁ~
	map.put("word",word);
	map.put("sno",sno);
	map.put("eno", eno);
	List<ImageDTO> list = dao.list(map);
	int total = dao.total(map); 
%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css">
* {
	font-family: MD아롱체;
	font-size: 20px;
}

.title {
	
}

div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

table {
	width: 100px;
	margin: 0 auto;
}

table, th, td {
text-align:center;
	border: 1px solid gray;
	border-collapse: collapse;
}

th, td {
	padding: 10px
}

a:LINK {
	color: ##234;
	text-decoration: none;
}

a:VISITED {
	color: #000000;
	text-decoration: none;
}

a:HOVER {
	color: #ff0000;
	text-decoration: none;
}

a:ACTIVE {
	color: #ff2487;
	text-decoration: none;
}
</style>
 
<script type="text/javascript">
function read(imageno){
	var url = "./read.jsp";
	url += "?imageno="+imageno;
	url = url+ "&oldfile=<%=request.getParameter("oldfile")%>";
	url = url+ "&col=<%=request.getParameter("col")%>";
	url = url+ "&word=<%=request.getParameter("word")%>";
	location.href = url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
<DIV class="title" style="color:red;"> [ イラスト集 ] </DIV>
 <div class=search>
<form method="post" action="./list.jsp">
			<select name="col">
				<option value="pname">投稿者</option>
				<%
					if (col.equals("wdate"))
						out.print("selected='selected'");
				%>
				<option value="title">題目</option>
				<%
					if (col.equals("title"))
						out.print("selected='selected'");
				%>
				<option value="content">内容</option>
				<%
					if (col.equals("content"))
						out.print("selected='selected'");
				%>
				<option value="전체출력">全体出歴</option>
			</select> <input type="text" name="word">
			<button>検索</button>
			<button type="button" onclick="location.href='./createForm.jsp'">登録</button>
		</form>
	</DIV>

  <TABLE>
    <TR>
  	<% for(int i=0; i<list.size(); i++){ 
  		ImageDTO dto = list.get(i);
  	%>
      <TH style=" color:black;"colspan="6">
<%
					for (int j = 0; j < dto.getIndent(); j++) {
								out.print("&nbsp;");

							}
							if (dto.getIndent() > 0) {
								out.print("<img src='../images/re.jpg'>");
							}
				%>
			
      
      <%=dto.getImageno() %>
      </TH>
      <%} %>
    </TR>
    <tr>
    <% for(int i=0; i<list.size(); i++){ 
  		ImageDTO dto = list.get(i);
  	%>
    	<TD colspan="6"> <img src ="./storage/<%=dto.getFname() %>" width="300px"></TD>
    <%} %>
    </tr>
    <tr>
    <% for(int i=0; i<list.size(); i++){ 
  		ImageDTO dto = list.get(i);
  	%>
    	<td colspan="6" style="background-color: black; color:white;"> <a href="javascript:read('<%=dto.getImageno()%>')">
    	<%=dto.getTitle() %></a></td>
    <%} %>
    </tr>
    <tr>
    <% for(int i=0; i<list.size(); i++){ 
  		ImageDTO dto = list.get(i);
  	%>
    <th style="background-color: white; color:black;">Grpno</th>
    			<td style="color:black;"><%=dto.getGrpno()%></td>
    			<th style="background-color: white; color:black;">Indent</th>
			<td style="color:black;"><%=dto.getIndent()%></td>
    			<th style="background-color: white; color:black;">Ansnum</th>
			<td style="color:black;"><%=dto.getAnsnum()%></td>
    
		<%
			}
			
		%>
    </tr>



	</table>
	<div class='bottom'>

		<%=Utility.paging3(total, nowPage, recordPerPage, col, word)%>
	</div>


	<jsp:include page="/menu/bottom.jsp" flush="false" />

</body>
</html>
