<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>회원가입</title>
<link rel="stylesheet" href="css/style.css"></link>
<link rel="stylesheet" href="../main/header_footer.css"></link>
<link rel="stylesheet" href="register.css"></link>
<style></style>
</head>
<body>

	<div class="wrapper">
	
		<%@ include file="../main/header.jsp" %>
		
        <section>
	        <div class="admin">
	        	<h1>회원가입</h1>
	        	<br>
	        	<form class="content" action="regpro.jsp" method="GET">
		      		<p>아이디</p>
		      		<p><input type="text" name="id" id="id" placeholder="아이디 입력"></p>
		      		<p class="none" id="none1">필수 정보입니다.</p>
		      		<p>비밀번호</p>
		      		<p><input type="password" name="pw" id="pw" placeholder="비밀번호 입력"></p>
		      		<p class="none" id="none2">필수 정보입니다.</p>
		      		<p>비밀번호 재확인</p>
		      		<p><input type="password" id="pw_check" placeholder="비밀번호 확인"></p>
		      		<p class="none" id="none3">필수 정보입니다.</p>
		      		<p class="none" id="none4">비밀번호가 일치하지 않습니다.</p>
		      		<br>
		      		<p>이름</p>
		      		<p><input type="text" name="name" id="name" placeholder="이름 입력"></p>
		      		<p class="none" id="none5">필수 정보입니다.</p>
		      		
		      		<!-- 전화번호 이메일 주소 -->
		      		<p>전화번호</p>
		      		<p><input type="text" name="phn" id="phone" placeholder="전화번호 입력"></p>
		      		
		      		<p>이메일</p>
		      		<p><input type="email" name="email" id="email" placeholder="이메일 입력"></p> 
		      		
		      		<p>주소</p>
					<p><input type="text" id="sample6_postcode" name="zip_num" placeholder="우편번호">&nbsp;&nbsp;
					<input type="button" id="zipsearch" onclick="sample6_execDaumPostcode();" value="우편번호 찾기"></p>
					<p><input type="text" id="sample6_address" name="address" placeholder="주소"></p>
					<p><input type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소"></p>
		      		<br><br>
			        <button type="button" id="register_btn" onclick="register();">가입하기</button>
	      		</form>
		        
		    </div>
        </section>    
		
		<%@ include file="../main/footer.jsp" %>
	</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../main/header_footer.js"></script>
<script src="register.js"></script>
</html>