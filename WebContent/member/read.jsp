<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp" %>
<jsp:useBean id="dao" class = "member.MemberDAO"/>
 <%
 	String id = request.getParameter("id");
 	if(id==null)id=(String)session.getAttribute("id");
 	MemberDTO dto = dao.read(id);
 	
 	String nowPage = request.getParameter("nowPage");
 	String col = request.getParameter("col");
 	String word = request.getParameter("word");
 	
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
</style>
<script type = "text/javascript">
function down(){
	var url = "<%=root%>/download";
	url += "?dir=/member/storage";
	url += "&filename=<%=dto.getFname()%>";
}
function update(){
	var url = "updateForm.jsp";
	url += "?id=<%=id%>";
	
	
	location.href=url;
}
function del(){
	var url = "deleteForm.jsp";
	url += "?id=<%=id%>";
	url += "&oldfile=<%=dto.getFname()%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	
	location.href=url;
}
function updatePw(){
	var url = "updatePwForm.jsp";
	url += "?id=<%=id%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href=url;
}
function updateFile(){
	var url = "updateFileForm.jsp";
	url += "?id=<%=id%>";
	url += "&oldfile=<%=dto.getFname()%>";
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
 
<DIV class="title"><%=dto.getMname() %>의 회원정보</DIV>
 
  <TABLE>
    <TR>
      <TD colspan="2">
      <img src="./storage/<%=dto.getFname()%>">
      </TD>

    </TR>
    <TR>
      <TH>아이디</TH>
      <TD><%=dto.getId() %></TD>
    </TR>
    <TR>
      <TH>성명</TH>
      <TD><%=dto.getMname() %></TD>
    </TR>
    <TR>
      <TH>전화번호</TH>
      <TD><%=Utility.checkNull(dto.getTel()) %></TD>
    </TR>
    <TR>
      <TH>이메일</TH>
      <TD><%=dto.getEmail() %></TD>
    </TR>
    <TR>
      <TH>우편번호</TH>
      <TD><%=Utility.checkNull(dto.getZipcode()) %></TD>
    </TR>
    <TR>
      <TH>주소</TH>
      <TD>
      <%=Utility.checkNull(dto.getAddress1()) %>
      <%=Utility.checkNull(dto.getAddress2()) %>
      </TD>
    </TR>
    <TR>
      <TH>직업</TH>
      <TD>
      	직업코드:<%=dto.getJob() %>
      	(<%=Utility.getCodeValue(dto.getJob())%>)
      </TD>
    </TR>
    <TR>
      <TH>등록날짜</TH>
      <TD><%=dto.getMdate() %></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='정보수정' onclick="update()">
    <input type='button' value='비밀번호수정' onclick="updatePw()">
    <input type='button' value='사진수정' onclick="updateFile()">
 
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 