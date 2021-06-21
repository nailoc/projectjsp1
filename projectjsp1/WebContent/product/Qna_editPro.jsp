<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style></style>
<title>Insert title here</title>
</head>
<body>

	<%
			    //String title = request.getParameter("title");
				//String writeName = request.getParameter("write_name");
				//String passwd = request.getParameter("passwd");
				//String ck_contents = request.getParameter("contents");
			
				// 파일을 업로드 하는 경우 cos.jar 사용해서 전송값을 저장
				String uploadPath = "D:\\upload";
				
				int maxSize = 1024*1024*10; // 10메가 - 바이트기준으로  
				MultipartRequest multi = new MultipartRequest(request, 
				                                      uploadPath, 
				                                      maxSize, 
				                                      "UTF-8", 
				                                      new DefaultFileRenamePolicy());
				String no = multi.getParameter("num");
				String title = multi.getParameter("title");
				
				String ck_contents = multi.getParameter("contents");
				String upfileName = multi.getFilesystemName("attach1");  // 첨부파일 1번
			


			
				//out.println("확인:"+upfileName);
				
				PopVo bVo = new PopVo();
				bVo.setTitle(title);
	
				bVo.setContents(ck_contents);
				bVo.setAttach1(upfileName);
				bVo.setNo(Integer.parseInt(no));
	
				// BoardDao 에서 데이터저장
				PopDao brddao = PopDao.getInstance();
				int result = brddao.editBoard(bVo);
				
				// 성공이면 목록으로 이동, 실패면 글쓰기폼으로 이동
				if(result == 1) {
			out.println("<script>alert('글수정했습니다'); location.href='Qna_show.jsp?pageNm='+no</script>");			
				}else{
			out.println("<script>alert('글저장을 실패했습니다'); location.href='Qna_show.jsp?pageNm='+no</script>");
				}
		%>
	
<script src="../js/jquery-3.6.0.min.js"></script>
<script>

</script>
</body>
</html>