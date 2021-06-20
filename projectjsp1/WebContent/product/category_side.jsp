<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>jspweb</title>
<link rel="stylesheet" href="category_side.css"></link>
<style></style>
</head>
<body>
	<section class="category_menu">
      <div class="category_product">
         <h2>CATEGORIES</h2>
         <ul class="category">
            <li class="kind">
               상의
               <ul>
                  <li><a href="product_shirt.jsp">셔츠</a></li>      
                  <li><a href="product_t_shirt.jsp">티셔츠</a></li>      
                  <li><a href="product_outer.jsp">아우터</a></li>                     
               </ul>
            </li>
            <li class="kind">
               하의
               <ul>
                  <li><a href="product_denim_pants.jsp">데님팬츠</a></li>
                  <li><a href="product_cotton_pants.jsp">코튼팬츠</a></li>      
                  <li><a href="product_short_slacks.jsp">숏팬츠, 슬랙스</a></li>   
                  <li><a href="product_etc.jsp">기타</a></li>                        
               </ul>
            </li>
            <li class="kind">
               액세서리
               <ul>
                  <li><a href="product_accessary.jsp">액세서리</a></li>               
               </ul>
            </li>
         </ul>
      </div>
   </section>  	
	
	<section class="category_product_detail">
		<p>카테고리</p>
		<div class="content_align">
			<ul class="align">
				<li id="newest"><a href="#">최신순 |</a></li>
				<li id="best"><a href="#">인기순 |</a></li>
				<li id="lowest"><a href="#">낮은가격순 |</a></li>
				<li id="highest"><a href="#">높은가격순 |</a></li>
				<li id="views"><a href="#">리뷰순</a></li>
			</ul>
		</div>
	</section>
	
</body>
<script></script>
</html>