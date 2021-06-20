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
		String id=null;
		//String name =null;
		if(session.getAttribute("userid")==null) {	//세션이 없다면
			id = userdao.No_User_no();
		}else {
			id=(String)session.getAttribute("userid");
		}
		
		
		String order_no = userdao.regOrderNo();
		String name = request.getParameter("id");
		String phone = request.getParameter("phn");
		String zip_num = request.getParameter("zip_num");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		int amount = 1;
		int price = Integer.parseInt(request.getParameter("sum"));
		
		Order_ListVo orderlistvo = new Order_ListVo();
		
		orderlistvo.setOrder_id(id);
		orderlistvo.setName(name);
		orderlistvo.setOrderno(order_no);
		orderlistvo.setPhone(phone);
		orderlistvo.setZip_num(zip_num);
		orderlistvo.setAddress(address);
		orderlistvo.setAddress2(address2);
		orderlistvo.setAmount(amount);
		orderlistvo.setPrice(price);
		
		int result = userdao.regOrder_List(orderlistvo);
		
		if(result==0){
			out.println("<script>alert('주문 실패'); history.back();</script>");
		}else {
			out.println("<script>alert('주문 성공'); location.href='order_list_show.jsp'; </script>");
		}
		
	%>

</body>
<script></script>
</html>