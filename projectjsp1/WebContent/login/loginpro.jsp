<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		UserDao memdao = UserDao.getInstance();
		int result = memdao.authUserByIdPw(id, pw);
		//out.println("로그인결과 : " + result);
		if(result==0) {
			out.println("<script>alert('아이디가 틀립니다.'); history.back();</script>");
		}else if(result==-1){
			out.println("<script>alert('비밀번호가 틀립니다.'); history.back();</script>");
		}else if(result==1){
			//인증성공되면 세션생성
			session.setAttribute("userid", id);
			out.println("<script>alert('로그인 성공입니다.'); location.href='../main/main.jsp'</script>");
		}
	%>

</body>
<script></script>
</html>