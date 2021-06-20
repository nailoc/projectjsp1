<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
<style>

input{
	width : 60px;
}
input#bt{
	width : 30px;
}
td{
	border : 1px solid black;
}
select{
	width : 60px;
}
</style>
</head>
<body>

	<div class="product_input">

		<form id="form1" name="fomr1" method="get" action="product_insert.jsp">
			 
			 <div><input id="bt"type="button" value="+" onclick="add_row()">
                  <input id="bt"type="button" value="-" onclick="delete_row()"></div>
			  <table>
			<tr>
                <td>상품번호</td>
                <td>카테고리</td>
                <td>상품명</td>
                <td>상품설명</td>
                <td>판매가</td>
                <td>원가</td>
                <td>브랜드</td>
                <td>img</td>
                <td>L 입고량</td>
                <td>M 입고량</td>
                <td>F 입고량</td>
                <td>img1</td>
                <td>img2</td>
                <td>img3</td>
                
            </tr>
            
            
            <tr>
                <td><input id="p_no" name="p_no"></td>
                <td><select id="kind" name="kind">
                	<option value="1">TOPS</option>
                	<option value="2">OUTERWEAR</option>
                	<option value="3">PANTS</option>
                	<option value="4">ACCESSORY</option>
                </select></td>
                <td><input id="name" name="name"></td>
                <td><input name="explanation" id="explanation"></td>
                <td><input id="price1" name="price1"></td>
                <td><input id="price1" name="price2"></td>
                <td><input id="brand" name="brand"></td>
                <td><input type="file" id="img1" name="img1"></td>
                <td><input id="l_size" name="l_size"></td>
                <td><input id="m_size" name="m_size"></td>
                <td><input id="f_size" name="f_size"></td>
				<td><input type="file" name="img"></td>
                <td><input type="file" id="img2" name="img2"></td>
                <td><input type="file" id="img3" name="img3"></td>
            </tr>
            
            
            <tbody id="row_tr"></tbody>
            
          </table>
 			<div><input type="submit" value="등록"></div> 
            <div><input type="button" value="목록" onclick="location.href=''"> </div>    
             
		
		</form>
	</div>


</body>

<script>

	function add_row(){
		var objRow;
		objRow = document.all["row_tr"].insertRow();
		
			var p_no = objRow.insertCell();
		p_no.innerHTML = "<input id='p_no' name='p_no'>"
			
		
			var kind = objRow.insertCell();
		kind.innerHTML = "<select id='kind' name='kind'><option value='1'>TOPS</option><option value='2'>OUTERWEAR</option><option value='3'>PANTS</option><option value='4'>ACCESSORY</option></select>"

		
			var name = objRow.insertCell();
		name.innerHTML = "<input id='name' name='name'>"

		
			var explanation = objRow.insertCell();
		explanation.innerHTML = "<input name='explanation' id='explanation'>"

		
			var price1 = objRow.insertCell();
		price1.innerHTML = "<input id='price1' name='price1'>"

		
			var price2 = objRow.insertCell();
		price2.innerHTML = "<input id='price2' name='price2'>"

		
			var brand = objRow.insertCell();
		brand.innerHTML = "<input id='brand' name='brand'>"

		
			var img = objRow.insertCell();
		img.innerHTML = "<input type='file' name='img'>"
		
		
			var l_size = objRow.insertCell();
		l_size.innerHTML = "<input id='l_size' name='l_size'>"

		
			var m_size = objRow.insertCell();
		m_size.innerHTML = "<input id='m_size' name='m_size'>"

		
			var f_size = objRow.insertCell();
		f_size.innerHTML = "<input id='f_size' name='f_size'>"

		
			var img1 = objRow.insertCell();
		img1.innerHTML = "<input type='file' name='img1'>"

		
			var img2 = objRow.insertCell();
		img2.innerHTML = "<input type='file' name='img2'>"

		
			var img3 = objRow.insertCell();
		img3.innerHTML = "<input type='file' name='img3'>"

	}
	
	
	function delete_row(){
		var tbody = document.getElementById("row_tr");
		var newRow = tbody.deleteRow();
	}
</script>
</html>