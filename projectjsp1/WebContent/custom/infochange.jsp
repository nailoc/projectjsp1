<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%
	String id=null;
	UserVo uservo = new UserVo();
	if(session.getAttribute("userid")==null) {	//세션이 없다면
		out.println("<script>alert('로그인되지 않았습니다.'); location.href='../login/login.jsp'</script>");
	}else {//세션이 있다면 회원정보 가져오기
		id=(String)session.getAttribute("userid");
		UserDao userdao = UserDao.getInstance();
		uservo = userdao.getUserById(id);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>회원가입</title>
<link rel="stylesheet" href="css/style.css"></link>
<link rel="stylesheet" href="../main/header_footer.css"></link>
<link rel="stylesheet" href="../custom/infochange.css"></link>
<style></style>
</head>
<body>

	<div class="wrapper">
	
		<%@ include file="../main/header.jsp" %>
		
        <section>
	        <div class="admin">
	        	<br>
	        	<form id="user-form" class="content" action="modifypro.jsp" method="GET">
		      		<p>이름</p>
		      		<p><input type="text" name="name" id="name" value="<%=uservo.getName() %>" placeholder="이름 입력"></p>
		      		
		      		<!-- 전화번호 이메일 주소 -->
		      		<p>전화번호</p>
		      		<p><input type="text" name="phone" id="phone" value="<%=uservo.getPhone() %>" placeholder="전화번호 입력"></p>
		      		
		      		<p>이메일</p>
		      		<p><input type="email" name="email" id="email" value="<%=uservo.getEmail() %>" placeholder="이메일 입력"></p> 
		      		
		      		<p>주소</p>
					<p><input type="text" id="sample6_postcode" name="zipcode" value="<%=uservo.getZip_num() %>" placeholder="우편번호">&nbsp;&nbsp;
					<input type="button" id="zipsearch" onclick="sample6_execDaumPostcode();" value="우편번호 찾기"></p>
					<p><input type="text" id="sample6_address" name="address" placeholder="주소" value="<%=uservo.getAddress() %>"></p>
					<p><input type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소" value="<%=uservo.getAddress2() %>"></p>
		      		<br><br>
			        <button type="button" id="register_btn" onclick="modify();">수정하기</button>
	      		</form>
		        
		    </div>
        </section>    
		
		<%@ include file="../main/footer.jsp" %>
	</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../main/header_footer.js"></script>
<script src="register.js"></script>
</html>