<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>결제창</title>
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
					if(request.getParameterValues("check")==null){
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
				<%
						}
					}else{
						String[] arr_no = request.getParameterValues("check");
						String[] p_no = new String[arr_no.length];
						UserDao userdao = UserDao.getInstance();
						for(int i=0; i<arr_no.length; i++){
							List<CartVo> result = userdao.CarttoOrder(Integer.parseInt(arr_no[i]));
							//out.println(arr_no[i]);
							for(int j=0; j<result.size(); j++){
								CartVo cartvo = result.get(j);
								p_no[j] = cartvo.getP_no();
								List<ProductVo> result2 = userdao.OrderByP_no(p_no[j]);
								for(int k=0; k<result2.size(); k++){
									ProductVo provo = result2.get(k);
									sum += provo.getPrice();
									out.println("<div>");
				%>
					<div class="num"><%=provo.getP_no() %></div>
					<div class="product"><a href="../product/product_detail.jsp?p_no=<%=provo.getP_no()%>"><%=provo.getName() %></a></div>
					<div class="count">1</div>
					<div class="price"><%=provo.getPrice() %></div>
					<div class="ship">기본배송</div>				
				</div>
				<%
								}
							}
						}
					}
				%>
			<!--
			<div>
					<div class="num">4</div>
					<div class="product"><a href="">옥스퍼드셔츠</a></div>
					<div class="count">1</div>
					<div class="price">200,000원</div>
					<div class="ship">기본배송</div>				
			</div>
			<div>
					<div class="num">3</div>
					<div class="product"><a href="">리버진</a></div>
					<div class="count">3</div>
					<div class="price">250,000원</div>
					<div class="ship">기본배송</div>				
			</div>
			<div>
					<div class="num">2</div>
					<div class="product"><a href="">카드지갑</a></div>
					<div class="count">2</div>
					<div class="price">170,000원</div>
					<div class="ship">기본배송</div>				
			</div>
				<div>
					<div class="num">1</div>
					<div class="product"><a href="">캐시미어 니트</a></div>
					<div class="count">4</div>
					<div class="price">350,000원</div>
					<div class="ship">기본배송</div>				
				</div>		
			</div>
			-->
			
			
			</div>
		</div>
			<br>
			<br>
			<br>
		<%
			String id=null;
			
				id=(String)session.getAttribute("userid");
				UserDao userdao = UserDao.getInstance();
				UserVo uservo = userdao.getUserById(id);
		 %>
			
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
					<div><input type="text" name="id" id="id" value="<%=uservo.getName()%>"></div>
						
			</div>
			<br>
			<div>
					<div>이메일 주소</div>
					<div><input type="email" name="email" id="email" value="<%=uservo.getEmail()%>"></div>			
			</div>
			
			<br>
			<br>
			<br>
			
		<div class="info2_wrap">
		<div class="info2_title">	
		</div>
		<h4>주문고객 정보</h4>
		<br>
		<div class="info2_list_wrap">
			<div class="info2_list">
				<div class="top">
					<div>받으시는 분</div>
					<div><input type="text" name="id" id="id" value="<%=uservo.getName()%>"></div>
						
			</div>
			<br>
			<div>
					<div>전화번호</div>
					<input type="text" name="phn" id="phone" value="<%=uservo.getPhone()%>">		
			</div>
			<br>
			<div>
					<div>배송지 주소</div>
					<p><input type="text" id="sample6_postcode" name="zip_num" value="<%=uservo.getZip_num()%>">&nbsp;&nbsp;
					<input type="button" id="zipsearch" onclick="sample6_execDaumPostcode();" value="우편번호 찾기"></p>
					<p><input type="text" id="sample6_address" name="address" value="<%=uservo.getAddress()%>"></p>
					<p><input type="text" id="sample6_detailAddress" name="address2" value="<%=uservo.getAddress2()%>"></p>		
			</div>
			<br>
			<div>
					<div>배송 메시지</div>
					<input type="text" name="message" id="message" placeholder="메세지를 입력하세요.">		
			</div>

		<div class="pay_wrap">
		<div class="pay_title">	
		</div>
		
		<br>
		<!--  
		<h4>결제 수단 선택</h4>
		<div class="info2_list_wrap">
			<div class="info2_list">
				<div class="top">
					<div><input type="checkbox" name="pay" value="blue">신용카드</div>
     				<div><input type="checkbox" name="pay" value="red">실시간 계좌이체</div>
     				<div><input type="checkbox" name="pay" value="red">가상계좌 (무통장입금)</div>
     				<div><input type="checkbox" name="pay" value="red">네이버페이</div>
     				<div><input type="checkbox" name="pay" value="red">카카오페이</div>
				</div>
				
				<div>카드사 선택</div>
		<form name="form1" method="POST" action="add.jsp">
			<select name="productName">
				<option>국민</option>
				<option>외환</option>
				<option>비씨</option>
				<option>하나</option>
				<option>농협NH</option>	
				<option>우리</option>
				<option>현대</option>		
			</select>
		</form>
		-->

		<div class="bt_wrap">	
				<button class="on" formaction="reg_order.jsp" formmethod="get" type="submit">결제</button>
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
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../main/header_footer.js"></script>
<script src="login.js"></script>
</html>