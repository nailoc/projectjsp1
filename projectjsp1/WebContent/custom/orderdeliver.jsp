<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>주문 배송조회</title>
<link rel="stylesheet" href="css/style.css"></link>
<link rel="stylesheet" href="../main/header_footer.css"></link>
<link rel="stylesheet" href="../cart/pay.css"></link>
<style></style>
</head>
<body>
	<div class="wrapper">
	
		<%@ include file="../main/header.jsp" %>
		>
		<div class="intro_text">
			<h3>주문/배송 조회</h3>	
		</div>
		
		<form id="register-form" action="reg_nouserpro.jsp" method="GET">
			<input type="password" id="regpw" name="pw" placeholder="회원비밀번호">
			<input type="text" name="phone" placeholder="전화번호">
			<input type="email" name="email" placeholder="이메일">
			
			
			<input type="text" id="sample6_postcode" name="zip_num" placeholder="우편번호">
			<input type="button" id="zipsearch" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="sample6_address" name="address" placeholder="주소"><br>
			<input type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소">
			<!-- input type="text" id="sample6_extraAddress" placeholder="참고항목" -->
			
			<button type="button" onclick="register();">비회원 주문하기</button>
		</form>
		
	</div>    
		
		
		
		<%@ include file="../main/footer.jsp" %>
</body>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../main/header_footer.js"></script>
<script src="reg_nouser.js"></script>
<script src="../login/login.js"></script>
</html>