<%@ page language="java" contentType="text/html; charset=UTF-8" %>
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
		session.invalidate();	//세션 정보를 모두 삭제함.
		response.sendRedirect("login.jsp");
	%>

</body>
<script></script>
</html>