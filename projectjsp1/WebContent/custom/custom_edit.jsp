<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../main/header_footer.css"></link>
<link rel="stylesheet" href="write_QnA.css"></link>
<style></style>
<title>자주 묻는 문의 수정</title>
</head>
<body>
<%
	String no = request.getParameter("pageNm");  // 목록에서 선택한 번호
	
	PopDao brddao = PopDao.getInstance();
	PopVo rowshow = brddao.getBoardByNo(no); 
	
%>
	<div class="wrapper">
	
		<%@ include file="../main/header.jsp" %>
		
		<section>
			<div class="content_wrapper">	
				<h2>자주묻는 문의 수정란</h2>
				<div id="iboard-thumbnail-editor">
					<form class="iboard-form" id="frm_write" method="POST" action="custom_editPro.jsp" enctype="multipart/form-data">
					<input type="hidden" name="num" value="<%=rowshow.getNo() %>">
					<input type="hidden" name="board_id" value="hidden_val">
						<div class="iboard-attr-row iboard-attr-title">
							<label class="attr-name" for="title">
								<span class="field-name">제목</span>
								<span class="attr-required-text">*</span>
							</label>
							<div class="attr-value">
								<input type="text" id="title" name="title" value="<%=rowshow.getTitle() %>">
							</div>
						</div>
						<div class="iboard-attr-row iboard-attr-title">
							<label class="attr-name" for="category">
								<span class="field-name">분류</span>
								<span class="attr-required-text">*</span>
							</label>
							<div class="attr-value">
								    <select name="category" id="title">
								    		<option value="<%=rowshow.getCategory() %>" selected="selected"><%=rowshow.getCategory() %></option>
									        <option value="회원정보">회원 정보</option>
									        <option value="주문">주문</option>
									        <option value="배송">배송</option>
									        <option value="어떻게해">어떻게해</option>
    								</select>
							</div>
						</div>
						<div class="iboard-attr-row iboard-attr-author">
							<label class="attr-name" for="iboard-input-member-display">
							<span class="field-name">작성자</span>
							<span class="attr-required-text">*</span></label>
							<div class="attr-value">
								<input type="text" id="iboard-input-member-display" name="write_name" value="관리자">
							</div>
						</div>
				
<!-- 						<div class="iboard-attr-row iboard-attr-password">
							<label class="attr-name" for="iboard-input-password">
							<span class="field-name">비밀번호</span>
							<span class="attr-required-text">*</span></label>
							<div class="attr-value">
								<input type="text" id="iboard-input-password" name="passwd" value="">
							</div>
						</div> -->
				
						<div class="iboard-attr-row iboard-attr-content">
							<label class="attr-name" for="iboard-content">
							<span class="field-name">내용</span></label>
							<div id="iboard-content-wrap">
								
								<div id="iboard-content-editor-container" class="editor-container">
								<textarea class="editor-textarea" style="height:250px" cols="40" name="contents" id="iboard_content"><%=rowshow.getContents() %></textarea>
								</div>
							</div>
						</div>
				
						<div class="iboard-attr-row iboard-attr-attach-1">
							<label class="attr-name" for="iboard-input-file1">
							<span class="field-name">첨부파일 :  <%=rowshow.getAttach1() %></span></label>
							<div class="attr-value">				
								<input type="file" id="iboard-input-file1" name="attach1" value="<%=rowshow.getAttach1() %>">
							</div>
						</div>
						<hr>
				
						<div class="iboard-control">
							<div class="left">
								<button type="button" onclick="history.back();">돌아가기</button>
							</div>
							
							<div class="right">
								<button type="button" onclick="bbs_write(<%=no %>);">저장하기</button>
							</div>
						</div>
			
					</form>
		
				</div>
	
			</div>
			
		</section>
		
		<%@ include file="../main/footer.jsp" %>
	</div>




<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../main/header_footer.js"></script>
<script src="../js/ckeditor.js"></script>

<script>

	// 글쓰기
	function bbs_write() {
		frm = document.getElementById("frm_write");
		frm.submit();
	}
</script>
</body>
</html>