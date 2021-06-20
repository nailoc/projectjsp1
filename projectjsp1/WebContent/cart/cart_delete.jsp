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
		String[] no = request.getParameterValues("check");
		UserDao userdao = UserDao.getInstance();
		int result = userdao.delete_CartByP_no(no);
		
		if(result==no.length){
			out.println("<script> alert('삭제 실패'); location.href='cart.jsp'; </script>");
		}else{
			out.println("<script> alert('선택하신 "+no.length+"개의 물품이 삭제되었습니다.'); location.href='cart.jsp'; </script>");
		}

	%>
</body>
<script></script>
</html>