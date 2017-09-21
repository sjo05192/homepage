<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/image/ssi.jsp"%>
<jsp:useBean id="dto" class="image.ImageDTO" />
<jsp:setProperty name="dto" property="*" />

<%
	Map map = new HashMap();
	map.put("imageno", dto.getImageno());
	map.put("passwd", dto.getPasswd());
	
	boolean pflag = dao.passwdCheck(map);
	
	boolean flag = false;
	if(pflag){
		flag=dao.update(dto);
	}
	
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
text-align:center;
  font-family: gulim; 
  font-size: 20px; 
} 
a {
	color: red;
}
</style> 
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

	<div class="title">사진정보 수정 결과</div>
	<div class="content" >
		<%
			if (!pflag) {
				out.print("비밀번호가<a> 불일치</a>합니다.");
			} else if(flag){
				out.print("사진정보 <a>수정</a>이<a> 성공</a>했습니다.");
			}else{
				out.print("사진수정 <a>수정</a>이<a> 실패</a>했습니다.");
			}
		%>
		</div>
		<div class='bottom'>
		<%if(!pflag){ %>
		<br>
		<input type='button' value='다시 시도'
		onclick="history.back()">
		<%}else{ %>
		<input type='button' value='계속 등록'
		onclick="location.href='createForm.jsp'">
		<%} %>
		<button type="button" onclick="location.href='./list.jsp'">목록</button>

	</div>








<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
 
</html> 
