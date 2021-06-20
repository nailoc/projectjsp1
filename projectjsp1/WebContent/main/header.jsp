<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>jspweb</title>
<style></style>
</head>
<body>
	<header>
		<div id="header1">
			<a href="../main/main.jsp">
				<img src="../images/logo.png" alt="logo" id="logo">
				<img src="../images/logo1.png" alt="logo" id="logo1">
			</a>
			<ul id="headmenu">
				<li><a href="#">공지사항</a></li>
				<li><a href="../custom/custom.jsp" >고객센터</a></li>
				<li><a href="../cart/cart.jsp">장바구니</a>
				<li id="login"><a href="../login/login.jsp">로그인</a></li>
				<li id="logout"><a href="../login/logout.jsp">로그아웃</a></li>
				<li id="signup"><a href="../login/register.jsp">회원가입</a></li>
				<li id="admin"><a href="../product/product_list.jsp">관리자</a></li>
			</ul>
			<div id="search">
				<a href="#"><img src="../images/search_icon.png" alt="search_icon"></a>
				<input type="text">
			</div>
		</div>
		
		<div id="header2">
         <ul id="product_menu">
                 <li id="home"><a href="../main/main.jsp">홈</a></li>
              <li><a href="#">상의</a></li>
              <li><a href="#">하의</a></li>
              <li><a href="#">액세서리</a></li>
           </ul>            
      </div>
   </header>
   
   <div class="sub_product_wrap">
      <div class="sub_wrap">
              <div class="sub_product">
                  <a href="../product/product_shirt.jsp">셔츠</a><br>
                <a href="../product/product_t_shirt.jsp">티셔츠</a><br>
                <a href="../product/product_outer.jsp">아우터</a><br>
             </div>                 
              <div class="sub_product">
                  <a href="../product/product_denim_pants.jsp">데님팬츠</a><br>
                <a href="../product/product_cotton_pants.jsp">코튼팬츠</a><br>
                <a href="../product/product_short_slacks.jsp">숏팬츠, 슬랙스</a><br>
                <a href="../product/product_etc.jsp">기타</a><br>
            </div>            	
           	<div class="sub_product">
               	<a href="#">액세서리</a><br>
            </div>
       </div>
	</div>
</body>
<script src="../js/jquery-3.6.0.min.js"></script>


<script>
<%
if(session.getAttribute("userid")==null) {	//세션이 없다면
%>
$(document).ready(function(){
	$("li#logout").hide();
	$("li#login").show();
	$("li#admin").hide();
	});
<%
}else if(session.getAttribute("userid").equals("admin")){
%>
$(document).ready(function(){
	$("li#logout").show();
	$("li#login").hide();
	$("li#signup").hide();
	$("li#admin").show(); });
<%
}else {//세션이 있다면 회원정보 가져오기
%>
$(document).ready(function(){
	$("li#logout").show();
	$("li#login").hide();
	$("li#signup").hide();
	$("li#admin").hide();
	});
<%
}
%>
</script>
</html>