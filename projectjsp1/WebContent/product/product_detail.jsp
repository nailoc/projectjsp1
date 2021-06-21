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
	
	String id= (String)session.getAttribute("userid");
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
						<button onclick="cart_add(<%=id%>);">장바구니</button>&nbsp;
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
			
<!-- 리뷰창 -->		
<%
	ReplyDao rdao = ReplyDao.getInstance();
	List<ReplyVo> resultRe = rdao.getReplyList(p_no);
%>			
		<form class="" id="frm_write" 
		      method="POST" action="reply_writePro.jsp"> 
		
		<input type="hidden" name="" value="hidden_val">
		<input type="hidden" name="p_no" value="<%=p_no %>">
					
		
					<div class="write_review">
						<textarea name="contents" placeholder="리뷰를 작성해주세요!"></textarea>
						<button type="button" id="review_reg" onclick="reply_write();">리뷰 등록</button>
					</div>
		

</form>

<!-- 리뷰내용 -->
<%



	
    
if(resultRe.size() == 0) {
	out.println("<p>댓글이 없습니다</p>");
}else {
	for(int i=0; i<resultRe.size(); i++) {
		ReplyVo rr = resultRe.get(i);
	
	
%>

					<div class="product_write_review">
						<p>
							<span class="review_id"><%=rr.getId() %></span>
							<span class="review_date"><%=rr.getRegdate() %></span>
						</p>
						<br>
						<p class="review_content">
							<%=rr.getContents() %>
						</p>
					</div>
<%			
	}
	}
%>
					
				</div>				
			</div>
<!--문의창  -->
<%
String sortname = request.getParameter("sort");
if(sortname==null) {
	sortname = "no";
}
String keywordval = request.getParameter("keyword");
if(keywordval==null) {
	keywordval = "";
}

		QnaDao board = QnaDao.getInstance();
			
			//접속테스트 종료
			//리스트 출력
		
		List<QnaVo> result = board.getBoardList(p_no);
			
		 

%>
			<div id="QnA">
				<div class="QnA_title">
					<h2 class="QnA">Q&A</h2>
					
						<form id="write_QnA" name="write_QnA" method="post" action="write_QnA.jsp">
						
						<input type="hidden" name="p_no" value="<%=p_no %>">
						<button type="submit" id="writeQnA" onclick="bbs_write();">문의 내용 작성하기</button>
						</form>
					
				</div>
				
				<table>
					<thead>
						<tr>
							<td class="QnA-no">번호</td>
							<td class="QnA-title">제목</td>
							<td class="QnA-user">작성자</td>
							<td class="QnA-date">작성일</td>
							<td class="QnA-view">조회</td>
						</tr>
					</thead>
					<tbody>
					<tr class="Qna_contents">
						<!-- QnA 내용 -->
			<%
						if(result.size() == 0) {
							out.println("<td colspan='4'>작성된 글이 없습니다<td/>");
						}else {
							for(int i=0; i<result.size(); i++) {
						QnaVo row = result.get(i);			
			%>
						
							<td class="QnA-no"><%= row.getNo() %></td>
							<td class="QnA-title"><a href="QnA_show.jsp?pageNm=<%= row.getNo() %>"><%= row.getTitle() %></a></td>
							<td class="QnA-user"><%= row.getWrite_id() %></td>
							<td class="QnA-date"><%= row.getRegdate() %></td>
							<td class="QnA-view"><%= row.getViews() %></td>
						</tr>
			<%
							}
						}
			%>
						
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
<script>
function bbs_write(){
	ok = confirm("문의글 작성하시겠어요?");
	if(ok==true){
		var form = document.getElementById("write_QnA");
		form.submit();
	}
}
function reply_write() {
	frm = document.getElementById("frm_write");
	frm.submit();
}
</script>
</html>