<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오라클 게시판</title>
<link rel="stylesheet" href="css/style_list.css"></link>
<link rel="stylesheet" href="css/"></link>
<style>
	table, tr, td
	 {
		border: solid 1px black;
	}
</style>
</head>
<body>

<%
	String no = request.getParameter("no");  // 목록에서 선택한 번호
	
	BoardDao brddao = BoardDao.getInstance();
	//조회수를 증가
	brddao.increaseBoardNo(no);
	
	BoardVo rowshow = brddao.getBoardByNo(no); 
	
%>
<!-- 상단 콘텐츠를 싸는 박스 -->


<!-- 게시판 내용 -->
<div class="">

	<div id="">
		<div id="">
			
			<div class="">
			
				<div class="">
					<h1>제목 : <%= rowshow.getTitle() %></h1>
				</div>
				<table>
					<tr>
					 <td>번호</td>
					 <td><%=rowshow.getNo() %></td>
					</tr>
					
					<tr>
					 <td>작성자</td>
					 <td><%=rowshow.getWrite_name() %></td>
					</tr>
					
					<tr>
					 <td>작성일</td>
					 <td><%=rowshow.getRegdate() %></td>
					</tr>
					
					<tr>
					 <td>조회수</td>
					 <td><%=rowshow.getViews() %></td>
					</tr>
					<tr>
						<td colspan="2"><%=rowshow.getContents() %></td>
					</tr>
				</table>
				
				
				
				
				<!-- 이전 또는 다음 게시물 -->
				<div class="iboard-document-action">
					<div class="left">
					<button>이전글</button></div>
					
					<div class="right">
					<button type="button" onclick="votes(<%=rowshow.getNo() %>);">추천</button> <button>다음글</button></div>
				</div>
				<button onClick="location.href='noticelist.jsp'">목록</button>
			</div>
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
	
	
//추천
	function votes(num) {
		//alert(num); // ajax 통신을 추가 합니다
		var xmlhttp = new XMLHttpRequest();
		// 콜백함수 정의
		xmlhttp.onreadystatechange = function() {
			// 접속완료 && 접속성공
			if(this.readyState == 4 && this.status == 200) {
				alert(num+"번 게시글에 추천을 했습니다");
			}
		}
		xmlhttp.open("GET", "noticevote.jsp?no="+num, true);
		xmlhttp.send();
		
	}
</script>
</html>