<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/image/ssi.jsp" %>
<jsp:useBean id="dto" class="image.ImageDTO" />
<jsp:setProperty name="dto" property="*" />
<%
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setGrpno(Integer.parseInt(upload.getParameter("grpno")));
	dto.setIndent(Integer.parseInt(upload.getParameter("indent")));
	dto.setAnsnum(Integer.parseInt(upload.getParameter("ansnum")));
	dto.setImageno(Integer.parseInt(upload.getParameter("imageno")));
	dto.setPname(UploadSave.encode(upload.getParameter("pname")));
	dto.setPasswd(upload.getParameter("passwd"));
	String col = UploadSave.encode(upload.getParameter("col"));
	String word = UploadSave.encode(upload.getParameter("word"));
	
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int)fileItem.getSize();
	if(size > 0){
		dto.setFname(UploadSave.saveFile(fileItem, upDir));
	}
	Map<String,Object> map = new HashMap<String,Object>();
	map.put("grpno",dto.getGrpno());
	map.put("ansnum",dto.getAnsnum());
	dao.upAnsnum(map);
	boolean flag = dao.replyCreate(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function ilist(){
	var url ="./list.jsp";
	
	location.href=url;
}
function ireply(){
	var url ="./replyForm.jsp";
	url += "?imageno=<%=dto.getImageno()%>";
	
	location.href=url;
}
</script>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link type="text/css" href="<%=root%>/css/style.css" rel="stylesheet">
</head>
<body>
	<div class="title">処理結果</div>
	<div class="content">
		<%
			if (flag) {
				out.print("お答えがを作成しました。");
			} else {
				out.print("お答えを作成できませんでした。");
			}
		%>
	</div>
	<div class="bottom"> 
		<input
			type="button" value="戻る" 
			onclick="ilist()">
	</div>
</body>
</html>
