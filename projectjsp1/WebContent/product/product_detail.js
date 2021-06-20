$(document).ready(function(){
	$("div#review").hide();
	$("div.write_review").hide();
	$("div#QnA").hide();
	$("div.product_info").click(function(){
		$("div#review").hide();
		$("div#QnA").hide();
		$("div.write_review").hide();
		$("button#write_review").show();
		$("div#info").show();
	});
	$("div.product_review").click(function(){
		$("div#info").hide();
		$("div#QnA").hide();
		$("div.write_review").hide();
		$("button#write_review").show();
		$("div#review").show();
		
	});
	$("div.product_QnA").click(function(){
		$("div#review").hide();
		$("div#info").hide();
		$("div.write_review").hide();
		$("button#write_review").show();
		$("div#QnA").show();
	});
	
	CKEDITOR.replace('iboard_content');
});

function show_write_review() {
	$("button#write_review").hide();
	$("div.write_review").show();
}

function cart_add(id){
	if(id==null){
		alert("로그인이 되어있지 않습니다. 로그인 해주세요.");
		location.href="../login/login.jsp";
	}else{
		ok = confirm("장바구니에 담으시겠습니까?","");
		if(ok==true){
			var form = document.getElementById("product_form");
			form.submit();
		}
	}
}

