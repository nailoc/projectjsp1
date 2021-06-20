<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<link rel="stylesheet" href="css/style.css"></link>
<style>
	h3, form {
		width: 400px;
		margin: 0 auto;
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
	<h3>심플 회원 로그인 및 회원가입</h3>
	<br>
	
	<input type="checkbox" id="form-switch">
	<form id="login-form" action="loginpro.jsp" method="GET">
		<input type="text" name="userid" id="userid" placeholder="회원아이디">		
		<input type="password" name="userpw" id="userpw" placeholder="회원비밀번호">
		<button type="button" onclick="login();">로그인</button>
		<label for="form-switch"><span>회원가입</span></label>
	</form>

	<form id="register-form" action="regpro.jsp" method="GET">
		<input type="hidden" id="checkid_ok" value="1">
		<input type="text" id="regid" name="regid" placeholder="회원아이디">
		<input type="button" id="checkid" value="중복체크" onclick="chkid();">
		<input type="password" id="regpw" name="regpw" placeholder="회원비밀번호">
		<input type="text" name="name" placeholder="이름">
		<input type="email" name="email" placeholder="이메일">
		
		<!-- input type="text" id="zipcode" placeholder="우편번호">
		<input type="button" id="zipsearch" value="우편번호검색">
		<input type="text" placeholder="주소">
		<input type="text" placeholder="상세주소" -->
		
		<input type="text" id="sample6_postcode" name="zipcode" placeholder="우편번호">
		<input type="button" id="zipsearch" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" name="address" placeholder="주소"><br>
		<input type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소">
		<!-- input type="text" id="sample6_extraAddress" placeholder="참고항목" -->
		
		<input type="text" name="phn" placeholder="전화번호">
		<button type="button" onclick="register();">회원가입</button>
		<label for="form-switch"><span>가입한 회원? 로그인하세요</span></label>
	</form>
	
	
	
</body>

	
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

	function login() {
		id = document.getElementById("userid").value;
		pw = document.getElementById("userpw").value;
		if(id=="") {
			alert("아이디를 입력하시오!");
			return;
		}else if(pw=="") {
			alert("패스워드를 입력하시오!");
			return;
		}else{
			loginfrm = document.getElementById("login-form");
			loginfrm.submit();
		}
	}
	
	//중복체크
	function chkid() {
		var userid = document.getElementById("regid").value;
		if(userid) {
			url = "checkid.jsp?id="+userid;
			window.open(url, "중복체크확인", "width=400,height=250");
		}else{
			alert("아이디를 입력하시오!");
		}
	}
	
	//회원가입
	function register() {
		chkok = document.getElementById("checkid_ok").value;
		userid = document.getElementById("regid").value;
		userpw = document.getElementById("regpw").value;
		
		if(userid == "") {
			alert("아이디를 입력하시오");
			return;
		}
		
		if(chkok==0) {
			//alert("중복체크함")
		}else{
			alert("아이디 중복 체크를 하시오!");
			return;
		}
		
		if(userpw=="") {
			alert("비밀번호를 입력하시오");
			return;
		}
		
		// 필요한 거 체크 = validation check
		
		// 회원가입
		regform = document.getElementById("register-form");
		regform.submit();
		
		
	}

</script>
</html>