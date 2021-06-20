<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hk.jsp.dao.BoardDao" %>
<%@ page import="com.hk.jsp.vo.BoardVo" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오라클 게시판</title>
<link rel="stylesheet" href="css/style_list.css"></link>
<link rel="stylesheet" href="css/iboard_default.css"></link>
<style>
	table, tr, td
	 {
		border: solid 1px black;
	}
</style>
</head>
<body>


<div class="">
	<div id="">
		<div class="">
			
		<%
		String sortname = request.getParameter("sort");
		if(sortname==null) {
			sortname = "no";
		}
		String keywordval = request.getParameter("keyword");
		if(keywordval==null) {
			keywordval = "";
		}
			BoardDao board = BoardDao.getInstance();
			
			//접속테스트 종료
			//리스트 출력
			List<BoardVo> result = board.getBoardList(sortname, keywordval);
			
		 
		%>
			<div class="">전체 <%=result.size()%></div>
		
			<div class="">
				<form id="iboard-sort-form-1" method="GET" action="noticelist.jsp">
					<select id="iboard_list_sort" name="iboard_list_sort" onchange="sort();">
					<option value="" selected="selected">정렬선택</option>
					<option value="no">최신순</option>
					<option value="votes">추천순</option>
					<option value="views">조회순</option>	
					</select>
				</form>
			</div>
		</div>
	
		<div class="iboard-list">
		
			<table>
				<thead>
					<tr>
						<td class="">번호</td>
						<td class="">제목</td>
						<td class="">작성자</td>
						<td class="">작성일</td>
						<td class="">추천</td>
						<td class="">조회</td>
					</tr>
				</thead>	
				
				<tbody>
					<%
						for(int i=0; i<result.size(); i++) {
						BoardVo row = result.get(i);
						if(i == 0) {
						out.println("<tr>");
						}else {
							out.println("<tr>");
						}
					%>
					
						<td class=""><%=row.getNo() %></td>
						<td class=""><a href="noticeshow.jsp?no=<%=row.getNo() %>"><%=row.getTitle() %></td>
						<td class=""><%=row.getWrite_name() %></td>
						<td class=""><%=row.getRegdate() %></td>
						<td class=""><%=row.getVotes() %></td>
						<td class=""><%=row.getViews() %></td>
					</tr>
					<%
						}
					%>
			
						 
				</tbody>
			</table>
		
		</div>
		
		<!-- 페이지번호  -->
		<div class="">
			<ul class="">
				<li class="active"><a href="">1</a></li>
				<li><a href="">2</a></li>
				<li class="next-page"><a href="">>></a></li>
				<li class="last-page"><a here="">마지막</a></li>
			</ul>
		</div>
		
		<!-- 검색창  -->
		<div class="">
			<form id="iboard-search-form-1" method="GET" action="noticelist.jsp">
				<select name="target">
					<option value="">전체</option>
					<option value="title">제목</option>
					<option value="contents">내용</option>
					<option value="write_name">작성자</option>
				</select>
				<input type="text" id="keyword" name="keyword" value="">
				<button type="button" class="iboard-default-button-small" onclick="search();">검색</button>
			</form>
		</div>
		
		<!-- 관리자 글쓰기 -->
		<div class="">
			<div class="left">
			</div>
			
			<div class="right">
			<button type="button" onclick="location.href='noticewrite.jsp'">글쓰기</button></div>
		</div>

	</div>

</div>



<script src="js/jquery-3.6.0.min.js"></script>
<script>

	
	//정렬
	function sort() {
		var sel = document.getElementById("iboard_list_sort");
		var sort_val = sel.options[sel.selectedIndex].value;
		//alert(sort_val);
		location.href="noticelist.jsp?sort="+sort_val;
	}
	//검색
	function search() {
		//추가 subject 선택
		var keyword_val = document.getElementById("keyword").value;
		var keyword_val_encode = encodeURI(keyword_val); // url주소 한글-인코딩
		if(keyword_val) {
			location.href="noticelist.jsp?keyword="+keyword_val_encode;
		}else{
			alert("검색어를 입력하시오");
		}
	}
</script>
</body>
<script></script>
</html>