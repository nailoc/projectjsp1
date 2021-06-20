<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
<link rel="stylesheet" href="../main/header_footer.css"></link>
<link rel="stylesheet" href="../cart/pay.css"></link>
<style></style>
</head>
<body>
	<div class="wrapper">
	
		<%@ include file="../main/header.jsp" %>
		
		<h2>HOME > 쇼핑</h2>
		<div class="intro_text">
			<h3>주문/결제</h3>	
		</div>
		
		<section>
			<div class="board_wrap">
			<div class="board_title">	
			</div>
			<h4>주문상품</h4>
			<div class="board_list_wrap">
				<div class="board_list">
					<div class="top">
						<div class="num">번호</div>
						<div class="product">상품정보</div>
						<div class="count">수량</div>
						<div class="price">판매가</div>
						<div class="ship">기본배송</div>						
					</div>
					
					<%
					int sum = 0;
					String p_no = request.getParameter("p_no");
					UserDao userdao = UserDao.getInstance();
					List<ProductVo> result = userdao.OrderByP_no(p_no);
					for(int i=0; i<result.size(); i++){
						ProductVo provo = result.get(i);
						sum = provo.getPrice();
						out.println("<div>");
					%>
					
					<div class="num"><%=provo.getP_no() %></div>
					<div class="product"><a href="../product/product_detail.jsp?p_no=<%=provo.getP_no()%>"><%=provo.getName() %></a></div>
					<div class="count">1</div>
					<div class="price"><%=provo.getPrice() %></div>
					<div class="ship">기본배송</div>				
					</div>
				</div>
			</div>
		</section>
					<%} %>
					
					
	
		<form class="content" method="GET">
	
		
		<div class="info_wrap">
			<div class="info_title">	
			</div>
			<div id="sum"><%=sum %></div>
			<input name="sum" type="hidden" value="<%=sum %>">
		<h4>주문고객 정보</h4>
		<br>
		<div class="info_list_wrap">
			<div class="info_list">
				<div class="top">
					<div>주문하시는분</div>
					<div><input type="text" name="id" id="id" placeholder="이름"></div>
						
			</div>
			<br>
			<div>
					<div>이메일 주소</div>
					<div><input type="email" name="email" id="email" placeholder="e-mail"></div>			
			</div>
			
			<br>
			<br>
			<br>
			
		<div class="info2_wrap">
		<div class="info2_title">	
		</div>
		<div id="sum"><%=sum %></div>
		<input name="sum" type="hidden" value="<%=sum %>">
		<h4>주문고객 정보</h4>
		<br>
		<div class="info2_list_wrap">
			<div class="info2_list">
				<div>
					<div>비회원 비밀번호 설정</div>
					<div><input type="password" name="pw" id="pw" placeholder="비밀번호"></div>
				</div>
			
				<div class="top">
					<div>받으시는 분</div>
					<div><input type="text" name="id" id="id" placeholder="이름"></div>
						
				</div>
				<br>
				<div>
					<div>전화번호</div>
					<input type="text" name="phn" id="phone" placeholder="핸드폰 번호">		
				</div>
				<br>
				<div>
					<div>배송지 주소</div>
					<p><input type="text" id="sample6_postcode" name="zip_num" placeholder="우편번호">&nbsp;&nbsp;
					<input type="button" id="zipsearch" onclick="sample6_execDaumPostcode();" value="우편번호 찾기"></p>
					<p><input type="text" id="sample6_address" name="address" placeholder="주소"></p>
					<p><input type="text" id="sample6_detailAddress" name="address2" placeholder=""></p>		
			</div>
			<br>
			<div>
					<div>배송 메시지</div>
					<input type="text" name="message" id="message" placeholder="메세지를 입력하세요.">		
			</div>

		<div class="pay_wrap">
		<div class="pay_title">	
		</div>
		
		
		<div class="bt_wrap">	
				<button class="on" formaction="reg_nouserpro.jsp" formmethod="get" type="submit">결제</button>
				<a href="">결제 취소</a>
			</div>
		
		
			
		</div>    
		</div>
		</div>
		</div>
		</div>
		</div>
		<%@ include file="../main/footer.jsp" %>
	</div>
	</form>
		
		<%@ include file="../main/footer.jsp" %>
	</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../main/header_footer.js"></script>
<script src="reg_nouser.js"></script>
</html>