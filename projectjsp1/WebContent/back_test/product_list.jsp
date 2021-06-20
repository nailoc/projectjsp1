<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@	page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
<style>
div.gallery{
	width : 100px;
	margin : 50px;
	border : 1px solid black;
	float : left;
}
img{
	width : 80px;
	height : 100px;
}
div.desc{
	border : 1px solid black;
}
</style>
</head>
<%
	ProductDao prodao = ProductDao.getInstance();
	List<ProductVo> result = prodao.proList();
%>

<body>
	<h3>이미지 갤러리</h3>
	
	<% 
		for(int i=0; i<result.size(); i++){
			ProductVo temp = result.get(i);
	%>
	<div class="wrapper">
	<form name="delect_form" method="post" id="delect" action="product_delete.jsp">	
		<div class="gallery">
			<a href=""><img src=<%=temp.getImg() %> alt=""></a>
			<div class="desc"><%=temp.getPrice1() %></div>
			<div class="desc"><%=temp.getName() %></div>
			<div class="desc"><%=temp.getBrand() %></div>
			<input type="checkbox" value="<%=temp.getP_no() %>" name="check">
		</div>
	<%
	}
	%>
		 <input type="button" value="등록" onclick="location.href='product_input.jsp'">
		 <input type="submit" value="삭제">
		 <input type="button" value="재고추가" onclick="location.href='add_stock.jsp'">
		 </form>  
</div>
<!--  -->

</body>


<script></script>
</html>