<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<%
		String[] p_no = request.getParameterValues("check");
		ProductDao prodao = ProductDao.getInstance();
		
		int result = prodao.proDelect(p_no);
		
		if(result == p_no.length){
			out.println("<script> alert('삭제실패');  location.href='product_list.jsp'; </script>");
		}else{
			out.println("<script> alert('삭제성공'); location.href='product_list.jsp'; </script>");
		}
	%>
	

<body>

</body>
<script></script>
</html>