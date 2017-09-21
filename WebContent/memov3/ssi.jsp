<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="memo.MemoDTO, java.util.*, utility.Utility"%>

<!-- 객체생성 -->
<jsp:useBean id = "dao" class = "memo.MemoDAO"/>
									<!-- 패키지명.CLASS -->
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();

%>
