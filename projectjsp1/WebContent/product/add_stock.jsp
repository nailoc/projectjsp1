<%@ page language="java" contentType="text/html; charset=UTF-8" %>
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
		List<P_detailVo> result = pddao.Stock();
	%>

	<h3>재고 추가</h3>

	<form id="stock_form" action="modify_stock.jsp" method="POST" enctype="multipart/form-data">
		<table>
			<tr>
				<th>상품번호</th>
				<th>L size</th>
				<th>M size</th>
				<th>F size</th>
				<th>img1</th>
				<th>img2</th>
				<th>img3</th>
				<th>img4</th>
			</tr>
			
			<%
				for(int i=0; i<result.size(); i++){
					P_detailVo row = result.get(i);
					out.println("<tr>");
					String l_size = "l_size_"+Integer.toString(i);
					String m_size = "m_size_"+Integer.toString(i);
					String f_size = "f_size_"+Integer.toString(i);
			%>
			
				<td name="p_no"><%=row.getP_no() %></td>
				<td><input type="text"  name=<%=l_size %> value="<%=row.getL_size() %>"></td>
				<td><input type="text"  name="<%=m_size %>" value="<%=row.getM_size() %>"></td>
				<td><input type="text"  name="<%=f_size %>" value="<%=row.getF_size() %>"></td>
				<td><%=row.getImg1() %></td>
				<td><%=row.getImg2() %></td>
				<td><%=row.getImg3() %></td>
				<td><%=row.getImg4() %></td>
			</tr>
			
			<%
				}
			%>
			
		</table>
		
		<button onclick="modify();">수정하기</button>
	</form>

</body>
<script>
	function modify(){
		ok = confirm("수정하시겠습니까?", "");
		if(ok==true){
			stock_frm = document.getElementById("stock_form");
			stock_frm.submit();
		}
	}
</script>
</html>