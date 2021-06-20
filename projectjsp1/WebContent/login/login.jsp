<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>로그인</title>
<link rel="stylesheet" href="css/style.css"></link>
<link rel="stylesheet" href="../main/header_footer.css"></link>
<link rel="stylesheet" href="login.css"></link>
<style></style>
</head>
<body>

	<div class="wrapper">
	
		<%@ include file="../main/header.jsp" %>
		
		<section>
	        <div class="title_login">
	        	<div id="login_title">
	        		<a href="../main/main.jsp"><img src="../images/logo.png"></a>
	        	</div>
	        	<br>
		        <form id="loginfrm" action="loginpro.jsp" method="GET">
		        	<p><input type="text" id="id" name="id" placeholder="아이디"></p>
		        	<p id="none1">아이디를 입력해주세요.</p>
		        	<p><input type="password" id="pw" name="pw" placeholder="비밀번호"></p>
		        	<p id="none2">비밀번호를 입력해주세요.</p>
		        	<p id="none3">가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.</p>
		        	<br>
		        	<button type="button" id="login_btn" onclick="login();">로그인</button>
		        </form>
		        <br><hr>
		        
		        <div id="id_pw">
		        	<br>
		        	<a href="#">아이디 찾기 |</a>
		        	<a href="#">비밀번호 찾기 |</a>
		        	<a href="register.jsp">회원가입</a>
		        </div>
		        
		    </div>
        </section>    
		
		<%@ include file="../main/footer.jsp" %>
	</div>
</body>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../main/header_footer.js"></script>
<script src="login.js"></script>
</html>