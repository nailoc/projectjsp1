<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
<style></style>
</head>
<body>
	<form id="register-form" action="reg_nouserpro.jsp" method="GET">
		<input type="password" id="regpw" name="pw" placeholder="회원비밀번호">
		<input type="text" name="phone" placeholder="전화번호">
		<input type="email" name="email" placeholder="이메일">
		
		<!-- input type="text" id="zipcode" placeholder="우편번호">
		<input type="button" id="zipsearch" value="우편번호검색">
		<input type="text" placeholder="주소">
		<input type="text" placeholder="상세주소" -->
		
		<input type="text" id="sample6_postcode" name="zip_num" placeholder="우편번호">
		<input type="button" id="zipsearch" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" name="address" placeholder="주소"><br>
		<input type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소">
		<!-- input type="text" id="sample6_extraAddress" placeholder="참고항목" -->
		
		<button type="button" onclick="register();">회원가입</button>
		<label for="form-switch"><span>가입한 회원? 로그인하세요</span></label>
	</form>

</body>
<script>
	function register() {
	userpw = document.getElementById("regpw").value;
	
	
	if(userpw=="") {
		alert("비밀번호를 입력하시오");
		return;
	}
	
	// 필요한 거 체크 = validation check
	
	// 회원가입
	regform = document.getElementById("register-form");
	regform.submit();
	
	
}
</script>
</html>