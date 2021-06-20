<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.hk.jsp.dao.BoardDao" %>
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
     BoardDao bdao = BoardDao.getInstance();
    
     BoardVo bvo = bdao.getBoardByNo(no);

    
     int result = bdao.deleteBoard(no);
	
	 if(result == 1) {
			out.println("<script>alert('글삭제했습니다'); location.href='notice.jsp'</script>");			
				}else{
			out.println("<script>alert('글삭제 실패했습니다'); location.href='noticeshow.jsp'</script>");
				}
			
	
	%>
	
<script src="../js/jquery-3.6.0.min.js"></script>
<script>

</script>
</body>
</html>