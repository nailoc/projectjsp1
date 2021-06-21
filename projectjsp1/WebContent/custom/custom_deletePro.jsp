<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.hk.jsp.dao.PopDao" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style></style>
<title>Insert title here</title>
</head>
<body>

	<%
	 String no = request.getParameter("pageNm");
     PopDao bdao = PopDao.getInstance();
    
     PopVo bvo = bdao.getBoardByNo(no);

    
     int result = bdao.deleteBoard(no);
	
	 if(result == 1) {
			out.println("<script>alert('글삭제했습니다'); location.href='custom.jsp'</script>");			
				}else{
			out.println("<script>alert('글삭제 실패했습니다'); location.href='custom_show.jsp?pageNm=+no'</script>");
				}
			
	
	%>
	
<script src="../js/jquery-3.6.0.min.js"></script>
<script>

</script>
</body>
</html>