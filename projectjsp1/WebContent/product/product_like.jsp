<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.hk.jsp.dao.*" %>
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
			String p_no = request.getParameter("p_no");
			ProductDao prodao = ProductDao.getInstance();
			int result = prodao.like_add(p_no);
			out.println(result);
	%>	
</body>
<script></script>
</html>