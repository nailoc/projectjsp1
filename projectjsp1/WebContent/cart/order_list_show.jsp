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
<link rel="stylesheet" href="css/style.css"></link>
<style></style>
</head>
<body>

	<table>
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>주문번호</td>
			<td>핸드폰 번호</td>
			<td>우편번호</td>
			<td>주소</td>
			<td>상세주소</td>
			<td>수량</td>
			<td>가격</td>
			<td>구매일시</td>
		</tr>
		
	<%
		List<Order_ListVo> result = userdao.getOrderListById(id);
		for(int i=0; i<result.size(); i++){
			Order_ListVo orderlist = result.get(i);
			out.println("<tr>");
		
	%>
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
	%>

	</table>
</body>
<script></script>
</html>