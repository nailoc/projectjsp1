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
<style></style>
</head>
<body>
	<%
		String id = "";
		String p_no = "";
		
		id = (String)session.getAttribute("userid");
		p_no = request.getParameter("p_no");
		
		String outputsize = request.getParameter("size");
		String[] splitsize = outputsize.split("");
		String size = splitsize[0];
		if(size.equals("[")){
			out.println("<script>alert('사이즈를 선택해주세요.'); history.back();</script>");
		}else {
		
		UserDao userdao = UserDao.getInstance();
		ProductVo provo = userdao.check_Addcart(p_no);
		
		
		String img = provo.getImg();
		String name = provo.getName();
		
		
		
		int amount=1;
		int price = provo.getPrice();
		int no = userdao.check_CartNo(id);
		
		CartVo cartvo = new CartVo();
		cartvo.setNo(no);
		cartvo.setId(id);
		cartvo.setP_no(p_no);
		cartvo.setImg(img);
		cartvo.setName(name);
		cartvo.setSize(size);
		cartvo.setAmount(amount);
		cartvo.setPrice(price);
		
		int result = userdao.addCart(cartvo);
		
		if(result==1){
			out.println("<script>ok = confirm('장바구니에 추가되었습니다. 장바구니로 이동하시겠습니까?','')");
			out.println("if(ok==true){");
			out.println("location.href='../cart/cart.jsp';");
			out.println("}else {location.href='product_detail.jsp?p_no="+p_no+"';}</script>");
			
		}else {
			out.println("<script>alert('장바구니 등록 실패'); history.back();</script>");
		}
		
		}
		
	%>

</body>
<script></script>
</html>