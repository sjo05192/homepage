<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp" %>
<jsp:useBean id="dao" class = "member.MemberDAO"/>
 <%
 	//검색관련
 	String col = Utility.checkNull(request.getParameter("col"));
 	String word = Utility.checkNull(request.getParameter("word"));
 	if(col.equals("total"))word="";
 	//페이지관련
 	int nowPage=1;
 	int recordPerPage=5;
 	if(request.getParameter("nowPage")!=null)
 		nowPage=Integer.parseInt(request.getParameter("nowPage"));

    //DB에서 가져올 순번
 	int sno = ((nowPage-1)*recordPerPage)+1;
 	int eno = nowPage*recordPerPage;			
 	Map map = new HashMap();
 	map.put("col",col);
 	map.put("word",word);
 	map.put("sno",sno);
 	map.put("eno",eno);
 	int total = dao.total(map);
 	List<MemberDTO>list = dao.list(map);
 	
    String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);

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
  text-align: center; 
}
.search{
	width:80%;
	text-align:center;
	margin:5px auto;
}
</style> 
<script type="text/javascript">
function read(id){
	var url = "<%=root%>/member/read.jsp?id="+id;
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href=url;
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">회원목록</DIV>
<!-- **검색** -->
<div class="search">
<FORM name='frm' method='POST' action='./list.jsp'>
<select name="col">
	<option value="id"
	<%if(col.equals("id"))out.print("selected='selected'"); %>
	>아이디</option>
	<option value="mname"
	<%if(col.equals("mname"))out.print("selected='selected'"); %>
	>성명</option>
	<option value="email"
	<%if(col.equals("email"))out.print("selected='selected'"); %>
	>e-mail</option>
	<option value="total">전체출력</option>
</select>
<input type="text" name="word">
<button>검색</button>
<button type="button" onclick="location.href='./agreement.jsp'">회원가입</button>
<br><br>
</FORM>
</div>

  <TABLE>
<%
for(int i=0;i<list.size();i++){
	MemberDTO dto = list.get(i);	 
%> 
    <TR>
      <TD rowspan="5" width="30%">
      	<img src="./storage/<%=dto.getFname()%>">
      </TD>
      <TH width="20%">아이디</TH>
      <TD width="50%">
      <a href="javascript:read('<%=dto.getId()%>')"><%=dto.getId()%></a></TD>
    </TR>
    <TR>
      <TH>성명</TH>
      <TD><%=dto.getMname()%></TD>
    </TR>
    <TR>
      <TH>e-mail</TH>
      <TD><%=dto.getEmail()%></TD>
    </TR>
    <TR>
      <TH>직업</TH>
      <TD><%=Utility.getCodeValue(dto.getJob())%></TD>
    </TR>
    <TR>
      <TH>등록날짜</TH>
      <TD><%=dto.getMdate()%></TD>
    </TR>
<%} %>    
  </TABLE>

  
  
  <DIV class='bottom'>
  	<%=paging %>
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 