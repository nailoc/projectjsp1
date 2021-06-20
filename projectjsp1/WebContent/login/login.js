$(document).ready(function(){
	$("p#none1, p#none2, p#none3").hide();
});

function login() {
	$("p#none1, p#none2, p#none3").hide();
	var id = $("#id").val();
	var pw = $("#pw").val();
	if(id=="") {
		$("p#none1").show();
	}
	else if(pw=="") {
		$("p#none2").show();
	}
	else {
		$("p#none3").show();
		loginfrm.submit();
	}

}