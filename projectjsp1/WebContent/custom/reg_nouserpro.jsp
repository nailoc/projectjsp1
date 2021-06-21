<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
<style></style>
</head>
<body>

	<%
		
		
		UserDao userdao = UserDao.getInstance();
		
		String no = userdao.No_User_no();
		String name = request.getParameter("id");
		String pw = request.getParameter("pw");
		String phn = request.getParameter("phn");
		String email = request.getParameter("email");
		String zipcode = request.getParameter("zip_num");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		int price = Integer.parseInt(request.getParameter("sum"));
		
		No_UserVo nouservo = new No_UserVo();
		nouservo.setNo(no);
		nouservo.setPw(pw);
		nouservo.setPhone(phn);
		nouservo.setEmail(email);
		nouservo.setZip_num(zipcode);
		nouservo.setAddress(address);
		nouservo.setAddress2(address2);
		
		userdao.regNo_User(nouservo);
		
		//비회원 주문하기
		String orderno = userdao.regOrderNo();
		
		Order_ListVo orderlistvo = new Order_ListVo();
		
		orderlistvo.setOrder_id(nouservo.getNo());
		orderlistvo.setName(name);
		orderlistvo.setOrderno(orderno);
		orderlistvo.setPhone(phn);
		orderlistvo.setZip_num(zipcode);
		orderlistvo.setAddress(address);
		orderlistvo.setAddress2(address2);
		orderlistvo.setPrice(price);
		
		
		int result = userdao.regOrder_List(orderlistvo);
			
		if(result==1) {
			session.setAttribute("userid", no);
			out.println("<script>alert('비회원 주문 성공'); location.href='../cart/order_list_show.jsp'</script>");
			session.invalidate();
		}else {
			response.sendRedirect("regorder.jsp");
		}
	%>

</body>
<script></script>
</html>