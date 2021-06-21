<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
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

		PopDao board = PopDao.getInstance();
			
			//접속테스트 종료
			//리스트 출력
	
		List<PopVo> result = board.getBoardList(sortname, keywordval);
			
		 
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
				<div class="contents1_bold">주문/배송 조회</div>
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
		<div class="iboard-total-count">전체 <%=result.size() %></div>
		<div class="iboard-sort">
				<form id="iboard-sort-form-1" method="GET" action="custom.jsp">
					<select id="iboard_list_sort" name="iboard_list_sort" onchange="sort();">
					<option value="" selected="selected">정렬선택</option>
					<option value="no">최신순</option>
					<option value="category">분류순</option>
				
					</select>
				</form>
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
			if(result.size() == 0) {
				out.println("<h2>작성된 글이 없습니다</h2>");
			}else {
				for(int i=0; i<result.size(); i++) {
						PopVo row = result.get(i);			
			%>
			<div>
					<div class="num"><%= row.getNo() %></div>
					<div class="category"><%= row.getCategory() %></div>
					<div class="title"><a href="custom_show.jsp?pageNm=<%= row.getNo() %>"><%= row.getTitle() %></a></div>
					<div class="date"><%= row.getRegdate() %></div>
			</div>
			<%
							}
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
<%
String id = (String)session.getAttribute("userid");


	if(id == null) {
	

	}else if(id.equals("admin")){
%>

			<div>
			<button onclick="location.href='custom_write.jsp'">글작성</button>
			</div>
<%
}else {}

%>
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
	location.href="custom.jsp?sort="+sort_val;
}
//검색
function search() {
	//추가 subject 선택
	var keyword_val = document.getElementById("keyword").value;
	var keyword_val_encode = encodeURI(keyword_val); // url주소 한글-인코딩
	if(keyword_val) {
		location.href="custom.jsp?keyword="+keyword_val_encode;
	}else{
		alert("검색어를 입력하시오");
	}
}
</script>
</html>