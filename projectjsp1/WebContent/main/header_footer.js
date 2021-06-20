$(document).ready(function(){
    $("div.sub_wrap").hide();
    
    $("div#header2").hover(
          function(){
             $("div.sub_wrap").slideDown();
          },function(){
             if($("div.sub_wrap").mouseover()){
                $("div.sub_wrap").hover(function(){
                   $("div.sub_wrap").show();
                },function(){
                   $("div.sub_wrap").slideUp();               
                });
             }
             $("div.sub_wrap").hide();
          });

 });