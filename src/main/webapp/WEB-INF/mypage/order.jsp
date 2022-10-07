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
div.card{
   margin-left:30px
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

.pop-layer .pop-container {
  padding: 20px 25px;
} 

/* .pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
} */

/* .pop-layer .btn-r {
  width: 100%;
  margin: 10px 0 20px;
  padding-top: 10px;
  border-top: 1px solid #DDD;
  text-align: right;
} */

.pop-layer {
  display: none;
  position: absolute;
  top: 35%;
  left: 45%;
  width: 410px;
  height: auto;
  background-color: #fff;
  /* border: 5px solid #3571B5; */
  z-index: 10;
} 

.dim-layer {
  display: none;
  position: fixed;
  _position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 100;
}

.dim-layer .dimBg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #000;
  opacity: .5;
  filter: alpha(opacity=50);
}

.dim-layer .pop-layer {
  display: block;
} 

/* a.btn-layerClose {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #3f5a9d;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
} */

a.btn-layerClose:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
  }
  
  .pop-container{
    -webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    font-family: 
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
  .pop-conts{
    -webkit-text-size-adjust: none;
    font-size: 14px;
    line-height: 1.5;
    color: #000;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740  \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    margin: 0;
    padding: 0;
  }
 . layer_body{
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
  .link_prd{
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
  }
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
/*   .ico_delete {
    -webkit-text-size-adjust: none;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    cursor: pointer;
    font-family: -apple-system,Apple SD Gothic Neo,\b9d1\c740 \ace0\b515,Malgun Gothic,sans-serif,ArialUnicodeMs;
    overflow: hidden;
    font-size: 1px;
    line-height: 0;
    background-size: 250px 1200px;
    display: inline-block;
    margin-right: 7px;
    vertical-align: top;
    background-position: -230px -955px;
	}
 */  
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

</style>
<script type="text/javascript">
	$(function() {
		
		let num = 2; 
		$.ajax({
			type: "get",
			url: "../gift/receivelist",
			dataType: "json",
			data: {"num":num},
		    success : function(res){
		    	$.each(res, function(i,elt) {
		    		console.log(elt.productName);
		    		console.log(elt.deliveryAddress);
		    		
		    		console.log(elt.thumbnailImageUrl);
		    		console.log(elt.brand);
		    		console.log(elt.nickname);
		    		console.log(elt.message);
		    		console.log(elt.orderDate);
		    		console.log(elt.profileImage);
		    		console.log(elt.banner);
		    		console.log(elt.hp);
		    		console.log(elt.postalcode);
		    		
		    	})
		    },
		    error : function(){
		      alert("에러")		
		    }
		  });
		
		
		
		
		//오더리시브호출
 		/* order_recevie(); */
 		order_send(); 
		
 		$(document).on("click",".btn-example",function(){
 			var $href = $(this).attr('href');
	        layer_popup($href);
 		});
 		
		/* $('.btn-example').click(function(){
	        var $href = $(this).attr('href');
	        layer_popup($href);
	    }); */
	    function layer_popup(el){

	        var $el = $(el);    //레이어의 id를 $el 변수에 저장
	        var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수

	        isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

	        var $elWidth = ~~($el.outerWidth()),
	            $elHeight = ~~($el.outerHeight()),
	            docWidth = $(document).width(),
	            docHeight = $(document).height();

	        // 화면의 중앙에 레이어를 띄운다.
	        if ($elHeight < docHeight || $elWidth < docWidth) {
	            $el.css({
	                marginTop: -$elHeight /2,
	                marginLeft: -$elWidth/2
	            })
	        } else {
	            $el.css({top: 0, left: 0});
	        }

	        $el.find('a.btn_close').click(function(){
	            isDim ? $('.dim-layer').hide() : $el.hide(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
	            $(".address").hide();
	            return false;
	        });

	        $('.layer .dimBg').click(function(){
	            $('.dim-layer').fadeOut();
	            return false;
	        });
	    }
	    
	 /*    $(".btn_crad").click(function(){
	    	console.log(111)
	 		  $(".address").show();
	 	}); 
	 	$(".btn_crad").click(function(){
	 		  $(".address").toggle();
	 	}); */
	 	$(document).on("click",".btn_crad",function(){
	 		$(".address").toggle();
 		});
	 	
	 	
/* 	 	function order_recevie() {
	 		var num = 2;
			var s="";
				
			$.ajax({
				type: "get",
				url: "../gift/receivelist",
				dataType: "json",
				data: {"num":num},
				success:function(res){
					
		 			$.each(res, function(i,elt) {
		 				
		 				s+= "<div class='container mt-3' style='display: flex; flex-direction: row; height:900px; justify-content: center; flex-wrap:wrap;'>"
	 					s+=	"<div class='card' style='width:300px; height:200px;'>"
	 					s+=	"<img class='card-img-top' src="+elt.thumbnailImageUrl+" alt='Card image' style='width:100%'>"
	 					s+=	"<div class='card-body'>"
	 					s+=	"<p class='card-title'>"+elt.brand+"</p>"
	 					s+=	"<h5 class='card-text'>"+elt.productName+"</h5>"
	 					s+= "<h6 class='card-text' style='float:left;'><b>from.'"+elt.nickname+"'</b></h6>"
	 					s+=	"<p style='color:gray; text-align: left; margin-top:10px'>"+elt.orderDate+"</p></div></div></div>"
					});
		 			
					$("div.Gift").html(s);
				}
			});
		}
	}); */
	 	
	 	
	 	
	 	function order_send() {
	 		var num = 5;
			var s="";
				
			$.ajax({
				type: "get",
				url: "../gift/sendlist",
				dataType: "json",
				data: {"num":num},
				success:function(res){
					
		 			$.each(res, function(i,elt) {
		 				
		 				s+= "<div class='container mt-3' style='display: flex; flex-direction: row; height:900px; justify-content: center; flex-wrap:wrap;'>"
	 					s+=	"<div class='card' style='width:300px; height:200px;'>"
	 					s+=	"<img class='card-img-top' src="+elt.thumbnailImageUrl+" alt='Card image' style='width:100%'>"
	 					s+=	"<div class='card-body'>"
	 					s+=	"<p class='card-title'>"+elt.brand+"</p>"
	 					s+=	"<h5 class='card-text'>"+elt.productName+"</h5>"
	 					s+= "<h6 class='card-text' style='float:left;'><b>from.'"+elt.nickname+"'</b></h6>"
	 					s+=	"<a href='#layer2' class='btn-example'>" 
	 					s+=	"<button class='button' style='margin-left:10px'>메시지 카드 보기</button></a>"
	 					s+=	"<p style='color:gray; text-align: left; margin-top:10px'>"+elt.orderDate+"</p></div></div></div>"
	 					
	 				 	<!-- 팝업 영역 -->
	 					s+= "<div class='dim-layer'> <div class='dimBg'></div> <div id='layer2' class='pop-layer'> <div class='pop-container'>"
	 					s+= "<div class='pop-conts'> <div class='layer_body'> <div class='wrap_msgprofile'> <div class='box_profile'> <div class='thumb_profile'>"
			            s+= "<img width='36' height='36' class='img_g' src='"+elt.profileImage+"'>"
			            s+= "<img width='42' height='42' class='frame_squircle' src='/jogong/resources/image/frame_msgsquircle.png'>"
			            s+= "</div> </div>" 
			            s+= "<strong class='tit_g'> <span id='nickname' class='txt_name'>"+elt.nickname+"</span>님이 보낸 메시지 </strong> </div>"
			            s+= "<div class='wrap_msgcard'> <div class='card_g custom_mask_frame'> <div class='thumb_media custom_background_image'>"
			            s+=	"<a href='#none' class='link_media'> <img alt='배너' class='img_g' src='"+elt.banner+"'></a></div>"			
			            s+=	"<p class='txt_letter'>"+elt.message+"</p> <a href='#none' class='link_prd'> <span class='info_prd'> <span class='thumb_prd'>"	
			            s+=	"<img class='img_g' src='"+elt.thumbnailImageUrl+"' alt='여기에 상품이미지'> </span>"		
			            s+=	"<span id='productWrapper' class='txt_prd'> <span class='screen_out'>"+elt.brand+"</span> <em id='brandName' class='txt_brand'>"+elt.brand+"</em>"
		 				s+=	"<span class='screen_out'>"+elt.productName+"</span> <strong id='productName' class='txt_name'>"+elt.productName+"</strong> </span> </span> </a>"
		 			 	s+=	"<div class='tbl_btn'> <div class='item_btn'> <button type='button' class='btn_crad'> <span class='ico_gift2 ico_delete'></span>"
		 				s+=	"<span class='txt_g'>주소 입력</span> </button> </div> </div> </div> </div>"
		 												
		 				<!-- 배송지 입력 폼 -->					               	
		 				s+= "<form action=''>"
		 				s+=	"<table style='width: 70%; display: none; margin: 10px auto;' class='table table-bordered address'>"
		 				
		 				s+=	"<tr> <th style='text-align: center'> 연락처 </th>" 
		 				s+=	"<td> <input type='text' style='width: 100%;' required id='to_hp' value='"+elt.hp+"'> </td> </td>"
		 					
		 				s+=	"<tr> <th style='text-align: center'> 주소 </th> <td>" 
		 				s+=	"<div style='width: 100%; border: none;' class='input-group'>" 
		 				s+=	"<input type='text' id='sample4_postcode' placeholder='우편번호' style='width: 60%; border:1px solid black; margin-bottom: 5px;' required value='"+elt.postalcode+"'>"		
		 				s+=	"<input type='button' onclick='sample4_execDaumPostcode()' class='btn btn-dark btn-sm' value='우편번호' style='margin-bottom: 5px; float: right;'><br></div>"
		 				s+=	"<input type='text' id='sample4_roadAddress' placeholder='도로명주소' size='60' value='"+elt.deliveryAddress+"' style='width: 100%; margin-bottom: 5px;' required name='address1'><br>"
		 				s+=	"<input type='hidden' id='sample4_jibunAddress' placeholder='지번주소' size='60'>"
		 				s+=	"<span id='guide' style='color:#999; display:none'></span>"
		 				s+=	"<input type='text' id='sample4_detailAddress' placeholder='상세주소'  size='60' value='' style='width: 100%;'required name='address2'><br>"
		 				s+=	"<input type='hidden' id='sample4_extraAddress' placeholder='참고항목'  size='60'> <input type='hidden' id='sample4_engAddress' placeholder='영문주소'  size='60' ></td></tr>"
		 				s+=	"<tr style='border-bottom: none;'> <td colspan='2' style='text-align: center; border: none;'>"
		 				s+=	"<button type='submit' class='btn btn-success'>저장</button>"						
		 				s+=	"</td></tr></table></form></div>"
							
		 				s+= "<a href='#none' class='btn_close'><span class='ico_gift2 ico_close'>닫기</span></a>"
		 				s+= "</div></div></div></div>"
					});
		 			
					$("div.Gift").html(s);
				}
			});
		}
	}); 

</script>
<body>
<div class="Gift"></div>
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