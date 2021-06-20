<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@	page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>제품상세</title>
<link rel="stylesheet" href="product_detail.css"></link>
<link rel="stylesheet" href="../main/header_footer.css"></link>
<style></style>
</head>


<%
	String p_no = request.getParameter("p_no");
	ProductDao prodao = ProductDao.getInstance();
	P_detailDao pddao = P_detailDao.getInstance();
	
	
	ProductVo provo = prodao.proDetail1(p_no);
	P_detailVo pdvo = pddao.proDetail2(p_no);
	
%>
<body>
	<div class="wrapper">
	
		<%@ include file="../main/header.jsp" %>
		
		<section>
			<form id="product_form" name="product_form" method="GET" action="add_cart.jsp">
				<div class="product_detail">
					<div class="product_detail_image">
						<img name="img" src="<%= provo.getImg()%>">
					</div>
					<div class="product_detail_content">
						<p id="p_no"><%=p_no %></p>
						<input type="hidden" name="p_no" value="<%=p_no%>">
						<p id="brand"><%= provo.getBrand() %></p>
						<p id="product"><%= provo.getName() %></p>
						<p><span id="discount">50%</span>&nbsp;&nbsp;
						<span id="price2"><%=provo.getPrice()%>원</span>&nbsp;&nbsp;
						<span id="price1"><del><%= provo.getPrice() %>원</del></span></p>
						<hr>
						<p><span id="delivery_fee">배송비</span><span id="free_delivery">무료배송</span></p>
						<br><br>
						<select id="product_size" name="size">
							<option selected="selected">[사이즈] 옵션을 선택하세요</option>
							<option>L (수량 : <%= pdvo.getL_size() %>)</option>
							<option>M (수량 : <%= pdvo.getM_size() %>)</option>
							<option>Free (수량 : <%= pdvo.getF_size() %>)</option>
						</select>
						<p id="price"><span id="total">총 상품 금액</span><span id="total-price">0원</span></p>
						<br>
						<button onclick="cart_add();">장바구니</button>&nbsp;
						<button type="submit" <%if(session.getAttribute("userid")!=null){ %>formaction="../cart/pay.jsp"<%}else { %>formaction="../custom/reg_nouser.jsp"<%} %> formmethod="post">바로 구매</button>
					</div>
				</div>
			</form>
			
			<div class="product_info_review_QnA">
				<div class="product_info">
					<p>상품정보</p>
				</div>
				<div class="product_review">
					<p>리뷰</p>
				</div>
				<div class="product_QnA">
					<p>Q&A</p>
				</div>
			</div>
			
			<div id="info">
				<div class="info_title">
					<img src="../images/delivery.jpg" alt="delivery"><br>
					<img alt="" src="<%= pdvo.getImg1() %>"><br>
					<img alt="" src="<%= pdvo.getImg2() %>"><br>
					<img alt="" src="<%= pdvo.getImg3() %>"><br>
					<img alt="" src="<%= pdvo.getImg4() %>">
				</div>
			</div>
			
			<div id="review">
				<div class="review_title">
					<h2 class="review">상품리뷰
						<button type="button" id="write_review" onclick="show_write_review();">상품 리뷰 작성하기</button>
					</h2>
					
					
					<div class="write_review">
						<p>
							<span class="review_id">dkdlel0611</span>
							<span class="review_date">2021-06-11</span>
						</p>
						<br>
						<textarea placeholder="리뷰를 작성해주세요!"></textarea>
						<button id="review_reg">리뷰 등록</button>
					</div>
					<!-- 리뷰내용 -->
					<div class="product_write_review">
						<p>
							<span class="review_id">dkdlel0611</span>
							<span class="review_date">2021-06-11</span>
						</p>
						<br>
						<p class="review_content">
							리뷰내용
						</p>
					</div>
					<div class="product_write_review">
						<p>
							<span class="review_id">dkdlel0611</span>
							<span class="review_date">2021-06-11</span>
						</p>
						<br>
						<p class="review_content">
							리뷰내용
						</p>
					</div>
					
				</div>				
			</div>
			
			<div id="QnA">
				<div class="QnA_title">
					<h2 class="QnA">Q&A
						<button type="button" id="write_QnA" onclick="location.href='write_QnA.jsp'">문의 내용 작성하기</button>
					</h2>
				</div>
				
				<table>
					<thead>
						<tr>
							<td class="QnA-no">번호</td>
							<td class="QnA-title">제목</td>
							<td class="QnA-user">작성자</td>
							<td class="QnA-date">작성일</td>
							<td class="QnA-vote">추천</td>
							<td class="QnA-view">조회</td>
						</tr>
					</thead>
					<tbody>
					
						<!-- QnA 내용 -->
						<tr class="">
							<td class="QnA-no">11</td>
							<td class="QnA-title">제목 입력</td>
							<td class="QnA-user">홍길동</td>
							<td class="QnA-date">2021-06-11</td>
							<td class="QnA-vote">0</td>
							<td class="QnA-view">0</td>
						</tr>
						<tr class="">
							<td class="QnA-no">11</td>
							<td class="QnA-title">제목 입력</td>
							<td class="QnA-user">홍길동</td>
							<td class="QnA-date">2021-06-11</td>
							<td class="QnA-vote">0</td>
							<td class="QnA-view">0</td>
						</tr>
						
					</tbody>
				</table>
				
			</div>
		</section>
		
		<%@ include file="../main/footer.jsp" %>
	</div>
</body>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="product_detail.js"></script>
<script src="../main/header_footer.js"></script>
</html>