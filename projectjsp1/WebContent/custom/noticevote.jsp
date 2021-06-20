<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비동기통신 페이지</title>
</head>
<body>
	<%
		String no = request.getParameter("pageNm");
			BoardDao brddao = BoardDao.getInstance();
			int result = brddao.increaseBoardVote(no);

	%>	
</body>
<script src="../js/jquery-3.6.0.min.js"></script>
</html>