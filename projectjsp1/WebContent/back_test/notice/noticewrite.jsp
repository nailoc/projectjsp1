<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오라클 게시판</title>
<link rel="stylesheet" href="css/style_list.css"></link>
<link rel="stylesheet" href="css/iboard_default.css"></link>
<style></style>
</head>
<body>



<!-- 게시판 내용 -->
<div class="content_wrapper">

	<div id="iboard-thumbnail-editor">
	
		<!-- 파일업로드 있다면 method: POST, 멀티파트데이터속성 추가 -->
		<!-- <form class="iboard-form" id="frm_write" method="GET" action="noticewrtpro.jsp"> -->
		<form class="" id="frm_write" 
		      method="POST" action="noticewrtpro.jsp"
		      enctype="multipart/form-data"> 
		
		<input type="hidden" name="board_id" value="hidden_val">
		
		<div class=" ">
			<label class="" for="title">
			<span class="">제목</span>
			<span class="">*</span></label>
			<div class="">
				<input type="text" id="title" name="title" value="">
			</div>
		</div>
		
		<div class=" ">
			<label class="" for="iboard-input-member-display">
			<span class="">작성자</span>
			<span class="">*</span></label>
			<div class="">
				<input type="text" id="iboard-input-member-display" name="write_name" value="">
			</div>
		</div>
		
		<div class=" ">
			<label class="" for="iboard-input-password">
			<span class="">비밀번호</span>
			<span class="attr-required-text">*</span></label>
			<div class="">
				<input type="text" id="iboard-input-password" name="passwd" value="">
			</div>
		</div>
		
		<div class=" ">
			<label class="" for="iboard-content">
			<span class="">내용</span></label>
			<div id="iboard-content-wrap">
				
				<div id="iboard-content-editor-container" class="">
				<textarea class="" style="height:250px" cols="40" name="contents" id="iboard_content"></textarea>
				</div>
			</div>
		</div>
		
		<div class=" ">
			<label class="" for="iboard-input-file1">
			<span class="">첨부파일-1</span></label>
			<div class="">
				<input type="file" id="iboard-input-file1" name="attach1" value="">
			</div>
		</div>
		
		<div class="">
			<div class="">
				<button type="button" onclick="history.back();">돌아가기</button>
			</div>
			
			<div class="">
				<button type="button" onclick="bbs_write();">저장하기</button>
			</div>
		</div>
		
		</form>
	
	
	</div> <!--  iboard-thumbnail-editor -->

</div> <!-- content_wrapper end -->



<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/ckeditor.js"></script>
<script>

	
	// 글쓰기
	function bbs_write() {
		frm = document.getElementById("frm_write");
		frm.submit();
	}
</script>
</body>
</html>