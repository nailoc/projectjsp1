<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>상품</title>
<link rel="stylesheet" href="product.css"></link>
<link rel="stylesheet" href="../main/header_footer.css"></link>
<style></style>
</head>
<body>

	<div class="wrapper">
	
		<%@ include file="../main/header.jsp" %>
		<%@ include file="category_side.jsp" %>
		
		<section class="product">
			<div class="product">
				<div class="products_image" onclick="location.href='product_detail.jsp'">
					<img src="../images/jacket1.png" alt="jacket">
					<p id="product_brand">베이직바이블</p>
					<p id="product_name">오버핏 고밀도 워싱 코튼 숏 셔츠 자켓(6color)</p>
					<p id="product_price">27,900</p>
				</div>
				
				<div class="products_image">
					<img src="../images/jacket2.png" alt="jacket">
					<p id="product_brand">민투아이</p>
					<p id="product_name">남자 봄 가을 루즈핏 시그니쳐 싱글블레이져_(2color)</p>
					<p id="product_price">48,500</p>
				</div>
			</div>
		</section>
		
		
		<%@ include file="../main/footer.jsp" %>
		
	</div>
</body>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../main/header_footer.js"></script>
</html>