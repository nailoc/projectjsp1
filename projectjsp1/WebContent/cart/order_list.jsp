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


	<div id="user">
	<%
	String id=null;
	//String name =null;
	if(session.getAttribute("userid")==null) {	//세션이 없다면
		out.println("<div>"+
				"<button onclick='no_user_order();'>비회원 주문 조회</button>"+
				"<button onclick='user_login();'>회원 주문 조회</button>"+
			"</div>");
	}else {//세션이 있다면 바로 주문조회
		id=(String)session.getAttribute("userid");
		out.println("<button onclick='user_order_list();'>주문조회</button>");
	}
	 %>
	 </div>
</body>
<script>
	function no_user_order() {
		location.href="nouser_orderlist.jsp"
	}
	function user_login() {
		location.href="../login/login.jsp";
	}
	function user_order_list(){
		location.href="order_list_show.jsp";
	}
</script>
</html>