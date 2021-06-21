<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hk.jsp.dao.BoardDao" %>
<%@ page import="com.hk.jsp.vo.BoardVo" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>공지사항</title>
<link rel="stylesheet" href="css/style.css"></link>
<link rel="stylesheet" href="../main/header_footer.css"></link>
<link rel="stylesheet" href="../custom/notice.css"></link>
<style></style>
</head>
<body>

	<div class="wrapper">
	
		<%@ include file="../main/header.jsp" %>

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
	<section>
		<div class="board_wrap">
		<div class="board_title">
			<p>공지사항</p>		
		</div>
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="num">번호</div>
					<div class="title">제목</div>
					<div class="writer">작성자</div>
					<div class="date">등록일</div>
					
				</div>
			
			
			<%
						for(int i=0; i<result.size(); i++) {
						BoardVo row = result.get(i);			
			%>
			<div>
					<div class="num"><%= row.getNo() %></div>
					<div class="title"><a href="noticeshow.jsp?pageNm=<%= row.getNo() %>"><%= row.getTitle() %></a></div>
					<div class="writer"><%= row.getWrite_name() %></div>
					<div class="date"><%= row.getRegdate() %></div>
			</div>
			
			<%
							}		
			%>
			
	
			<div class="board_page">
				<a href="" class="bt first"><<</a>
				<a href="" class="bt prev"><</a>		
				<a href="" class="num on">1</a>
				
				<a href="" class="bt next">></a>
				<a href="" class="bt last">>></a>	
			</div>
<%
String id = (String)session.getAttribute("userid");


	if(id == null) {
	

	}else if(id.equals("admin")){
%>			
			<div>
			<button onclick="location.href='notice_write.jsp'">글작성</button>
			</div>
<%
}else {}
%>
	</div>
	</div>
	</div>
	</section>
		
<%@ include file="../main/footer.jsp" %>
		
			
</div>  
		
		

</body>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../main/header_footer.js"></script>
<script src="login.js"></script>
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
</html>