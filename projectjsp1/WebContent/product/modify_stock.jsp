<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
<style></style>
</head>
<body>

	<%
		P_detailDao pddao = P_detailDao.getInstance();
		List<P_detailVo> result = pddao.Find_p_no();
		
		String[] p_no = new String[result.size()];
		for(int i=0; i<result.size(); i++){
			P_detailVo row = result.get(i);
			
			p_no[i] = row.getP_no();
			
			String l_size = "l_size_"+Integer.toString(i);
			String m_size = "m_size_"+Integer.toString(i);
			String f_size = "f_size_"+Integer.toString(i);
			
			row.setL_size(Integer.parseInt(request.getParameter(l_size)));
			row.setM_size(Integer.parseInt(request.getParameter("m_size")));
			row.setF_size(Integer.parseInt(request.getParameter("f_size")));
			
			result.add(row);
			
			out.println(request.getParameter(l_size));
			int res = pddao.modify_Stock(p_no[i]);
			
			if(res==1) {
				out.println("<script>alert('등록완료!'); location.href='product_list.jsp';</script>");
			}else {
				out.println("<script>alert('등록실패!'); location.href='product_list.jsp';</script>");
			}
		}
	%>

</body>
<script></script>
</html>