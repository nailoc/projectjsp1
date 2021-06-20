<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>비회원 조회</title>
<link rel="stylesheet" href="css/style.css"></link>
<link rel="stylesheet" href="../main/header_footer.css"></link>
<link rel="stylesheet" href="../cart/pay.css"></link>
<style></style>
</head>
<body>
	<div class="wrapper">
	
		<%@ include file="../main/header.jsp" %>
		
		<div class="intro_text">
			<h3>비회원 조회</h3>	
			
			<form id="nouser_check" action="nouser_orderlistpro.jsp" method="GET">
				<input type="text" id="nouser_no" name="nouser_no" placeholder="비회원번호">
				<input type="password" id="pw" name="pw" placeholder="비회원비밀번호">
				
				<button type="button" onclick="nouser_check();">주문조회</button>
			</form>
		</div>
		
		
		
		</div>    
		
		
		
		<%@ include file="../main/footer.jsp" %>
</body>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../main/header_footer.js"></script>
<script src="login.js"></script>
<script src="noncustom.js"></script>
</html>