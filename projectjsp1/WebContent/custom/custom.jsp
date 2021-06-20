<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hk.jsp.dao.BoardDao" %>
<%@ page import="com.hk.jsp.vo.BoardVo" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>고객센터</title>
<link rel="stylesheet" href="css/style.css"></link>
<link rel="stylesheet" href="../main/header_footer.css"></link>
<link rel="stylesheet" href="../custom/custom.css"></link>
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
		<h2>HOME > 고객센터</h2>
		<br>
		<div class="main_text0">
			<h1>고객센터</h1>
		<ul class="icons">
			<li>
				<div class="icon_img">
					<a href="../custom/notice.jsp"><img src="../images/notice.png" width="200" height="150"></a>		
				</div>
				<br>
				<div class="contents1_bold">공지사항</div>
			</li>
			<li>
				<div class="icon_img">
					<a href="../custom/infochange.jsp"><img src="../images/infochange.png" width="200" height="150"></a>		
				</div>
				<br>
				<div class="contents1_bold">회원 정보 수정</div>
			</li>
			<li>
				<div class="icon_img">
					<a href="../cart/order_list_show.jsp"><img src="../images/orderdeliver.png" width="200" height="150""></a>			
				</div>
				<br>
				<div class="contents1_bold">주문 조회</div>
			</li>
			<li>	
				<div class="icon_img">
					<a href="../custom/noncustom.jsp"><img src="../images/noncustom.png" width="200" height="150"></a>				
				</div>
				<br>
				<div class="contents1_bold">비회원 주문 조회</div>
		</ul>	
		</div>
		
		<section>
		<div class="board_wrap">
		<div class="board_title">
			<p>자주 묻는 질문</p>		
		</div>
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="num">번호</div>
					<div class="category">분류</div>
					<div class="title">제목</div>
					<div class="date">작성일자</div>
					
			</div>
			<%
						for(int i=0; i<result.size(); i++) {
						BoardVo row = result.get(i);			
			%>
			<div>
					<div class="num"><%= row.getNo() %></div>
					<div class="category">회원정보</div>
					<div class="title"><a href="noticeshow.jsp?pageNm=<%= row.getNo() %>"><%= row.getTitle() %></a></div>
					<div class="date"><%= row.getRegdate() %>작성일자</div>
			</div>
			<%
							}		
			%>


			</div>
	
			<div class="board_page">
				<a href="" class="bt first"><<</a>
				<a href="" class="bt prev"><</a>		
				<a href="" class="num on">1</a>
				<a href="" class="bt next">></a>
				<a href="" class="bt last">>></a>	
			</div>
			<div>
			<button onclick="location.href='custom_write.jsp'">글작성</button>
			</div>
	</div>
	</div>
	</section>
		
		
			
		</div>    
		
		<%@ include file="../main/footer.jsp" %>
	</div>
</body>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../main/header_footer.js"></script>
<script src="login.js"></script>
</html>