function nouser_check(){
	ok = confirm("비회원으로 주문조회 하시겠습니까?","");
	if(ok==true){
		nouser_chk_frm = document.getElementById("nouser_check");
		nouser_chk_frm.submit();
	}
}