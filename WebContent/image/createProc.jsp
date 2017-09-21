<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/image/ssi.jsp"   %>
<jsp:useBean id="dto" class="image.ImageDTO"/> 

<%
	UploadSave upload = new UploadSave(request ,-1,-1,tempDir);
	dto.setPname(UploadSave.encode(upload.getParameter("pname")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(upload.getParameter("passwd"));
	
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int)fileItem.getSize();
	if(size > 0){
		dto.setFname(UploadSave.saveFile(fileItem, upDir));
	}
	boolean flag= dao.create(dto);
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
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"> [ イラスト投稿 ] </DIV>
	<div class="content">
	<%
		if(flag){
			out.print("投稿されました。");
		}else {
			out.print("失敗しました。");
		}
	%>
  	</div>
  <DIV class='bottom'>
    <input type='button' value='戻る'  onclick="location.href='./list.jsp'">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
