<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    
    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- bootstrap 5 icon -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    
    <!-- 부트스트랩 아이콘 -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

	<!-- daum 주소검색 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    
</head>
<style>
a.menu-gift {
    color:#000 !important;
}
div.gift-wrapper{
	padding-top:100px;
	width:100%;
	display:flex;
	flex-direction:column;
	
}
div.Gift{
	width:100%;
	display:flex;
	flex-direction:row;
	flex-wrap:wrap;
}
div.card{
}
p.card-title{
   color:blue;
   font-size:12px;
}

.button{
   background-color:#cff0cc;
   border-radius: 10px;
    border:0;
    outline:0;
    font-size:5px; 
    padding:3px 10px;
}

.button:hover {

  background: green; 
  color: white;
  border:0;
  outline:0;
}
  .container mt-3{
  	width:33%;
  	height:400px;
  }
  
  
  ul.tab_receive{
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    list-style: none;
    overflow: hidden;
    margin: 30px 0 40px;
    padding-bottom: 10px;
    border-bottom: 1px solid #ededed;
  }
  
  li.presentation{
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    margin: 0;
    padding: 0;
    list-style: none;
    float: left;
  }
  
  a.link_tab{
    line-height: 1.5;
    list-style: none;
    overflow-anchor: none;
    text-decoration: none;
    display: block;
    padding: 0 2px 2px;
    color: #000;
    opacity: 1; 
    font-size: 20px;
  }
  
  a.link_tab:hover{
   	color:#000; 
  	font-weight: 600;
  }
 
  a.link_tab:active{
    color:#000; 
  	font-weight: 600;
  }
  
  .wrap_msgprofile{
  	-webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    margin: 0;
    padding: 0;
    position: relative;
  }
  
  .box_profile{
  	-webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    margin: 0;
    padding: 0;
    text-align: center;
    padding-top: 0;
  }
  .thumb_profile{
    -webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    text-align: center;
    margin: 0;
    display: inline-block;
    position: relative;
    width: 36px;
    height: 36px;
    padding: 2px;
    vertical-align: top;
  }
  .thumb_profile .img_g{
    -webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    text-align: center;
    aspect-ratio: auto 36 / 36;
    height: 36px;
    border: 0 none;
    vertical-align: top;
    display: block;
    width: 100%;
  }
  .thumb_profile .frame_squircle{
  	-webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    text-align: center;
    aspect-ratio: auto 42 / 42;
    border: 0 none;
    vertical-align: top;
    position: absolute;
    left: -1px;
    top: -1px;
    width: 42px;
    height: 42px;
  }
  .tit_g{
    -webkit-text-size-adjust: none;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    display: block;
    padding: 12px 0 24px;
    font-size: 20px;
    line-height: 24px;
    color: #111;
    text-align: center;
    padding-bottom: 16px;
  }
  .txt_name{
  	-webkit-text-size-adjust: none;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    font-size: 20px;
    line-height: 24px;
    color: #111;
    text-align: center;
    display: inline-block;
    overflow: hidden;
    max-width: 124px;
    text-overflow: ellipsis;
    white-space: nowrap;
    vertical-align: top;
  }
  .wrap_msgcard{
    -webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    margin: 0 auto;
    width: 285px;
    padding: 8px 0 40px;
  }
  .custom_mask_frame{
    -webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    margin: 0;
    padding: 0;
    overflow: hidden;
    border-radius: 12px;
    background-color: #fff;
    box-shadow: 0 39px 20px -30px rgba(0,0,0,.2);
    -webkit-backface-visibility: hidden;
    -webkit-transform: translate3d(0,0,0);
  }
  .custom_background_image{
  	 -webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    margin: 0;
    padding: 0;
    overflow: hidden;
    position: relative;
    padding-bottom: 66.66%;
    background-image: url(https://t1.kakaocdn.net/gift/message-card/loading.png);
    background-repeat: no-repeat;
    background-size: cover;
  }
  .link_media{
   -webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    overflow-anchor: none;
    color: #000;
    text-decoration: none;
  }
  .link_media img{
  	-webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    color: #000;
    border: 0 none;
    vertical-align: top;
    display: block;
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
  }
  .txt_letter{
  	-webkit-text-size-adjust: none;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    margin: 0;
    padding: 20px 20px 16px;
    font-size: 15px;
    line-height: 22px;
    color: #111;
    letter-spacing: -.033em;
    word-break: break-all;
  }
/*   .link_prd{
  	-webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    overflow-anchor: none;
    color: #000;
    text-decoration: none;
    display: block;
    position: relative;
    padding: 16px 20px;
  } */
  .info_prd{
    -webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    color: #000;
    display: block;
    overflow: hidden;
  }
  .thumb_prd{
    -webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    color: #000;
    overflow: hidden;
    float: left;
    position: relative;
    width: 40px;
    height: 40px;
    border-radius: 2px;
  }
  .thumb_prd .img_g{
    -webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    color: #000;
    border: 0 none;
    vertical-align: top;
    display: block;
    width: 100%;
  }
  .txt_prd{
    -webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    color: #000;
    display: block;
    overflow: hidden;
    padding: 2px 0 0 8px;
  }
  .screen_out{
  	-webkit-text-size-adjust: none;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    color: #000;
    font-size: 10px;
    overflow: hidden;
    position: absolute;
    width: 0;
    height: 0;
    line-height: 0;
    text-indent: -9999px;
  }
  .txt_brand{
  	-webkit-text-size-adjust: none;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    font-style: normal;
    font-weight: 400;
    display: block;
    overflow: hidden;
    line-height: 16px;
    text-overflow: ellipsis;
    white-space: nowrap;
    word-break: break-all;
    font-size: 13px;
    color: rgba(34,34,34,.6);
  }
  #productName{
    -webkit-text-size-adjust: none;
    font-size: 14px;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    display: block;
    overflow: hidden;
    line-height: 16px;
    text-overflow: ellipsis;
    white-space: nowrap;
    word-break: break-all;
    padding-top: 4px;
    font-weight: 400;
    color: #222;
  }
  .item_btn{
    -webkit-text-size-adjust: none;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    overflow-anchor: none;
    margin: 0;
    padding: 0;
    vertical-align: middle;
    border: 0 none;
    cursor: pointer;
    line-height: 1.5;
    color: #000;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    display: block;
    width: 100%;
    height: 50px;
    font-size: 0;
    background-color: #fafafa;
  }
  .btn_crad{
    -webkit-text-size-adjust: none;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    overflow-anchor: none;
    margin: 0;
    padding: 0;
    vertical-align: middle;
    border: 0 none;
    cursor: pointer;
    line-height: 1.5;
    color: #000;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    display: block;
    width: 100%;
    height: 50px;
    font-size: 0;
    background-color: #fafafa;
  }

 .txt_g{
     -webkit-text-size-adjust: none;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    cursor: pointer;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    display: inline-block;
    font-size: 14px;
    line-height: 16px;
    color: rgba(17,17,17,.5);
    vertical-align: top;
  }
  .btn_close{
    -webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    overflow-anchor: none;
    color: #000;
    text-decoration: none;
    right: 0;
    top: 0;
    z-index: 10;
    position: absolute;
    }
  .ico_close{
      -webkit-text-size-adjust: none;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    display: block;
    overflow: hidden;
    font-size: 1px;
    line-height: 0;
    background: url(https://gift-s.kakaocdn.net/dn/gift/images/m640/ico_gift2_220628.png) no-repeat;
    background-size: 250px 1200px;
    color: transparent;
    width: 16px;
    height: 16px;
    margin: 20px;
    background-position: -95px -760px;
  }
  
  div.aaa{
  	border: none;
  }
  th{
  	width: 60px;
  	vertical-align: middle;
  }
  .gift_window{
  	-webkit-text-size-adjust: none;

  .container mt-3{
  	width:33%;
  	height:400px;
  	justify-content: space-around;
  }
  
  
  ul.tab_receive{
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    z-index: 50001;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    overflow-y: auto;
    overscroll-behavior-y: contain;
    position: fixed;
    inset: 0px;
    background: rgba(0, 0, 0, 0.4);
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
  }
  
  .gift_card{
    -webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
  }
  .msgcardd_layer{
    -webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    margin: 0;
    z-index: 30020;
    background-color: #fffae2;
    overflow: hidden;
    position: relative;
    left: auto;
    right: auto;
    top: auto;
    bottom: auto;
    width: 500px;
    padding: 86px 0 88px;
    border-radius: 8px;
    padding-top: 42px;
  }
  .inner_layer{
  	-webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    margin: 0;
    padding: 0;
  }
  .layer_body{
    -webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    margin: 0;
    padding: 0;
    overflow-x: hidden;
    overflow-y: auto;
    position: static;
    left: auto;
    right: auto;
    top: auto;
    bottom: auto;
    max-height: 630px;
    box-sizing: border-box;
  }
  

</style>
<script type="text/javascript">
	/*
	var btn_cardNum = $('#msgbtn[name=i]');
	var msg_cardNum = $('.modal[name=i]'); 
	*/
	
	$(function() {

		$("document").ready(function(){
			order_send(); 
			$("#receivePresentbox").css("border-bottom","3px solid black");
		});	

		$('.link_tab').click(function() {
			$('.link_tab').css("border-bottom","");
			$(this).css("border-bottom","3px solid black");
		});
		
		$('#receivePresentbox').click(function(){
			
			order_send();
		});

		$('#sendPresentbox').click(function(){
			
			order_recevie();
		});
		
	 /* 	$(document).on("click","#msgbtn",function() {
		    <!-- 여러개의 버튼이 모두 클릭되어서 모두 호출된다 -->
		    $(".modal").modal({remote : 'layer.html'});
		    $(".modal").modal('show');
		    
		    <!-- (this)로 찍으면 배경만 나옴 -->
		    //$(this).modal('show');
		}); */
		
	 	/* 	
	 	$(document).on("click",btn_cardNum,function() {
		    <!-- 여러개의 버튼이 모두 클릭되어서 모두 호출된다 -->
		    $(msg_cardNum).modal({remote : 'layer.html'});
		    $(msg_cardNum).modal('show');
		});
		 */
		 
		 $(document).on("click",".btn_crad",function() {
			<!-- 여러개의 버튼이 모두 클릭되어서 모두 호출된다-->
			 $(".address").toggle();
		});
		
		$(document).on("click", ".ico_close",function(){
			 <!-- 여러개의 버튼이 모두 클릭되어서 모두 호출된다-->
			$(".address").hide();
			$(".modal").modal('hide');
	    });
		
	});	
	
	function showcard(i){
		alert(i);
		 $("#myModal"+i).modal({remote : 'layer.html'});
		    $("#myModal"+i).modal('show');
	}
	
	function order_recevie() {
	 	// 로그인 세션아이디num으로 변경
 		var num = 2;
// 		var num = ${sessionScope.loginname};
		var s="";

		$.ajax({
			type: "get",
			url: "../gift/receivelist",
			dataType: "json",
			data: {"num":num},
			success:function(res){
				
	 			$.each(res, function(i,elt) {
	 				s+= "<div class='container mt-3' style='width:33%; height:500px;'>"
 					s+=	"<div class='card'>"
 					s+=	"<img class='card-img-top' src="+elt.thumbnailImageUrl+" alt='Card image' style='width:100%; cursor:pointer;' onclick=\"location.href='../${root}product/detail?num="+elt.productNum+"'\">"
 					s+=	"<div class='card-body'>"
 					s+=	"<p class='card-title'>"+elt.brand+"</p>"
 					s+=	"<h5 class='card-text' style='text-overflow:ellipsis;overflow: hidden;white-space: nowrap;display: block;max-width: 1000px;cursor:pointer;' onclick=\"location.href='../${root}product/detail?num="+elt.productNum+"'\">"+elt.productName+"</h5>"
 					s+= "<h6 class='card-text' style=''><b>To.'"+elt.nickname+"'</b></h6>"
 					s+=	"<p style='color:gray; text-align: left; margin-top:10px'>"+elt.orderDate+"</p></div></div></div>"
				});
	 			
				$("div.Gift").html(s);
			}
		});
	}; 
	
	 	
	 	
	 	
	  	function order_send() {
	 		var num = 5;
//	 		var num = ${sessionScope.loginname};
			var s="";
				
			$.ajax({
				type: "get",
				url: "../gift/sendlist",
				dataType: "json",
				data: {"num":num},
				success:function(res){
					
		 			$.each(res, function(i,elt) {
		 				
		 				s+= "<div class='container mt-3' style='width:33%; height:500px;'>"
	 					s+=	"<div class='card'>"
	 					s+=	"<img class='card-img-top' src="+elt.thumbnailImageUrl+" alt='Card image' style='width:100%; cursor:pointer;' onclick=\"location.href='../${root}product/detail?num="+elt.productNum+"'\">"
	 					s+=	"<div class='card-body'>"
	 					s+=	"<p class='card-title'>"+elt.brand+"</p>"
	 					s+=	"<h5 class='card-text' style='text-overflow:ellipsis;overflow: hidden;white-space: nowrap;display: block;max-width: 1000px;cursor:pointer;' onclick=\"location.href='../${root}product/detail?num="+elt.productNum+"'\">"+elt.productName+"</h5>"
	 					s+= "<h6 class='card-text'><b>from."+elt.nickname+"</b></h6>"
	 					s+=	"<button class='button' id='msgbtn' style='margin-left:10px' onclick='"+i+"'>메시지 카드 보기</button>"
	 					//s+=	"<button class='button' id='msgbtn' style='margin-left:10px' name='"+i+"'>메시지 카드 보기</button>"
	 					s+=	"<p style='color:gray; text-align: left; margin-top:10px'>"+elt.orderDate+"</p></div></div></div>"
	 					
	 					/* 하나 누를때마다 하나의 정보를 들고오는 ajax 처리 */
	 					
	 					<!-- 팝업영역 -->
	 					s+=	"<div class='modal' id='myModal'>"
	 					//s+=	"<div class='modal' id='myModal' name='"+i+"'>"
	 					s+=	"<div class='modal-dialog'>"
	 					s+=	"<div class='modal-content'>"
	 					s+=	"<div class='gift_window'>"
	 					s+=	"<div class='gift_card'>"
	 					s+=	"<div class='msgcardd_layer no_title'>"
	 					s+=	"<div class='inner_layer'>"
	 					s+=	"<div class='layer_body'>"
							
	 					s+=	"<div class='wrap_msgprofile'>"
	 					s+=	"<div class='box_profile'>"
	 					s+=	"<div class='thumb_profile'>"
	 					s+=	"<img width='36' height='36' class='img_g'src='"+elt.profileImage+"'>"
	 					s+=	"<img width='42' height='42' class='frame_squircle' src='/jogong/resources/image/frame_msgsquircle.png'>"
	 					s+=	"</div></div>"
	 					s+=	"<strong class='tit_g'> <span id='nickname' class='txt_name'>"+elt.nickname+"</span> 님이 보낸 메시지</strong></div>"
		 												
	 					s+=	"<div class='wrap_msgcard'>"
	 					s+=	"<div class='card_g custom_mask_frame'>"
	 					s+=	"<div class='thumb_media custom_background_image'>"
	 					s+=	"<a href='#none' class='link_media'><img alt='메시지카드' class='img_g' src='"+elt.banner+"'></a>"
	 					s+=	"</div>"
	 					s+=	"<p class='txt_letter'>"+elt.message+"</p>"
	 					//s+=	"<a href='#none' class='link_prd'>"
	 					s+=	"<span class='info_prd'>"
	 					s+=	"<span class='thumb_prd'><img class='img_g' src='"+elt.thumbnailImageUrl+"' alt='여기에 상품이미지'></span>" 
	 					s+=	"<span id='productWrapper' class='txt_prd'>" 
	 					s+=	"<span class='screen_out'>"+elt.brand+"</span> "
	 					s+=	"<em id='brandName' class='txt_brand'>"+elt.brand+"</em> <span class='screen_out'>"+elt.productName+"</span>"
	 					s+=	"<strong id='productName' class='txt_name'>"+elt.productName+"</strong>"
						s+=	"</span></span>"
						//s+=	"</a>"
							
						s+=	"<div class='tbl_btn'>"
						s+=	"<div class='item_btn'>"
						s+=	"<button type='button' class='btn_crad'>"
						s+=	"<span class='ico_gift2 ico_delete'></span>" 
						s+=	"<span class='txt_g'>주소 입력 및 수정</span>"
						s+=	"</button></div></div></div></div></div>"
		 											
						s+=	"<a href='#none' class='btn_close'>"
						s+=	"<span class='ico_gift2 ico_close'>닫기</span>"
						s+=	"</a></div>"
		 										
						s+=	"<form action=''>"
						s+=	"<table style='width: 70%; display: none; margin: 10px auto;' class='table table-bordered address'>"
						//s+=	"<tr><th style='text-align: center'> 이름 </th>"
						//s+=	"<td><input type='text' style='width: 100%;' required name='companyName' id='to_name' value='11받는사람이름'></td></tr>"
							
						s+=	"<tr><th style='text-align: center'> 연락처 </th>"
						s+=	"<td><input type='text' style='width: 100%;' required id='to_hp' value='"+elt.hp+"'></td></tr>"					
		 												
						s+=	"<tr><th style='text-align: center'> 주소 </th><td>"								
						s+=	"<div style='width: 100%; border: none;' class='input-group'>" 						
						s+=	"<input type='text' id='sample4_postcode' placeholder='우편번호' style='width: 60%; border:1px solid black; margin-bottom: 5px;' required value='"+elt.postalcode+"'>"
						s+=	"<input type='button' onclick='sample4_execDaumPostcode()' class='btn btn-dark btn-sm' value='우편번호' style='margin-bottom: 5px; float: right;'><br>"
						s+=	"</div>"
						s+=	"<input type='text' id='sample4_roadAddress' placeholder='도로명주소' size='60' value='"+elt.deliveryAddress+"' style='width: 100%; margin-bottom: 5px;' required name='address1'><br>"						
						s+=	"<input type='hidden' id='sample4_jibunAddress' placeholder='지번주소'  size='60'>"							
						s+=	"<span id='guide' style='color:#999; display:none'></span>"								
						s+=	"<input type='text' id='sample4_detailAddress' placeholder='상세주소'  size='60' value='11공란' style='width: 100%;'required name='address2'><br>"							
						s+=	"<input type='hidden' id='sample4_extraAddress' placeholder='참고항목'  size='60'>	<input type='hidden' id='sample4_engAddress' placeholder='영문주소'  size='60' >"							
						s+=	"</td></tr>"						
						s+=	"<tr style='border-bottom: none;'>"								
						s+=	"<td colspan='2' style='text-align: center; border: none;'>"								
						s+=	"<button type='submit' class='btn btn-success'>저장</button>"							
						s+=	"</td></tr></table></form></div></div></div></div></div></div>"					
					});
					$("div.Gift").html(s);
				}
			});
		}
</script>
<body>
<div class="gift-wrapper">
	<div class="gift-menu">
		<ul role="tablist" class="tab_receive">
			<li class="presentation"><a class="link_tab" id="receivePresentbox">받은선물함</a></li>
			<li class="presentation" style="margin-left:10px"><a class="link_tab" id="sendPresentbox"> 보낸선물함 </a></li>
		</ul>
	</div>
	<div class="Gift"></div>
</div>
</body>
<script type="text/javascript">
//다음 주소검색 API
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
new daum.Postcode({
    oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var roadAddr = data.roadAddress; // 도로명 주소 변수
        var extraRoadAddr = ''; // 참고 항목 변수

        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
            extraRoadAddr += data.bname;
        }
        // 건물명이 있고, 공동주택일 경우 추가한다.
        if(data.buildingName !== '' && data.apartment === 'Y'){
           extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        if(extraRoadAddr !== ''){
            extraRoadAddr = ' (' + extraRoadAddr + ')';
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('sample4_postcode').value = data.zonecode;
        document.getElementById("sample4_roadAddress").value = roadAddr;
        document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
 
        document.getElementById("sample4_engAddress").value = data.addressEnglish;
               
        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
        if(roadAddr !== ''){
            document.getElementById("sample4_extraAddress").value = extraRoadAddr;
        } else {
            document.getElementById("sample4_extraAddress").value = '';
        }

        var guideTextBox = document.getElementById("guide");
        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
        if(data.autoRoadAddress) {
            var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
            guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
            guideTextBox.style.display = 'block';

        } else if(data.autoJibunAddress) {
            var expJibunAddr = data.autoJibunAddress;
            guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
            guideTextBox.style.display = 'block';
        } else {
            guideTextBox.innerHTML = '';
            guideTextBox.style.display = 'none';
        }
    }
}).open();
}
</script>
</html>