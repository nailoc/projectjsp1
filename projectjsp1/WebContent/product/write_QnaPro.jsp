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
String uploadPath = "D:\\upload";
int maxSize = 1024*1024*10; // 10메가 - 바이트기준으로  
MultipartRequest multi = new MultipartRequest(request, 
                                      uploadPath, 
                                      maxSize, 
                                      "UTF-8", 
                                      new DefaultFileRenamePolicy());
		//userID=(String) session.getAttribute("userID");
    	//String id = (String)session.getAttribute("userID");
    	String id = multi.getParameter("id");
		String contents = multi.getParameter("contents");
		String title = multi.getParameter("title");
		String p_no = multi.getParameter("p_no");
		
		
		
		QnaVo qVo = new QnaVo();
		
		qVo.setTitle(title);
		qVo.setWrite_id(id);
		qVo.setContents(contents);
		qVo.setP_no(p_no);
		
		QnaDao qnaDao = QnaDao.getInstance();
		int result = qnaDao.saveBoard(qVo);
		
		if(result == 1) {
			
			
			
			response.sendRedirect("./product_detail.jsp?p_no=" + p_no);	
		
		}else{
			out.println("<script>alert(' 실패했습니다');</script>");
				}
%>


</html>