<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오라클게시판</title>
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
			
			String title = multi.getParameter("title");
			String writeName = multi.getParameter("write_name");
			String passwd = multi.getParameter("passwd");
			String ck_contents = multi.getParameter("contents");
			String upfileName = multi.getFilesystemName("attach1");  // 첨부파일 1번
			
			out.println("확인:"+upfileName);
			
			
			// 데이터베이스 저장
			// *
			// BoardVo 에 담아서 전송
			BoardVo writeVo = new BoardVo();
			writeVo.setTitle(title);
			writeVo.setWrite_name(writeName);
			// 디비에서 컬럼이 생략됨
			writeVo.setContents(ck_contents);
			writeVo.setAttach1(upfileName);
			
			// BoardDao 에서 데이터저장
			BoardDao brddao = BoardDao.getInstance();
			int result = brddao.saveBoard(writeVo);
			
			// 성공이면 목록으로 이동, 실패면 글쓰기폼으로 이동
			if(result == 1) {
		out.println("<script>alert('글저장했습니다'); location.href='noticelist.jsp'</script>");			
			}else{
		out.println("<script>alert('글저장을 실패했습니다'); location.href='noticewrite.jsp'</script>");
			}
	%>
</body>
</html>
