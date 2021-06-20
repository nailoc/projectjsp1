<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>그린 리프</title>
<link rel="stylesheet" href="../main/main.css"></link>
<link rel="stylesheet" href="../main/header_footer.css"></link>
<style></style>
</head>
<body>
	<div class="wrapper">
	
		<%@ include file="../main/header.jsp" %>
		
		<div class="slideshow">
			<div class="myslide">
				<img src="../images/banner1.jpg">
			</div>
			<div class="myslide">
				<img src="../images/banner2.jpg">
			</div>
			<div class="myslide">
				<img src="../images/banner3.jpg">
			</div>
			
			<a class="prev" onclick="plusslide(-1)">&#10094;</a>
			<a class="next" onclick="plusslide(1)">&#10095;</a>
			<p class="page">1 / 3</p>
		</div>
		
		<section>
			<p id="best">BEST 상품</p>
			<div class="best_product">
				<div class="best">
					<a href="#"><img src="../images/best1.png" alt="best1"></a>
					<p class="brand">유앤엘씨</p>
					<p class="product"><a href="#">[1+1] COOL SOFT SHORT SLEEVE CREW NECK KNIT(6color)</a></p>
					<p><span class="discount">56%</span>&nbsp;&nbsp;<span class="price">39,600</span></p>
				</div>
				<div class="best">
					<a href="#"><img src="../images/best2.png" alt="best2"></a>
					<p class="brand">탑보이</p>
					<p class="product"><a href="#">[당일출고] 5장세트 월화수목금 쿨링 7부 링클프리 티셔츠 (SCC5168PT)</a></p>
					<p><span class="discount">50%</span>&nbsp;&nbsp;<span class="price">37,800</span></p>
				</div>
				<div class="best">
					<a href="#"><img src="../images/best3.png" alt="best3"></a>
					<p class="brand">스티그마</p>
					<p class="product"><a href="#">COMPTON BEAR T-SHIRTS BLACK</a></p>
					<p><span class="discount">10%</span>&nbsp;&nbsp;<span class="price">34,200</span></p>
				</div>
			</div>
		</section>
		
		<%@ include file="../main/footer.jsp" %>
</div>

<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../main/main.js"></script>
<script src="../main/header_footer.js"></script>
</body>

</html>
