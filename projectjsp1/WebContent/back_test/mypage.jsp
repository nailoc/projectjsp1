<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.hk.jsp.dao.*" %>
<%@ page import="com.hk.jsp.vo.*" %>
<%
	String id=null;
	//String name =null;
	UserVo mymem = new UserVo();
	if(session.getAttribute("userid")==null) {	//세션이 없다면
		out.println("<script>alert('로그인되지 않았습니다.'); location.href='login.jsp'</script>");
	}else {//세션이 있다면 회원정보 가져오기
		id=(String)session.getAttribute("userid");
		UserDao memdao = UserDao.getInstance();
		mymem = memdao.getUserById(id);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
<style>
	h3, form, div.mypic {
		width: 400px;
		margin: 0 auto;
	}
	h3, div.mypic {
		width: 400px;
		margin: 0 auto;
		text-align: center;
	}
	div.mypic img {
		width: 200px;
		border-radius: 50%;
	}
	input {
		width: 100%;
		padding: 10px;
		border: 1px solid #cccccc;
		margin-bottom: 5px;
	}
	input#sample6_postcode, input#zipsearch,
	input#regid, input#checkid, input#sample2_postcode {
		width: 40%;
		padding: 10px;
		border: 1px solid #cccccc;
		margin-bottom: 5px;
	}
	input#attpic {
		background-color: #ffffff;
	}
	
	button {
		padding: 10px;
	}
	label {
		cursor: pointer;
	}
	#register-form {
		display: none;
	}
	#form-switch:checked~#register-form {
		display:block;
	}
	#form-switch:checked~#login-form {
		display:none;
	}
	#form-switch {
		display: none;	
	}
</style>
</head>
<body>

	<h3>Mypage</h3>
	<br>
	<form id="mem-form" action="modifypro.jsp" method="POST">
		<input type="text" name="name" placeholder="이름" value="<%=mymem.getName()%>">
		<input type="email" name="email" placeholder="이메일" value="<%=mymem.getEmail()%>">
		<input type="text" id="sample6_postcode" name="zipcode" placeholder="우편번호" value="<%=mymem.getZip_num()%>">
		<input type="button" id="zipsearch" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" name="address" placeholder="주소" value="<%=mymem.getAddress() %>">
		<input type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소" value="<%=mymem.getAddress2() %>">		
		<input type="text" name="phone" placeholder="전화번호" value="<%=mymem.getPhone() %>">
		<button type="button" onclick="logout();">로그아웃</button>
		<button type="button" onclick="modify();">회원정보수정</button>
		<button type="button" onclick="delmem();">회원탈퇴</button>
	</form>
	
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    // document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    // document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
		function logout() {
			ok = confirm("로그아웃하시겠습니까?","");
			if(ok==true){
				location.href='logout.jsp';
			}
		}
		
		//회원정보수정
		function modify() {
			ok = confirm("회원정보를 수정하시겠습니까?","");
			if(ok==true) {
				modi_frm = document.getElementById("mem-form");
				modi_frm.submit();
			}
		}
		
		function delmem(){
			ok = confirm("회원을 탈퇴하시겠습니까?","");
			if(ok==true) {
				location.href="delmempro.jsp";
			}
		}
	</script>
	

</body>
<script></script>
</html>