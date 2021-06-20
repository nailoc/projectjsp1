<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hk.jsp.dao.*" %>
	
<%
	String id=null;

	if(session.getAttribute("userid")==null) {	//세션이 없다면
		out.println("<script>alert('로그인되지 않았습니다.'); location.href='login_reg.jsp'</script>");
	}else {//세션이 있다면 회원정보 가져오기
		id=(String)session.getAttribute("userid");
		//out.println("확인: "+id);
		UserDao memdao = UserDao.getInstance();
		int result = memdao.withdrawUserById(id)
				
				;
		
		if(result==1) {
			out.println("<script>alert('회원탈퇴 성공입니다!'); location.href='logout.jsp'; </script>");
		}else {
			out.println("<script>alert('회원탈퇴 실패입니다!'); location.href='mypage.jsp'; </script>");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
<style>
	h3, form, div.mypic {
		width: 400px;
		margin: 0 auto;
	}
	h3, div.mypic {
		width: 400px;
		margin: 0 auto;
		text-align: center;
	}
	div.mypic img {
		width: 200px;
		border-radius: 50%;
	}
	input {
		width: 100%;
		padding: 10px;
		border: 1px solid #cccccc;
		margin-bottom: 5px;
	}
	input#sample6_postcode, input#zipsearch,
	input#regid, input#checkid, input#sample2_postcode {
		width: 40%;
		padding: 10px;
		border: 1px solid #cccccc;
		margin-bottom: 5px;
	}
	input#attpic {
		background-color: #ffffff;
	}
	
	button {
		padding: 10px;
	}
	label {
		cursor: pointer;
	}
	#register-form {
		display: none;
	}
	#form-switch:checked~#register-form {
		display:block;
	}
	#form-switch:checked~#login-form {
		display:none;
	}
	#form-switch {
		display: none;	
	}
</style>
</head>
<body>

	<h3>회원탈퇴</h3>

</body>
<script></script>
</html>