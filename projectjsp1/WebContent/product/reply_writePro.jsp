<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>


<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<style></style>
<title>Insert title here</title>


<%

		//userID=(String) session.getAttribute("userID");
    	//String id = (String)session.getAttribute("userID");
    	String id = request.getParameter("id");
		String contents = request.getParameter("contents");
		String p_no = request.getParameter("p_no");
		
		ReplyDao replyDao = ReplyDao.getInstance();
		ReplyVo rVo = new ReplyVo();
		
		rVo.setId(id);
		rVo.setContents(contents);
		rVo.setBoard_no(p_no);
		
		int result = replyDao.saveReply(rVo);
		
		if(result == 1) {
			
			
			response.sendRedirect("./product_detail.jsp?p_no=" + p_no);	
		
		}else{
			out.println("<script>alert(' 실패했습니다');");
				}
%>


</html>