<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<%

	ProductDao prodao = ProductDao.getInstance();
	P_detailDao pddao = P_detailDao.getInstance();
	ProductVo provo = new ProductVo();
	P_detailVo pdvo = new P_detailVo();
	
	//product 부분
	String p_no = request.getParameter("p_no");
	int kind = Integer.parseInt(request.getParameter("kind"));
	String name = request.getParameter("name");
	String explanation = request.getParameter("explanation");
	int price1 = Integer.parseInt(request.getParameter("price1"));
	int price2 = Integer.parseInt(request.getParameter("price2"));
	String brand = request.getParameter("brand");
	String img = request.getParameter("img");
	
	provo.setP_no(p_no);
	provo.setKind(kind);
	provo.setName(name);
	provo.setExplanation(explanation);
	provo.setPrice1(price1);
	provo.setPrice2(price2);
	provo.setBrand(brand);
	provo.setImg(img);
	
	
	int l_size =0;
	int m_size = 0;
	int f_size = 0;
	//p_detail 부분
	if(request.getParameter("l_size").equals("")){
	   l_size = 0;
	}else {
	   l_size = Integer.parseInt(request.getParameter("l_size"));
	}
	if(request.getParameter("m_size").equals("")){
	   m_size = 0;
	}else {
	   m_size = Integer.parseInt(request.getParameter("m_size"));
	}
	if(request.getParameter("f_size").equals("")){
	   f_size = 0;
	}else {
	   f_size = Integer.parseInt(request.getParameter("f_size"));
	}
	String img1 = request.getParameter("img1");
	String img2 = request.getParameter("img2");
	String img3 = request.getParameter("img3");
	String img4 = request.getParameter("img4");
	
	pdvo.setP_no(p_no);
	pdvo.setL_size(l_size);
	pdvo.setM_size(m_size);
	pdvo.setF_size(f_size);
	pdvo.setImg1(img1);
	pdvo.setImg2(img2);
	pdvo.setImg3(img3);
	pdvo.setImg4(img4);
	
	
	
	
	int result1= prodao.regProduct(provo);
	int result2= pddao.regPd(pdvo);
	
	if(result1==1 || result2==1) {
	   out.println("<script>alert('등록완료!'); location.href='product_list.jsp';</script>");
	}else {
	   out.println("<script>alert('등록실패!'); location.href='product_list.jsp';</script>");
	}

%>
<body>
<!-- /
	 -->
</body>

<script>

</script>
</html>