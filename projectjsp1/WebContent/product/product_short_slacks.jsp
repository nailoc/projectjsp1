<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@	page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>상품</title>
<link rel="stylesheet" href="product.css"></link>
<link rel="stylesheet" href="../main/header_footer.css"></link>
<style></style>
</head>
<%
	ProductDao prodao = ProductDao.getInstance();
	List<ProductVo> result = prodao.proList();
%>
<body>

	<div class="wrapper">
	
		<%@ include file="../main/header.jsp" %>
		<%@ include file="category_side.jsp" %>
		
		<section class="product" id="product_section">
	<% 
	
		for(int i=0; i<result.size(); i++){
			ProductVo temp = result.get(i);
			if(temp.getKind() == 6){		
	%>
		<form id="form2" name="fomr2" method="get" action="product_detail.jsp?p_no=<%=temp.getP_no()%>">
			<div class="product" id="product_dex">
				<div class="products_image">
					<a href="product_detail.jsp?p_no=<%=temp.getP_no()%>" id="fom" onclick="fom1()"><img src="<%=temp.getImg() %>" alt="jacket"></a>
					<p id="product_brand"><%=temp.getBrand() %></p>
					<p id="product_name"><%=temp.getName() %></p>
					<p id="product_price"><%=temp.getPrice() %></p>
					<p id="product_p_like">(<%=temp.getP_like() %>)<a id="red" href= "#" onclick="like(<%=temp.getP_no() %>);" >♥</a></p>
			  </div>
			</div>
			</form>
	<%
		}
	}
	%>
		</section>
		
		<%@ include file="../main/footer.jsp" %>
		
	</div>
</body>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../main/header_footer.js"></script>
<script type="text/javascript">
	
	function like(num){
		
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
			if(this.readyState == 4 && this.status == 200) {
				alert("추천!");
			}
		}
		xmlhttp.open("GET", "product_like.jsp?p_no="+num, true);
		xmlhttp.send();
	}
	
	function like1(){
		var srot = document.getElementById("product_p_like");
		
		
	}
	
	function fom1(){
		var ff = document.getElementById("fom");
		ff.submit();
	}
	
</script>
</html>