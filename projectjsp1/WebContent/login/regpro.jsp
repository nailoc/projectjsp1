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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phn = request.getParameter("phn");
		String email = request.getParameter("email");
			
		String zipcode = request.getParameter("zip_num");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		out.println("확인:"+address);
		//out.println("등록아이디:"+id);
		//넘어온 정보 확인
		UserVo uservo = new UserVo();
		uservo.setId(id);
		uservo.setPw(pw);
		uservo.setName(name);
		uservo.setEmail(email);
		uservo.setZip_num(zipcode);
		uservo.setAddress(address);
		uservo.setAddress2(address2);
		uservo.setPhone(phn);
			
		UserDao userdao = UserDao.getInstance();
		int result= userdao.regMember(uservo);
			
		if(result==1) {
			response.sendRedirect("login.jsp");
		}else {
			response.sendRedirect("login.jsp");
		}
	%>

</body>
<script></script>
</html>