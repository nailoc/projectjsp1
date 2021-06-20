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
		String board_no = request.getParameter("board_no");
		
		ReplyDao replyDao = ReplyDao.getInstance();
		ReplyVo rVo = new ReplyVo();
		
		rVo.setId(id);
		rVo.setContents(contents);
		rVo.setBoard_no(board_no);
		
		int result = replyDao.saveReply(rVo);
		
		if(result == 1) {
			
			
			response.sendRedirect("./noticeshow.jsp?pageNm=" + board_no);	
		
		}else{
			out.println("<script>alert(' 실패했습니다');");
				}
%>


</html>