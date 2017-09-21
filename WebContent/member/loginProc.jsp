<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/member/ssi.jsp"%>
<jsp:useBean id="dao" class = "member.MemberDAO"/>s
<%
String id = request.getParameter("id");
String passwd  = request.getParameter("passwd");
Map map = new HashMap();
map.put("id",id);
map.put("passwd",passwd);

boolean flag = dao.loginCheck(map);

if(flag){
	String grade = dao.getGrade(id);
	session.setAttribute("id",id);
	session.setAttribute("grade",grade);
}
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">로그인 처리</DIV>
 
<div class = "content">
<%
if(flag){
	out.print("로그인 되었습니다.");
	Cookie cookie = null;
	
	 String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부 
     
	    if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
	      cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
	      cookie.setMaxAge(120);               // 2 분 유지 
	      response.addCookie(cookie);          // 쿠키 기록 
	   
	      cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
	      cookie.setMaxAge(120);               // 2 분 유지 
	      response.addCookie(cookie);          // 쿠키 기록  
	         
	    }else{ 
	      cookie = new Cookie("c_id", "");     // 쿠키 삭제 
	      cookie.setMaxAge(0); 
	      response.addCookie(cookie); 
	         
	      cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
	      cookie.setMaxAge(0); 
	      response.addCookie(cookie); 
	    } 
}else{
	out.print("아이디/비밀번호가 잘못입력되었거나<br>");
	out.print("회원이 아닙니다. 회원가입을 하세요.");
}
%>
</div>
  
  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="history.back()">
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 