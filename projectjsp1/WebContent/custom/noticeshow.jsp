<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<%
String pm = request.getParameter("pageNm");
%>

<title>공지사항 <%=pm %>번</title>
<link rel="stylesheet" href="css/style.css"></link>
<link rel="stylesheet" href="../main/header_footer.css"></link>
<link rel="stylesheet" href="noticeshow.css"></link>
<style></style>
</head>
<body>

	<div class="wrapper">
	
		<%@ include file="../main/header.jsp" %>
	
<%
String no = request.getParameter("pageNm");  // 목록에서 선택한 번호
BoardDao brddao = BoardDao.getInstance();
//조회수를 증가
brddao.increaseBoardNo(no);

BoardVo rowshow = brddao.getBoardByNo(no);
	
%>	
       <section>
	<div class="board_wrap">
		<div class="board_title">
			<strong>공지사항</strong>
			<p>공지사항을 빠르고 정확하게 안내 드립니다.</p>		
		</div>
		<div class="board_view_wrap">
			<div class="board_view">
				<div class="title">
					<%= rowshow.getTitle() %>
				
				</div>
				<div class="info">
					<dl>
						<dt>번호</dt>
						<dd><%=rowshow.getNo() %></dd>
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd><%=rowshow.getWrite_name() %></dd>
					</dl>
					
					<dl>
						<dt>작성일</dt>
						<dd><%=rowshow.getRegdate() %></dd>
					</dl>
					<dl>
						<dt>조회</dt>
						<dd><%=rowshow.getViews() %></dd>
					</dl>
				</div>
				
				<div class="cont">
				<%=rowshow.getContents() %>
				</div>
				
			</div>
			
			<div class="bt_wrap">	
			
				<button onclick="location.href='notice.jsp'">목록</button>
				<div class="btn_right">	
					<button onclick="edit(<%=no %>);">수정</button>
					<button id="del" onclick="delnotice(<%=no %>);">삭제</button>
				</div>
			</div>
	</div>
	</div>

	</section>
	</div>
	
		
		<%@ include file="../main/footer.jsp" %>
	
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../main/header_footer.js"></script>
<script src="register.js"></script>
<script>
function delnotice(no) {
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		location.href='notice_deletePro.jsp?pageNm='+no;
		}
	 
	}
//수정
function edit(no) {
	var chk = confirm("수정하시겠습니까?");
	if (chk) {
		location.href='notice_edit.jsp?pageNm='+no;
		}
}
</script>
</html>