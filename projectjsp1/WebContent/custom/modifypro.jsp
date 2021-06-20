<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%
	String id = null;
	//String name = null;
	UserVo uservo = new UserVo();
	if(session.getAttribute("userid")==null) { // 세션이 없다면
		out.println("<script>alert('로그인되지 않았습니다'); location.href='login_reg.jsp'</script>");
	}else{  // 세션이 있다면 회원정보 가져오기
		id = (String)session.getAttribute("userid"); // 로그인 아이디
		
		
		String name = request.getParameter("name");
		String phn = request.getParameter("phone");
		String email = request.getParameter("email");
		String zipcode = request.getParameter("zipcode");
		String address = request.getParameter("address");
		String address2 = request.getParameter("address2");
		
		uservo.setName(name);
		uservo.setPhone(phn);
		uservo.setEmail(email);
		uservo.setZip_num(zipcode);
		uservo.setAddress(address);
		uservo.setAddress2(address2);
		uservo.setId(id);
	
		UserDao userdao = UserDao.getInstance();
		int result= userdao.modifyUser(uservo);
	
	if(result==1) {
		out.println("<script>alert('회원정보수정 성공입니다!'); location.href='infochange.jsp';</script>");
	}else {
		out.println("<script>alert('회원정보수정 실패입니다!'); location.href='infochange.jsp';</script>");
	}
	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
<style></style>
</head>
<body>
	<h3>회원수정</h3>


</body>
<script></script>
</html>