<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비동기통신 페이지</title>
</head>
<body>
	<%
		String no = request.getParameter("no");
			BoardDao brddao = BoardDao.getInstance();
			int result = brddao.increaseBoardVote(no);
			out.println(result);
	%>	
</body>
</html>