<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
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
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="../main/header_footer.css"></link>
<link rel="stylesheet" href="order_list_show.css"></link>
<style></style>
</head>
<body>
	<div class="wrapper">
	
		<%@ include file="../main/header.jsp" %>
		
		<section>
			<table>
				<tr id="menu">
					<td id="id">아이디</td>
					<td id="name">이름</td>
					<td id="order_num">주문번호</td>
					<td id="phone_num">핸드폰 번호</td>
					<td id="post">우편번호</td>
					<td id="addr1">주소</td>
					<td id="addr2">상세주소</td>
					<td id="cnt">수량</td>
					<td id="price">가격</td>
					<td id="date">구매일시</td>
				</tr>
				
			<%
				List<Order_ListVo> result = userdao.getOrderListById(id);
				for(int i=0; i<result.size(); i++){
					Order_ListVo orderlist = result.get(i);
					
					out.println("<tr>");
					
			%>
				<tr id="content">
				<td><%=id %></td>
				<td><%=orderlist.getName() %></td>
				<td><%=orderlist.getOrderno() %></td>
				<td><%=orderlist.getPhone() %></td>
				<td><%=orderlist.getZip_num() %></td>
				<td><%=orderlist.getAddress() %></td>
				<td><%=orderlist.getAddress2() %></td>
				<td><%=orderlist.getAmount() %></td>
				<td><%=orderlist.getPrice() %></td>
				<td><%=orderlist.getBuy_datetime() %></td>
				</tr>
			
			<%
				}
				session.invalidate();
			%>
			</table>
		</section>
		
		<%@ include file="../main/footer.jsp" %>
	</div>
	
</body>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../main/header_footer.js"></script>
</html>