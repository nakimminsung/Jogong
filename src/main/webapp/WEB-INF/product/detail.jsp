<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>상세페이지</title>
<!-- font -->
<link
  href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
  rel="stylesheet"
/>

<!-- bootstrap 5 -->
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
/>

<!-- bootstrap js -->
<script
  src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
  integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
  crossorigin="anonymous"
></script>
<script
  src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
  integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
  crossorigin="anonymous"
></script>
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
  integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
  crossorigin="anonymous"
></script>

<!-- bootstrap 5 icon -->
<script
  src="https://kit.fontawesome.com/a076d05399.js"
  crossorigin="anonymous"
></script>

<!-- bootstrap css -->

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<!-- fontawesome -->
<script
  src="https://kit.fontawesome.com/f7b2a5e0aa.js"
  crossorigin="anonymous"
></script>

<!-- alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
   @font-face {
     font-family: "SeoulNamsanM";
     src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulNamsanM.woff")
       format("woff");
     font-weight: normal;
     font-style: normal;
   }

   body * {
     font-size: 15px;
     font-family: "SeoulNamsanM";
     word-spacing: -1px;
   }

   .detailContainer {
     display: grid;
     grid-template-columns: 3fr 4fr 2fr;
     max-width: 1180px;
     margin: 0 auto;
   }

   .detailItem:nth-child(1) {
     grid-column: 1/2;
   }

   .detailItem:nth-child(2) {
     grid-column: 2/3;
   }

   .detailItem:nth-child(3) {
     grid-column: 3/4;
   }

   .detailItem:nth-child(4) {
     grid-column: 1/3;
   }

   .detailDescription {
     margin-top: 30px;
     /* border-right: 1px solid #C8D2D1; */
   }

   .detailRight {
     position: sticky;
     top: 100px;
     height: 100%;
   }

   .detailContent {
     margin-left: 40px;
     /* border-right: 1px solid #C8D2D1; */
   }

   ._delivery {
     display: inline;
   }

   .detailRight {
     margin-left: 30px;
     margin-top: 30px;
   }

   .detailCount {
     margin-left: 160px;
   }

   .totalcost {
     margin-left: 110px;
   }

   .detailCart {
     border-style: solid;
     width: 300px;
     height: 49px;
     padding-top: 2px;
     border: 1px solid #ddd;
     font-size: 13px;
     line-height: 45px;
     color: #222;
     background-color: white;
     margin-top: 100px;
   }

   .detailInsert {
     margin-top: 10px;
   }

   .btn_g {
     width: 50px;
     padding: 11px 0 11px;
     background-color: #444;
     color: #f5f5f5;
     border-radius: 5px;
   }

   .detailGift {
     width: 120px;
     padding: 13px 0 13px;
     background-color: #cff0cc;
     border-radius: 5px;
     border-color: #cff0cc;
   }

   .detailSelfGift {
     width: 120px;
     padding: 13px 0 13px;
     background-color: #111;
     color: #f5f5f5;
     border-radius: 5px;
   }
   img#gift-friend {
     width: 130px;
     border-radius: 50px;
     border: 3px solid white;
     cursor: pointer;
   }
   img.gift-friend-img {
     width: 50px;
     border-radius: 20px;
     border: 2px solid white;
   }
   #orderDetailModal.gift-modal-overlay {
     width: 100%;
     height: 100%;
     position: absolute;
     left: 0;
     top: 0;
     display: flex;
     flex-direction: column;
     align-items: center;
     justify-content: center;
     background: rgba(50, 50, 50, 0.25);
     box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
     backdrop-filter: blur(1.5px);
     -webkit-backdrop-filter: blur(1.5px);
     border-radius: 10px;
     border: 1px solid rgba(255, 255, 255, 0.18);
     display: none;
     z-index: 999;
   }
   #orderDetailModal .gift-modal-window {
     background: #fff;
     box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
     backdrop-filter: blur( 13.5px );
     -webkit-backdrop-filter: blur( 13.5px );
     border-radius: 10px;
     border: 1px solid rgba( 255, 255, 255, 0.18 );
     width: 400px;
     height: 600px;
     position: relative;
     top: 0px;
     padding: 20px;
   }
   #orderDetailModal .gift-close-area {
     cursor: pointer;
     color: gray;
     font-weight: 400px;
     font-size: 20px;
     z-index: 999;
   }
   .modal-fix {
     position: fixed;
     width: 100%;
     height: 100%;
     overflow: scroll;
   }
   div.gift-title {
     display: flex;
     justify-content: space-between;
   }
   div.gift-modal-button {
     width: 90%;
     display: flex;
     justify-content: center;
     align-items: center;
     position: fixed;
     bottom: 10px;
   }
   div.gift-modal-button > button {
     width: 100%;
   }
   div.gift-modal-button > div {
     width: 30px;
   }
   div.gift-modal-select-flex {
     display: flex;
     align-items: center;
   }
   div.gift-modal-select-object {
     display: flex;
     align-items: center;
   }
   div.gift-modal-select > input {
     margin-right: 5px;
   }
   div.gift-modal-select > img {
     margin-left: 0;
     margin-right: 5px;
   }
   div.gift-modal-search {
     margin-top: 0px;
     margin-bottom: -10px;
   }
   div.gift-modal-search input {
	  position:relative;
	  top:10px;
	  width: 100%;
	  height: 40px;
   }
   div.gift-modal-search img {
     width: 30px;
     position: relative;
   	 top: -26px;
     left: 325px;
     cursor: pointer;
   }
   div.gift-friend-list {
     height: 300px;
     margin-top: 20px;
   }
   div.friend-result {
     overflow: auto;
     height: 290px;
   }
   div.friend-result input{
     position: relative;
     top: 5px;
   }
   div.friend-result b{
    	position: relative;
    }
   div.friend-select-list {
     height: 80px;
     display: flex;
     align-items: center;
   }
   div.gift-left {
     display: flex;
     align-items: center;
   }
   div.detail-modal-body {
     overflow: auto;
     height: 230px;
   }

	button.getWishlist{
		background-color: #cff0cc;
	}




   .detailDescButton > ul > li {
     cursor: pointer;
   }

   ul.tab_receive {
     font-size: 14px;
     line-height: 1.5;
     color: #000;
     list-style: none;
     overflow: hidden;
     margin: 30px 0 40px;
     padding-bottom: 10px;
     border-bottom: 1px solid #ededed;
   }

   li.presentation {
     font-size: 14px;
     line-height: 1.5;
     color: #000;
     margin: 0;
     padding: 0;
     list-style: none;
     float: left;
   }

   a.link_tab {
     line-height: 1.5;
     list-style: none;
     overflow-anchor: none;
     text-decoration: none;
     display: block;
     padding: 0 2px 2px;
     color: #000;
     opacity: 1;
     font-size: 15px;
   }

   a.link_tab:hover {
     color: #000;
     font-weight: 600;
   }

   a.link_tab:active {
     color: #000;
     font-weight: 600;
   }

   #detailProDesc {
     width: 130px;
     text-align: center;
   }

   #detailReview {
     width: 130px;
     text-align: center;
   }

   .detailLine {
     background-color: #c8d2d1;
   }

   .reviewContentBtn {
     margin-left: 700px;
   }

   .latestProduct {
     margin-right: 30px;
   }

    .reviewUserImg {
     width: 50px;
     height: 50px;
     border-radius: 80%;
     overflow: hidden;
   } 

   .reviewUserImg > img {
     width: 100%;
     height: 100%;
     object-fit: cover;
   }
   
   div.reviewTag{
   	width:55px;
   	height: 25px; 
   	border-radius: 10px; 
   	display: flex; 
   	justify-content: center; 
   	align-items: center;
   	margin-top: 20px;
   }
  
ul,
li {
  list-style-type: none;
  padding-left: 0;
  margin-left: 0;
}

button {
  font-family: "Spoqa Han Sans Neo", "sans-serif";
  font-size: 15px;
  line-height: 1;
  letter-spacing: -0.02em;
  color: #3f4150;
  background-color: #fff;
  border: none;
  cursor: pointer;
}

button:focus,
button:active {
  outline: none;
  box-shadow: none;
}

.title {
  width: 200px;
  margin-bottom: 16px;
}

.title img {
  width: 100%;
  height: auto;
}

form {
  padding: 40px;
  background-color: #fff;
  border-radius: 6px;
}

form h1 {
  margin-bottom: 8px;
  font-size: 16px;
  font-weight: 500;
  letter-spacing: -0.02em;
  color: #3f4150;
}

.dropdown {
  position: relative;
  z-index: 1;
  width: 300px;
  margin-bottom: 8px;
}

.dropdown-toggle {
  width: 100%;
  height: 50px;
  padding: 0 16px;
  line-height: 50px;
  color: rgba(133, 136, 150, 0.5);
  text-align: left;
  border: 1px solid rgba(224, 226, 231, 0.75);
  border-radius: 6px;
  transition: border-color 100ms ease-in;
}

.dropdown-toggle.selected {
  color: #3f4150;
  border-color: rgba(224, 226, 231, 1);
}

.dropdown-toggle:active {
  border-color: rgba(224, 226, 231, 1);
}

.dropdown-menu {
  position: absolute;
  z-index: 2;
  top: calc(100% + 4px);
  left: 0;
  width: 100%;
  max-height: 0;
/*   overflow: hidden; */
    overflow:auto;
  background-color: #fff;
  border: 1px solid transparent;
  border-radius: 6px;
  display:none;
  transition: border-color 200ms ease-in, padding 200ms ease-in,
    max-height 200ms ease-in, box-shadow 200ms ease-in;
}

.dropdown-menu.show {
  padding: 8px 0;
  max-height: 280px;
  border-color: rgba(224, 226, 231, 0.5);
  box-shadow: 0 4px 9px 0 rgba(63, 65, 80, 0.1);
  display: block;
}

.dropdown-option {
  width: 100%;
  height: 44px;
  padding: 0 16px;
  line-height: 44px;
  text-align: left;
}

.dropdown-option:hover {
  background-color: #f8f9fa;
}

.next-button {
  display: block;
  width: 100%;
  height: 44px;
  padding: 0 16px;
  line-height: 44px;
  color: #f8f9fa;
  background-color: #1b1c32;
  border-radius: 6px;
  transition: background-color 150ms ease-in;
}

.next-button:disabled {
  background-color: #e0e2e7;
  cursor: not-allowed;
}
</style>
<script type="text/javascript">
  $(function(){
	var productNum = $('input[name=productNum]').val();
	getAllOption(productNum);
	
	borderBottom();
	getReviewCount();
	
	var dropdownBtn = document.querySelector(".dropdown-toggle");
	/* dropdownBtn.addEventListener("click", function () {
		getAllOption(productNum);
	}); */

	let data = {userNum:$("input[name=userNum]").attr("value"),search:""};
	list(data);

  	var price = $(".proPrice").val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
  	$('._price').text(price+"원");
  	$('.totalcost').text(price+"원");

  	var deliveryOption = $(".delivery").val();
  	if(deliveryOption){
  		$('._delivery').text(" 배송비 미포함");
  	}else{
  		$('._delivery').text(" 배송비포함");
  	}

  	// 수량버튼
  	var _price = $(".proPrice").val();
  	var plus = document.querySelector(".detailPlus");
  	var minus = document.querySelector(".detailMinus");
  	var result = document.querySelector("#detailResult");
  	var count =1;

  	const modal = document.getElementById("orderDetailModal")
      const btnModal = document.getElementById("btn_orderDetail")

  	plus.addEventListener("click", ()=>{
  		count++;
  		result.textContent = count;
  		var totalcostNum = count * _price;
  		var totalcost = totalcostNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
  		$('.totalcost').text(totalcost+"원");

  		$('input[name=qty]').attr('value', result.textContent);
  	});

  	minus.addEventListener("click",()=>{
  		if(count>1){
  			count--;
  			result.textContent = count;
  			var totalcostNum = count * _price;
  			var totalcost = totalcostNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
  			$('.totalcost').text(totalcost+"원");

  			$('input[name=qty]').attr('value', result.textContent);

  		}else{
  			totalcost.textContent = 0 +"원";
  			$('input[name=qty]').attr('value', result.textContent);
  		}
  	});

  	// 위시리스트 - 하트
  	//하트 클릭시 빨강하트/빈하트 번갈아 나오게 하기
  	$("span.likes").click(function(){

  		var heart=$(this).find("i").attr("class");
  		if(heart=='far fa-heart'){
  			$(this).find("i").attr("class","fas fa-heart").css("color","red");
  		}else{
  			$(this).find("i").attr("class","far fa-heart").css("color","#f5f5f5");
  		}
  	});

	 // 별점
	var rating = $('.review .rating');
	rating.each(function(){
		var targetScore = $(this).attr('data-rate');
		$(this).find('.fa-star:nth-child(-n'+targetScore+')').css({color:'#F7C815'});
	});
		
  	// 선물상자 담기
  	$("#btn_detailCart").click(function(){
  		var data = $("#insertDetail").serialize();
  		var s ="";
  		$.ajax({
  			type:"post",
  			url:"../cart/insert",
  			dataType:"text",
  			data:data,
  			success:function(res){

  			},
  		});
  	});

  	$(".detailWishlist").click(function(){
  		var data = $("#insertDetail").serialize();
  		 var s ="";
  		$.ajax({
  			type:"post",
  			url:"../wishlist/insert",
  			dataType:"text",
  			data:data,
  			success:function(res){
  				alert("위시리스트에 상품이 담겼어요");
  			},
  		});
  	});

  	$("#btn_orderDetailInsert").click(function(){
  		var data = $("#insertDetail").serialize();
  		/* alert(data); */
  		$.ajax({
  			type:"post",
  			url:"../orderDetail/insert",
  			dataType:"json",
  			data:data,
  			success:function(res){
  				modal.style.display = "none"
  				window.location.href="../payview?num="+res.num;
  			},
  		});
  	});

  	$("#btn_orderDetail").click(function(){
  		
  		if(${empty sessionScope.loginUserNum}) {
			if(!confirm("로그인이 필요한 메뉴입니다.\n로그인하시겠습니까?")){
	
			} else {
				location.href="${root}/loginForm";
			}
			return
		} else {
			//  로그인 상태일 때 친구목록 불러오기
			btnModal.addEventListener("click", e => {
	    		modal.style.display = "flex"
			});
		}
  	});
  	
   /*    btnModal.addEventListener("click", e => {
  	    modal.style.display = "flex"
  	}) */
  	const closeBtn = modal.querySelector(".gift-close-area");
 	// 모달 x버튼 클릭시 닫기
	closeBtn.addEventListener("click", e => {
	    modal.style.display = "none"
        $("body").attr("class","");
	    $("input[name=friend-search]").val();
	});
	
	// 모달 외부 클릭시 닫기
	modal.addEventListener("click", e => {
	    const evTarget = e.target
		    if(evTarget.classList.contains("gift-modal-overlay")) {
		        modal.style.display = "none"
        		$("body").attr("class","");
			    $("input[name=friend-search]").val();
		    }
	});

	// 모달 실행시 오버레이 실행
	$("#gift-friend").click(function(){
		$("body").attr("class","modal-fix");
	});
        
	// 모달 취소버튼 클릭시 닫기
	$(document).on("click",".btn-cancel",function(){
	    modal.style.display = "none"
	    $("body").attr("class","");
		$("input#friend-search").val("");
	});
	
	// 친구 검색
	$("#friend-search").on('keyup keypress',function(){
		let data = {userNum:$("input[name=userNum]").attr("value"),search:$(this).val().trim()};
		list(data);
	});
		
  	window.addEventListener("keyup", e => {
  		if(modal.style.display === "flex" && e.key === "Escape") {
      		modal.style.display = "none"
      		$("body").attr("class","");
  		}
  	})

  	$("#btn_orderDetail").click(function(){
  		$("body").attr("class","modal-fix");
  	});

     $(document).on("click",".btn-cancel",function(){
	    modal.style.display = "none"
	    $("body").attr("class","");
	});

      // 상세설명, 리뷰
      $("document").ready(function(){
      	getDetailProDesc();
  	});

      $("#detailProDesc").click(function(){
      	getDetailProDesc();
      });

      // review content
      $("#detailReview").click(function(){
      	var s = "";
      	var productNum = $('input[name=productNum]').val();
      	console.log(productNum);
      	$.ajax({
  			type:"get",
  			url:"../review/productReview",
  			data:{"productNum":productNum},
  			dataType:"json",
  			success:function(res){
  				getReviewCount2();
  				//console.log(res);
  				s+="<h3 class='reviewContent' style='font-weight:600;'></h3>";
  				s+="<div class='reviewContentBtn'>";
  					s+="<span class='latestProduct'>최신순</span><span class='popProduct'>별점순</span>";
  				s+="</div>";
  				s += "<hr class='detailLine'>";
  				$.each(res,function(i,e){

  					s+="<div class='reviewUser' >";
  						s+="<div class='reviewUserImg' style='float:left;'>";
  							s+="<img src='"+e.profileImage+"' width='30' style='margin:0px;'>";
  						s+="</div>";

  						s+="<div class='review' style='float:left;'>";
  							for(var i=0; i<e.rating; i++)
  							{
  								s+="<i class='fas fa-star' style='color:#F7C815'></i>";
  							}
  						s+="</div>";
  					s+="</div>";
  					s+="<br>";
  					s+="<p>"+e.nickname+"</p>";
  					s+="<span >"+e.content+"</span>";
  					s+="<div class='reviewTag' style='background-color:"+e.tagBColor+"'>";
   					s+="<span>#"+e.tagName+"</span>";
   				s+="</div>";
   				s+="<p style='float:right; color:gray; margin-right:35px; position:relative; top:-20px;'>"+e.createdAt+"</p>";
  					
  					s+= "<hr class='detailLine'>";
  				});
  				$(".detailDescContent").html(s);
  			}
      	});
      });

  	$('a.link_tab').click(function() {
  		$('a.link_tab').css("border-bottom","");
  		$(this).css("border-bottom","3px solid black");
  	});

 	 //옵션
	var dropdownForm = document.querySelector(".drowpdown");
	var dropdownBtn = document.querySelector(".dropdown-toggle");
	
	var menuList = document.querySelector(".dropdown-menu");
	var itemList = document.querySelector(".dropdown-item");

	dropdownBtn.addEventListener("click", function () {
		  menuList.classList.toggle("show");
	});
	
	menuList.addEventListener("click",function(){
		menuList.classList.toggle("hidden");
	});
	
	// 모달 창에서 친구 선택시 모달 상단 친구 출력
	var fl = 0;
	$(document).on("click",".chkBox",function(){
		
		var ba = new Array();
		var fs = "";	
		
		fl = $(".chkBox:checked").length;
	
	    $(".chkBox:checked").each(function() {
	    	var map = new Map();
	    	map.set("b",$(this).siblings().find("b").text()); 
	    	map.set("img",$(this).siblings().find("img").attr("src")); 
	    	map.set("num",$(this).siblings().find("b").attr("num")); 		    	 		    	 	    	 		    	 
	    	ba.push(map);
	    });			
		
		if(fl != 0){
			fs += "<ul class='wish' style='padding-left:0;'>";
			
			$.each(ba, function(i,elt) {
				fs += "<li style='list-style:none; float:left;' class='wish' num='"+elt.get("num")+"' name='"+elt.get("b")+"'>";
				fs += "<img src='"+elt.get("img")+"' width='50' style='margin-top:10px;' class='gift-friend-img wish'>";
				fs += "<div style='text-align:center;'>"+elt.get("b")+"</div>";
				fs += "</li>";
			});
			fs += "</ul>";				
			$("div.friend-select-list").html(fs);
        	
		}else{
			$(".friend-length").text("");
			
			fs += "<img src='${root }/image/default.png' class='gift-friend-img'>";
        	fs += "선물할 친구를 선택하세요.";
        	$("div.friend-select-list").html(fs);
		}
	});
  }); // $(())

//친구목록 조회 함수
	function list(data) {
		
		let s="";
		console.log(data);
			
		$.ajax({
			type: "post",
			url: "../user/friendData",
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify({"data":data}),
			success:function(res){
				
				s += "<ul style='padding-left:0;'>";
				
				$.each(res, function(i,elt) {
					
					s += "<li style='list-style:none; float:left;'>";
					s += "<div style='margin-right:50px;'>";
					s += "<input type='radio' style='margin-right:10px;' class='chkBox' name='friendNum' value='"+elt.num+"'>";
					s += "<label>";
					s += "<img src='"+elt.profileImage+"' width='100' class='gift-friend-img' style='margin-right:5px;'>";
					s += "<b num='"+elt.num+"'>"+elt.nickname+"</b>";
					s += "</label>";
					s += "</div>";
					s += "</li>";
				});
				s += "</ul>";
				$("div.friend-result").html(s);
			}
		});
		
		// 친구인원수
		$.ajax({
			type: "get",
			url: "../user/friendCount",
			dataType: "json",
			data: {"userNum":$("input[name=userNum]").attr("value")},
			success:function(res){
				
				$("span.friend-count").text(res);
			}
		});
	}
  
  	function borderBottom(){
  		$('a.link_tab').css("border-bottom","");
  		$("#detailProDesc").css("border-bottom","3px solid black");
  	}

  	function getDetailProDesc(){
  		var s = "<img src='${dto.description }' style='width:100%;'>"
  	    $(".detailDescContent").html(s);
  	}

  	function getReviewCount(){
  		var productNum = $('input[name=productNum]').val();
  		var s ="";
  		$.ajax({
  			type:"get",
  			url:"../review/count",
  			data:{"productNum":productNum},
  			dataType:"json",
  			success:function(res){
  				 s += "선물후기("+res+")";
  				$("#detailReview").text(s);
  			}
      	});
  	}

  	function getReviewCount2(){
  		var productNum = $('input[name=productNum]').val();
  		var s ="";
  		$.ajax({
  			type:"get",
  			url:"../review/count",
  			data:{"productNum":productNum},
  			dataType:"json",
  			success:function(res){
  				 s+="선물후기 " +res;
  				$(".reviewContent").text(s);
  			}
      	});
  	}
	
 	// 상품 옵션 
 	 function getAllOption(productNum){
 	  		
			var s = "";
			$.ajax({
				type:"get",
	  			url:"../option/list",
	  			data:{"productNum":productNum},
	  			dataType:"json", 
				success:function(res){
					$.each(res,function(i,e){
						if(e.clothSize !=null){
							s+="<li class='dropdown-item'>";
							s+="<button type='button' value='"+e.clothSize+"' class='dropdown-option'>"+e.clothSize+"</button>";
							s+="</li>";
						}else if(e.shoesSize !=null){
							s+="<li class='dropdown-item'>";
							s+="<button type='button' value='"+e.shoesSize+"' class='dropdown-option'>"+e.shoesSize+"</button>";
							s+="</li>";
						}
					}); 
					$("#productOption").html(s);
					var optionBtn = document.querySelectorAll(".dropdown-option");
					var dropdownBtn = document.querySelector(".dropdown-toggle");
					
					optionBtn.forEach(function (item) {
						item.addEventListener("click", function (e) {
						    var selectValue = e.currentTarget.textContent.trim();
						    console.log("val"+selectValue);
						    dropdownBtn.textContent = selectValue;
						    dropdownBtn.classList.add("selected");
						    $('input[name=productOption]').attr('value', selectValue);
						    $(".dropdown-menu show").attr("class","dropdown-menu");
				  		});
					});
					
				},error : function(err){
	                 console.log('err : ',err)
	            }
			});
		}
</script>
</head>
<body>
  <c:set var="root" value="<%=request.getContextPath() %>" />
  <input type="hidden" class="proPrice" value="${dto.price }" />
  <input type="hidden" class="delivery" value="${dto.deliveryOption }" />

  <form id="insertDetail" method="post" enctype="multipart/form-data">
    <!-- order detail (선물하기, 나에게 선물하기, 선물상자 담기)-->
    <input type="hidden" name="qty" value="1" />
    <input type="hidden" name="messageCard" value="" />
    <input type="hidden" name="engrave" value="" />
    <!-- <input type="hidden" name="friendNum" value="1"> -->
    <c:if test="${!empty sessionScope.loginUserNum}">
    	<input type="hidden" name="userNum" value="${sessionScope.loginUserNum}" />
    </c:if>
    <input type="hidden" name="productNum" value="${dto.num }" />
    <input type="hidden" name="productOption" value=""/>

    <div class="detailContainer">
      <div class="detailItem">
        <img src="${dto.thumbnailImageUrl }" width="400" />
      </div>

      <div class="detailItem detailContent">
        <h3 style="font-weight: bold">${dto.name }</h3>
        <div class="review">
          <div class="rating" data-rate="${reviewAvg }">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            &nbsp;(${reviewCount } 건의 선물후기)
          </div>
        </div>
        <br /><br />
        <h3 class="_price"></h3>
        <hr />
        <i class="fa-solid fa-truck"></i>
        <p class="_delivery"></p>
        <p><i class="fa-solid fa-box"></i>&nbsp;도서산간 배송불가</p>
        <p>
          <i class="fa-solid fa-magnifying-glass"></i>&nbsp;원산지
          ${dto.country }
        </p>
      </div>

      <div class="detailItem detailRight">
        <h5 style="font-weight: bold">${dto.name }</h5>
        <!-- 옵션넣기 -->
        <c:if test="${dto.sizeOption == 1}">
        	<br>
	        <h6>상품 옵션을 선택해주세요</h6>
	      	<div class="dropdown">
		        <button type="button" class="dropdown-toggle">
		          옵션선택
		        </button>
		      	<ul class="dropdown-menu" id="productOption">
	        	</ul>
	     	</div>  
        </c:if>

        <div class="detailNum">
          <span>수량</span>
          <span class="detailCount">
            <a href="#" class="detailMinus"
              ><i class="fa-solid fa-minus"></i>&nbsp;&nbsp;</a
            >
            <span id="detailResult">1</span>
            <a href="#" class="detailPlus"
              >&nbsp;&nbsp;<i class="fa-solid fa-plus"></i
            ></a>
          </span>
        </div>
        <br />
        <h6 style="display: inline">총금액</h6>
        <h4 class="totalcost" style="display: inline">${dto.price }원</h4>

        <button
          type="button"
          class="detailCart"
          id="btn_detailCart"
          data-toggle="modal"
          data-target="#detailCartModal"
        >
          <i class="fa-solid fa-gift"></i>&nbsp;&nbsp;선물상자 담기
        </button>

        <div class="detailInsert">
          <!-- 위시리스트 -->
          <button
            type="button"
            class="btn_g"
            id="btn_detailWish"
            data-toggle="modal"
            data-target="#wishlistModal"
          >
            <span class="likes">
              <i
                class="far fa-heart"
                style="font-size: 20px; margin-left: 5px; margin-top: 3px"
              ></i
              >&nbsp;
            </span>
          </button>

          <button
            type="submit"
            class="detailSelfGift"
            formaction="../orderDetail/insertSelfGift"
          >
            <b>나에게 선물하기</b>
          </button>
          <!-- <button type="submit" class="detailGift" formaction="../orderDetail/insert"> -->
          <button type="button" class="detailGift" id="btn_orderDetail">
            <b>선물하기</b>
          </button>
        </div>
        
      </div>

      <!-- 버튼 -->
      <div class="detailItem detailDescription">
        <div class="detailDescButton">
          <ul class="tab_receive">
            <li class="presentation">
              <a class="link_tab" id="detailProDesc">상품설명</a>
            </li>
            <li class="presentation" style="margin-left: 60px">
              <a class="link_tab" id="detailReview"></a>
            </li>
          </ul>
        </div>
        <div class="detailDescContent"></div>
      </div>

      <!-- 선물하기 modal -->
      <div id="orderDetailModal" class="gift-modal-overlay">
        <div class="gift-modal-window">
          <div class="gift-modal-top">
	            <div class="gift-title">
	            	<div>
		                <h5>
		                	친구 선택
		                	<span style="font-size: 20px; margin-bottom: 5px; color:#ff6b00;" class="friend-length"></span>
		                </h5>
	            	</div>
	            	<div class="gift-close-area">X</div>
	            </div>
	            <div class="friend-select-list">
	            	<img src="${root }/image/default.png" class="gift-friend-img">
	            	<b style="font-weight: normal; position: relative; left: 5px;">선물할 친구를 선택하세요.</b>
	            </div>
	            <div class="gift-modal-search">
	            	<input type="search" placeholder="이름, 닉네임 검색" id="friend-search" name="friend-search">
	            	<img src="${root}/image/search.svg" style="cursor: pointer;" id="search-start">
	            </div>
        	</div>
          <div class="gift-modal-middle">
            	<div style="margin: 10px 0;">
            		친구목록
            		<span style="font-size: 15px; margin-bottom: 5px;" class="friend-count"></span>
            	</div>
            	<div class="friend-result">
            	</div>
          </div>
          <div class="gift-modal-button">
				<button type="button" class="btn btn-secondary btn-cancel">취소</button>
				<div></div>
				<button type="button" class="btn getWishlist" id="btn_orderDetailInsert">확인</button>
          </div>
        </div>
      </div>

      <!-- 선물상자 담기 Modal -->
      <div
        class="modal fade"
        id="detailCartModal"
        tabindex="-1"
        role="dialog"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-body">
              <img
                src="${dto.thumbnailImageUrl }"
                width="100"
                style="float: left"
              />
              <h4><b>선물상자에 상품을 담았어요</b></h4>
              <a href="${root}/mypage/cart">선물상자 보러가기</a>
            </div>
            <div class="modal-footer">
              <button type="button" class="detailCart" data-dismiss="modal">
                Close
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- wishlist Modal -->
      <div
        class="modal fade"
        id="wishlistModal"
        tabindex="-1"
        role="dialog"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">
                위시의 공개범위를 선택해주세요
              </h5>
              <button
                type="button"
                class="close"
                data-dismiss="modal"
                aria-label="Close"
              >
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <label
                ><input
                  type="radio"
                  style="width: 18px; height: 18px; border: 1px"
                  name="publicOption"
                  value="0"
                  checked="checked"
                />
                <h5 style="display: inline-block">친구공개</h5>
              </label>
              <br />
              <label
                ><input
                  type="radio"
                  style="width: 18px; height: 18px; border: 1px"
                  name="publicOption"
                  value="1"
                />
                <h5 style="display: inline-block">비공개</h5>
              </label>
            </div>
            <div class="modal-footer">
              <button
                type="button"
                class="detailWishlist"
                data-dismiss="modal"
              >
                담기
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form>
</body>
</html>
