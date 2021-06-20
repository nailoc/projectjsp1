<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import="com.hk.jsp.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
<style>
	form {
		width: 400px;
		margin: 0 auto;
	}
	input {
		width: 100%;
		padding= 10px;
		border: 1px solid #cccccc;
		margin-bottom: 5px;
	}
</style>
</head>
<body>
	<%
		out.println("<h3>중복체크화면</h3>");
		String id = request.getParameter("id");
		
		//MemberDao 에서 checkMemberById를 호출해서
		//중복여부를 출력가능
		UserDao memberdao = UserDao.getInstance();
		int result = memberdao.checkUserById(id);
		if(result==0){
			out.println("'"+id+"'은(는) 사용 가능한 아이디입니다.");
		}else {
			out.println("'"+id+"'은(는) 사용할 수 없습니다. 다른 아이디를 입력해 주세요.");
		}
	%>
	
	<p><input type="button" value="창닫기" onclick="closeChkIdWin(<%=result%>);"></p>

</body>
<script>
	function closeChkIdWin(result){
		// 회원가입창에 사용가능하다는 정보를 전달 필요
		//alert(result);
		// 부모창에 hidden 에 값을 넣어줌
		opener.document.getElementById("checkid_ok").value=result;
		if(result!=0){
			opener.document.getElementById("regid").value="";
		}
		self.close();
	}
</script>
</html>