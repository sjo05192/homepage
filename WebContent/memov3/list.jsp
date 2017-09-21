<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/memov3/ssi.jsp"%>

<%
	//검색관련 
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if (col.equals("total")) {
		word = "";
	}
	
	//--page관련
	int nowPage = 1;
	int recordPerPage =10;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	//DB에서 가져올 순번
	int sno = ((nowPage-1)*recordPerPage) +1;
	int eno = nowPage * recordPerPage;
	
	//페이지관련
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	int total = dao.total(map);
	List<MemoDTO> list = dao.list(map);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<style type="text/css">
* {
	font-family: THE외계인설명서;
	font-size: 24px;
}

.search {
	width: 80%;
	text-align: center;
	margin: 10px auto;
}
</style>
<!-- 스타일 추가 -->
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<script type="text/javascript">
	function read(memono) {
		var url = "./read.jsp";
		url += "?memono=" + memono;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		//alert(url);
		location.href = url;
	}
</script>
</head>


<body>
	<jsp:include page="/menu/top.jsp" />
	<div class='title'></div>
	<div class='search'>
		<form method='post' action='./list.jsp'>
			<select name = 'col'>
				<option value='title'
				<% 
					if(col.equals("title")) 
					out.print("select='selected'"); 
				%>
				>제목</option>
				<option value='content'
				<% 
					if(col.equals("content")) 
					out.print("select='selected'"); 
				%>
				>내용</option>
				<option value='total'>全体出歴</option>
			</select> <input text='text' name='word' value='<%=word%>'>
			<button>検索</button>
			<button type='button' onclick="location.href = './createForm.jsp'">作成</button>
		</form>
	</div>
<div class="container">
<h2><span class="glyphicon glyphicon-th-list"></span>目録</h2>
  <TABLE class="table table-hover">
  <thead>
		<tr>
			<th>番号</th>
			<th>題目</th>
			<th>作成日時</th>
			<th>クリック数</th>
			<th>grpno</th>
			<th>indent</th>
			<th>ansnum</th>
		</tr>
		</thead>

		<%
			if (list.size() == 0) {
		%>
		<tbody>
				<tr>
			<td colspan="7">作成したものがありません。</td>
		</tr>
		</tbody>
		<%
			} else {
				for (int i = 0; i < list.size(); i++) {
					MemoDTO dto = list.get(i);
		%>
		<tbody>
		<tr>
			<td><%=dto.getMemono()%></td>
			<td>
				<%
					for (int j = 0; j < dto.getIndent(); j++) {
								out.print("&nbsp; &nbsp; &nbsp;");
							}

							if (dto.getIndent() > 0)
								out.print("<img src='../images/re.jpg'>");
				%> <a href="javascript:read('<%=dto.getMemono()%>')"> <%=dto.getTitle()%></a>
			</td>
			<td><%=dto.getWdate()%></td>
			<td><%=dto.getViewcnt()%></td>
			<td><%=dto.getGrpno()%></td>
			<td><%=dto.getIndent()%></td>
			<td><%=dto.getAnsnum()%></td>
		</tr>
		</tbody>
		<%
			}
			}
		%>


	</table>
	<div class='bottom'>
		<%=Utility.paging(total, nowPage, recordPerPage, col, word) %>
	</div>
	</div>
	<jsp:include page="/menu/bottom.jsp" />
</body>

</html>

