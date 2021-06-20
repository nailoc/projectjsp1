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
		String pw = request.getParameter("pw");
		String phn = request.getParameter("phone");
		String email = request.getParameter("email");
		String zipcode = request.getParameter("zip_num");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		
		No_UserVo nouservo = new No_UserVo();
		nouservo.setNo(no);
		nouservo.setPw(pw);
		nouservo.setPhone(phn);
		nouservo.setEmail(email);
		nouservo.setZip_num(zipcode);
		nouservo.setAddress(address);
		nouservo.setAddress2(address2);
			
		
		int result = userdao.regNo_User(nouservo);
			
		if(result==1) {
			response.sendRedirect("login.jsp");
		}else {
			response.sendRedirect("login.jsp");
		}
	%>

</body>
<script></script>
</html>