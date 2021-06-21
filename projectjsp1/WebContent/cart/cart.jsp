<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<%
	String id = null;
	UserDao userdao = UserDao.getInstance();
	if(session.getAttribute("userid") == null) {
		out.println("<script>alert('로그인되지 않았습니다.'); location.href='../login/login.jsp'</script>");
	}else {
		id = (String)session.getAttribute("userid");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>장바구니</title>
<link rel="stylesheet" href="css/style.css"></link>
<link rel="stylesheet" href="../main/header_footer.css"></link>
<link rel="stylesheet" href="../cart/cart.css"></link>
<style></style>
</head>
<body>

	<div class="wrapper">
	
		<%@ include file="../main/header.jsp" %>
		
		<h2>HOME > 쇼핑</h2>
		<div class="intro_text">
			<h3>쇼핑백</h3>
			<p>쇼핑백에 담긴 상품은 30일 동안 보관됩니다.</p>
			<p>쇼핑백에 담은 상품이판매종료가 되었을 경우 자동 삭제 됩니다.</p>
			<p>쇼핑백에 최대 100개까지 상품 보관이 가능하며, 실제 구매 시에는 가격이나 혜택이 변동될 수 있습니다.</p>
			<p>택배배송상품과 매장픽업상품은 한 주문서에 주문이 불가합니다.</p>
			<p>매장픽업제품은 픽업매장이 동일한 경우에만 주문 가능합니다.</p>		
		</div>
		
	<section>
		<div class="board_wrap">
			<div class="board_title">	
			</div>
				<div class="board_list_wrap">
					<form name="delete_form" method="post" id="delete" action="cart_delete.jsp">
					<div class="board_list">
						<div class="top">
							<div class="num">상품 번호</div>
							<div class="image">상품 이미지</div>
							<div class="product">상품정보</div>
							<div class="size">사이즈</div>
							<div class="count">수량</div>
							<div class="price">판매가</div>					
						</div>
						<%
							int sum = 0;
							List<CartVo> result = userdao.getCartById(id);
							int[] price_arr = new int[result.size()];
							for(int i=0; i<result.size(); i++){
								CartVo cartvo = result.get(i);
								price_arr[i] = cartvo.getPrice();
								sum += price_arr[i];
								out.println("<div>");
						%>
						
							<div class="num"><%=cartvo.getP_no() %></div>
							<div class="image"><img src="<%=cartvo.getImg() %>" width="80" height="90" align="center"></div>
							<div class="product"><a href="../product/product_detail.jsp?p_no=<%=cartvo.getP_no() %>"><%=cartvo.getName() %></a></div>
							<div class="size"><%=cartvo.getSize()%></div>
							<div class="count"><%=cartvo.getAmount() %></div>
							<div class="price"><%=cartvo.getPrice() %></div>
							<div><input id="check" name="check" type="checkbox" value="<%=cartvo.getNo() %>"></div>
						</div>
						<%	
							}
						%>
						
							
						<button id="delete" type="submit" onclick="delete();">삭제</button>
						<!--
						<div>
							<div class="num">4</div>
							<div class="product"><a href="">오버핏 고밀도 워싱 코튼 숏 셔츠 자켓</a></div>
							<div class="count">1</div>
							<div class="price">200,000원</div>
							<div class="ship">기본배송</div>				
						</div>
						<div>
							<div class="num">3</div>
							<div class="product"><a href="">오버핏 고밀도 워싱 코튼 숏 셔츠 자켓</a></div>
							<div class="count">3</div>
							<div class="price">250,000원</div>
							<div class="ship">기본배송</div>				
						</div>
						<div>
							<div class="num">2</div>
							<div class="product"><a href="">오버핏 고밀도 워싱 코튼 숏 셔츠 자켓</a></div>
							<div class="count">2</div>
							<div class="price">170,000원</div>
							<div class="ship">기본배송</div>				
						</div>
						<div>
							<div class="num">1</div>
							<div class="product"><a href="">오버핏 고밀도 워싱 코튼 숏 셔츠 자켓</a></div>
							<div class="count">4</div>
							<div class="price">350,000원</div>
							<div class="ship">기본배송</div>				
						</div>
						-->
						<div><p id="sum">전체 금액 : <%=sum %></p></div>
					<div class="bt_wrap">	
						<a href="../product/product.jsp" class="on">쇼핑 계속하기</a>
						<button type="submit" formaction="../cart/pay.jsp" formmethod="post">주문하기</button>
					</div>
					</form>
					</div>
					
					
				</div>
	</section>
		
		
		<%@ include file="../main/footer.jsp" %>
			
		</div>    
		
</body>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../main/header_footer.js"></script>
<script src="login.js"></script>
<script src="cart.js"></script>
</html>