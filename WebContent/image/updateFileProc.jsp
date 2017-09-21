<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/image/ssi.jsp" %>
<%
UploadSave upload = new UploadSave(request,-1,-1,tempDir);
int imageno = Integer.parseInt(upload.getParameter("imageno"));
String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
FileItem fileItem = upload.getFileItem("fname");
int size = (int)fileItem.getSize();/* 여기서 에러 1. fname 파라미터 값 찾지 X 2. enctype : multipart/form-data */
String filename = null;
if(size>0){
	if(oldfile!=null && !oldfile.equals("ong.jpg"))
		UploadSave.deleteFile(upDir, oldfile);  //오래된 파일을 지워라
	filename = UploadSave.saveFile(fileItem, upDir); //새로운 파일을 올려라
}

Map map= new HashMap();
map.put("imageno",imageno);
map.put("fname",filename);
boolean flag= dao.updateFile(map);
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
<script type="text/javascript">
function read(){
	var url="read.jsp?imageno=<%=imageno%>";
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"  style="text-align: center;">イラスト修正</DIV>
 
<div class="content" style="text-align: center;">
<%
	if(flag){
		out.print("イラストを修正しました。");
	}else{
		out.print("修正に失敗しました。");
	}
%>
</div>
  
  <DIV class='bottom' style="text-align: center;">
  <%if(flag){ %>
    <input type='button' value='나의 정보' onclick="read()">
    <%}else{ %>
    <input type='button' value='다시시도' onclick="history.back()">
    <%} %>
  </DIV>

 

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
  
</html> 
