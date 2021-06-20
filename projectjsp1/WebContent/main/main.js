$(document).ready(function(){
	showslide(slideIndex);
 });

slideIndex = 1;
function showslide(n) {
	slide = $("div.myslide");
	
	slide.eq(slideIndex-1).fadeIn(1000).next(n);
	
	for(i=0; i<slide.length; i++) {
		slide.eq(i).css("display","none");
	}
	if(n>slide.length){
		slideIndex = 1;
		
	}
	if(n<1){
		slideIndex = slide.length;
		
	}
	slide.eq(slideIndex-1).css("display","block");
	
}
function plusslide(n) {
	showslide(slideIndex+=n);
	$("p.page").text(slideIndex+" / 3");
}