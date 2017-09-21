<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/bbs/ssi.jsp"%>
<%
	//검색관련
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if (col.equals("total")) {
		word = "";
	}
	//페이지관련
	int nowPage = 1; //현재 보고있는 페이지
	if(request.getParameter("nowPage") != null){
	nowPage =  Integer.parseInt(request.getParameter("nowPage"));
	}
	int recordPerPage = 10; //한 페이지당 보여줄 레코드 갯수
	//DB에서 데이터를 가져올 순번 
	int sno = ((nowPage -1) * recordPerPage)+1; 
	int eno = nowPage*recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	List<BbsDTO> list = dao.list(map);
	int totalRecord = dao.total(map);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>芳名録</title>

<style type="text/css">
* {
	font-family: THE외계인설명서;
	font-size: 20px;
}

.search {
	width: 80%;
	margin: 10px auto;
	text-align: center;
}
</style>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<script type="text/javascript">
	function bread(bbsno) {
		var url = "./read.jsp";
		url += "?bbsno=" + bbsno;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		
		location.href = url;
	}
</script>
</head>

<body>
	<jsp:include page="/menu/top.jsp" flush="false" />

	<div class='search'>
		<form method='post' action="./list.jsp">
			<select name='col'>
				<option value="wname"
					<%if (col.equals("Wname"))
				out.print("select='selected'");%>>名前</option>
				<option value="title"
					<%if (col.equals("title"))
				out.print("select='selected'");%>>タイトル</option>
				<option value="content"
					<%if (col.equals("content"))
				out.print("select='selected'");%>>内容</option>
				<option value="total">全体出歴</option>
			</select> <input type='text' name='word'>
			<button>検索</button>
			<button type='button' onclick="location.href='./createForm.jsp'">作成</button>
		</form>
	</div>
<div class="container">
<h2><span class="glyphicon glyphicon-th-list"></span>芳名録</h2>
	<TABLE class = "table table-hover">
		<thead>
		<TR>
			<TH>NO</TH>
			<TH>題目</TH>
			<TH>名前</TH>
			<TH>クリック数</TH>
			<TH>作成日時</TH>
			<TH>grpno</TH>
			<TH>indent</TH>
			<TH>ansnum</TH>
		</TR>
	</thead>
		<%
			if (list.size() == 0) {
		%>
		<tr>
			<td colspan='8'>作成したものがありません。</td>
		</tr>
		<%
			} else {
				for (int i = 0; i < list.size(); i++) {
					BbsDTO dto = list.get(i);
		%>
		<tr>
			<td><%=dto.getBbsno()%></td>
			<td>
				<%
					for (int j = 0; j < dto.getIndent(); j++) {
								out.print("&nbsp; &nbsp; &nbsp;");
							}
							if (dto.getIndent() > 0)
								out.print("<img src='../images/re.jpg'>");
				%> <a href="javascript:bread('<%=dto.getBbsno()%>')"> <%=dto.getTitle()%></a>
			</td>
			<td><%=dto.getWname()%></td>
			<td><%=dto.getViewcnt()%></td>
			<td><%=dto.getWdate()%></td>
			<td><%=dto.getGrpno()%></td>
			<td><%=dto.getIndent()%></td>
			<td><%=dto.getAnsnum()%></td>
		</tr>
		<%
			}
			}
		%>
	</TABLE>
	</div>

	<DIV class='bottom'>
		<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
	</DIV>


	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
</html>
