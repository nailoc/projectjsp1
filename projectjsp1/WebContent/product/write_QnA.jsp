<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Q&A</title>
<link rel="stylesheet" href="../main/header_footer.css"></link>
<link rel="stylesheet" href="write_QnA.css"></link>
<style></style>
</head>
<body>
	<div class="wrapper">
	
		<%@ include file="../main/header.jsp" %>
		
		<section>
			<div class="content_wrapper">	
				<h2>상품 Q&A</h2>
				<div id="iboard-thumbnail-editor">
					<form class="iboard-form" id="frm_write" method="POST" action="" enctype="multipart/form-data">
					
					<input type="hidden" name="board_id" value="hidden_val">
						<div class="iboard-attr-row iboard-attr-title">
							<label class="attr-name" for="title">
								<span class="field-name">제목</span>
								<span class="attr-required-text">*</span>
							</label>
							<div class="attr-value">
								<input type="text" id="title" name="title" value="">
							</div>
						</div>
				
						<div class="iboard-attr-row iboard-attr-author">
							<label class="attr-name" for="iboard-input-member-display">
							<span class="field-name">작성자</span>
							<span class="attr-required-text">*</span></label>
							<div class="attr-value">
								<input type="text" id="iboard-input-member-display" name="write_name" value="">
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
								<textarea class="editor-textarea" style="height:250px" cols="40" name="contents" id="iboard_content"></textarea>
								</div>
							</div>
						</div>
				
						<div class="iboard-attr-row iboard-attr-attach-1">
							<label class="attr-name" for="iboard-input-file1">
							<span class="field-name">첨부파일</span></label>
							<div class="attr-value">				
								<input type="file" id="iboard-input-file1" name="attach1" value="">
							</div>
						</div>
						<hr>
				
						<div class="iboard-control">
							<div class="left">
								<button type="button" onclick="history.back();">돌아가기</button>
							</div>
							
							<div class="right">
								<button type="button" onclick="bbs_write();">저장하기</button>
							</div>
						</div>
			
					</form>
		
				</div>
	
			</div>
			
		</section>
		
		<%@ include file="../main/footer.jsp" %>
	</div>

</body>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../main/header_footer.js"></script>
<script src="../js/ckeditor.js"></script>
<script src="write_QnA.js"></script>
</html>