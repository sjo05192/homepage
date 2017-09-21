<%@page import="utility.UploadSave"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/image/ssi.jsp" %>

<%
	int imageno = Integer.parseInt(request.getParameter("imageno"));
	String passwd=request.getParameter("passwd");
	Map map = new HashMap();
	map.put("imageno", imageno);
	map.put("passwd", passwd);
	
	boolean pflag = dao.passwdCheck(map);
	
	boolean flag = false;
	if(pflag){
		flag=dao.delete(imageno);
	}
	
%>
<%
	String oldfile = request.getParameter("oldfile");
	System.out.println("oldfile--"+oldfile);
	if (flag && oldfile != null && !oldfile.equals("ong.jpg")) {
		UploadSave.deleteFile(upDir, oldfile);
	}
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	font-size: 20px;
}

div{
text-align: center; 
}

a{
color:red;}

</style>

</head>
<!-- *********************************************** -->
<body> 
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
	<div class="title">処理結果</div>
	<br>
	<div class="content" >
		<%
			if (!pflag) { 
				out.print("パスワードが<a> 違い</a>ます。.");
		 	} else if(flag){
				out.print("イラストを <a>削除</a> <a>しま</a>した。");
			}else{
				out.print("イラスト<a>削除</a>に <a>失敗</a>しました。");
			}
		%>
		</div>
		<br>
		<div class='bottom'>
		<%if(!pflag){ %>
		<br>
		<input type='button' value='もう一度確認'
		onclick="history.back()">
		<%}else{ %>
		<input type='button' value='戻る'
		onclick="location.href='./list.jsp'">
		<%} %>

	</div>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html>
