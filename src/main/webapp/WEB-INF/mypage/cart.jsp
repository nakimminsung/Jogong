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
    
<style>
	a.menu-cart {
    	color:#000 !important;
	}
	div.cart-wrapper{
		width: 100%;
	}
	div.cart-result{
		max-width: 100%;
		margin: 0 0 0 auto;
		margin-top: 20px;
		min-height: 600px;
	}
	div.cart-object{
		width: 100%;
		margin-bottom: 20px;
	}
	div.cart-object>div{
		width: 100%;
		display: flex;
		justify-content: space-between;
	}
	div.cart-object-top{
		margin-bottom: 10px;
	}
	div.cart-object-top-left{
		width: 70%;
		display: flex;
		flex-direction: row;
	}
	div.cart-object-top-left>div{
		width: 100%;
		display: flex;
		flex-direction:column;
		justify-content: flex-start;
	}
	div.cart-object-top-left>div>b{
		font-weight: normal;
		display: block;
	}
	img.cart-image {
		margin-right: 10px;
		margin-top: 0;
	}
	div.cart-object-top-right{
		display:flex;
		width: 30%;
		flex-direction: column;
		justify-content: space-between;
		align-items: flex-end;
	}
	div.cart-object-top-right>div{
		width: 150px;
		height: 40px;
		text-align: center;
		line-height: 40px;
		cursor: pointer;
		border: 1px solid lightgray;
	}
	div.cart-object-top-right>div:active{
		box-shadow: 1px 1px 1px lightgray;
	}
	div.cart-object-bottom>div{
		width: 49%;
	}
	div.cart-object-bottom-left {
		background-color: #fafafa;
		display: flex;
		justify-content: space-between;
		padding: 10px 20px;
	}
	div.cart-object-bottom-left>div{
		display: flex;
		flex-direction: column;
	}
	div.cart-object-bottom-left>div>b{
		font-weight: normal;
	}
	div.cart-price-list{
		align-items: flex-end;
	}
	div.cart-object-bottom-right {
		background-color: #fafafa;
		display: flex;
		justify-content: space-between;
		padding: 10px 20px;
	}
	div.cart-object-bottom-right>div{
		display: flex;
		flex-direction: column;
		justify-content: center;
	}
	div.cart-object-bottom-right>div>b{
		font-weight: normal;
	}
	div.cart-total-price {
		align-items: flex-end;
	}
	div.cart-check {
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding-right:10px;
	}
	div.cart-check>input {
		width: 20px;
		height: 20px;
		margin: 10px 0;
	}
	div.cart-check>a {
		cursor: pointer;
	}
	i.fa-times {
		font-size: 20px;
		color:lightgray;
	}
	.cart-image{
		width:  86px;
		height:  86px;
		display: inline;
	}
	div.cart-top{
		max-width: 100%;
		margin: 0 0 0 auto;
		position: sticky;
		height: 120px;
		top: 100px;
		background-color: white;
		border-bottom: 2px solid #f0f0f0;
		padding-bottom: 5px;
		padding-top: 24px;
	}

	div.cart-title>span{
		font-size: 25px;
		font-weight: 1000;
	}
	div.cart-title>hr{
		width: 87px; 
		height: 10px; 
		position: relative; 
		top:-28px; 
		color: #cff0cc; 
		opacity: 1; 
		z-index: -1;
	}
	div.cart-title{
		margin-bottom: -25px;
	}
	div.cart-total {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	div.cart-test {
		max-width: 800px;
		margin: 0 0 0 auto;
		display: flex;
		justify-content: space-between;
		align-items: center;
		height: 70px;
		border-bottom: 2px solid #f0f0f0;
		padding-bottom: 5px;
		position: sticky;
		bottom:0;
		background-color: white;
		border-top: 2px solid lightgray;
		border-left: 2px solid lightgray;
		border-right: 2px solid lightgray;
		padding-right: 10px;
		border-radius: 10px 10px 0 0;
		padding-top:5px;
	
	}
	div.cart-total-right {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	div.cart-total-right-price{
		margin-right: 10px;
	}
	div.cart-total-left>input {
		width: 20px;
		height: 20px;
		margin: 10px 0;
	}
	#cart-option-modal.cart-modal-overlay {
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
    #cart-option-modal .cart-modal-window {
        background: #fff;
        box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
        backdrop-filter: blur( 13.5px );
        -webkit-backdrop-filter: blur( 13.5px );
        border-radius: 10px;
        border: 1px solid rgba( 255, 255, 255, 0.18 );
        width: 400px;
        height: 215px;
        position: absolute;
        top: 200px;
        padding: 20px;
    }
	#cart-wish-modal.cart-modal-overlay {
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
    #cart-wish-modal .cart-modal-window {
        background: #fff;
        box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
        backdrop-filter: blur( 13.5px );
        -webkit-backdrop-filter: blur( 13.5px );
        border-radius: 10px;
        border: 1px solid rgba( 255, 255, 255, 0.18 );
        width: 400px;
        height: 300px;
   		position: absolute;
        top: 200px;
        padding: 20px;
    }
    .modal-fix {
	  position: fixed;
	  width :100%;
	  height: 100%;
	  overflow: scroll;
	}
	div.cart-modal-window {
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	div.cart-modal-top{
		margin-bottom: 35px;
	}
	div.cart-modal-middle{
		margin-bottom: 35px;
		width:100%;
	}
	div.cart-modal-bottom {
		display: flex;
		flex-direction: row;
	}
	div.cart-wish-option{
		display: flex;
		flex-direction: column;
	}
	div.cart-wish-option input{
		margin-top: 5px;
	}
	div.cart-wish-option>div {
		display: flex;
		flex-direction: row;
		justify-content: flex-start;
	}
	div.cart-wish-option>div>div{
		display: flex;
		flex-direction: column;
		margin-right: 10px;
	}
	input#cart-qty:focus {outline: none;}
	
	img.gift-friend-img {
		width: 50px;
		border-radius: 20px;
		border: 2px solid white;
	}
	
	#gift-modal.gift-modal-overlay {
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
    #gift-modal .gift-modal-window {
        background: #fff;
        box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
        backdrop-filter: blur( 13.5px );
        -webkit-backdrop-filter: blur( 13.5px );
        border-radius: 10px;
        border: 1px solid rgba( 255, 255, 255, 0.18 );
        width: 400px;
        height: 600px;
        position: fixed;
        top: 2%;
        padding: 20px;
    }
    #gift-modal .gift-close-area {
        cursor: pointer;
        color: gray;
        font-weight: 400px;
        font-size: 20px;
        z-index: 999;
    }
    .modal-fix {
	  position: fixed;
	  width :100%;
	  height: 100%;
	  overflow: scroll;
	}
    div.gift-title{
    	display: flex;
    	justify-content: space-between;
    }
    div.gift-modal-button{
    	width:90%;
    	display: flex;
    	justify-content: center;
    	align-items: center;
    	position: fixed;
    	bottom: 10px;
    }
    div.gift-modal-button>button{
    	width:100%;
    }
    div.gift-modal-button>div{
    	width:30px;
    }
    div.gift-modal-select-flex {
    	display: flex;
    	align-items: center;
    }
    div.gift-modal-select-object {
    	display: flex;
    	align-items: center;
    }
    div.gift-modal-select>input{
		margin-right: 5px;
    }
    div.gift-modal-select>img{
    	margin-left:0;
		margin-right: 5px;
    }
    div.gift-modal-search {
    	margin-top: 0px;
    	margin-bottom: -10px;
    }
    div.gift-modal-search input{
    	width:100%;
    	height: 40px;
    }
    div.gift-modal-search img{
    	width:30px;
    	position: relative;
    	top: -35px;
    	left: 325px;
    	cursor: pointer;
    }
    div.gift-friend-list{
 		height: 300px;
 		margin-top: 20px;
    }
    div.friend-result{
    	overflow: auto;
    	height: 230px; 	
    }
    div.friend-select-list {
    	height: 80px;
    	display: flex;
    	align-items: center;
    }
    div.gift-left{
   		display: flex;
   		align-items: center;
    }
    button#cart-order-gift {
    	background-color: #cff0cc;
    }

</style>
<script>
	$(function(){
		
		// cart페이지 접속시 카트 select 로드
		cartlist();
		
    	var publicOption = "";
    	var userNum = ${sessionScope.loginUserNum};
    	var productNum = "";
    	var updateCartNum="";
		
		// 단건 상품 삭제
		$(document).on("click",".cart-check-delete",function(){
			
			let cartDeleteResult = confirm("상품 1종이 선물상자에서 삭제됩니다.\n정말 삭제할까요?");
			
			if(cartDeleteResult == true) {
				let cartNum = $(this).attr("cartNum");
				
				$.ajax({
					type: "get",
					url: "../cart/delete",
					dataType: "text",
					data: {"cartNum":cartNum},
					success:function(res){
						
						window.location.href="cart";
					}
				});	
			} 
		});
		
		// 선택 삭제
		$("#cart-all-delete").click(function(){
			
			let checkSize = $('input:checkbox[name=cart-check]:checked').length;
			
			if(checkSize != 0) {
				let cartDeleteList = [];
				
				$('input:checkbox[name=cart-check]:checked').each(function() {			
					cartDeleteList.push($(this).attr("cartNum"));
				});
				
				let cartDeleteResult = confirm("상품 "+cartDeleteList.length+"건이 선물상자에서 삭제됩니다.\n정말 삭제할까요?");
				console.log(cartDeleteList);
				
				if(cartDeleteResult == true) {
					
				 	$.ajax({
						type: "post",
						url: "../cart/checkDelete",
						dataType: "text",
						data: JSON.stringify({"cartDeleteList":cartDeleteList}),
						contentType: "application/json; charset=utf-8",
						success:function(res){
							
							window.location.href="cart";
						}
					});
				}		
			} else {
				alert("선택하신 상품이 없습니다.");
			}
		});
        
		// 장바구니에서 위시리스트 추가
        $(document).on("click",".cart-wish-insert",function(){
        	
        	publicOption = $(".cart-wish-option").find(":input:radio[name=publicOption]:checked").val();
        	
        	var wishData = {"publicOption":publicOption, "userNum":userNum, "productNum":productNum};
        	
          	$.ajax({
				type: "post",
				url: "../wishlist/cart_insert",
				dataType: "text",
				data: wishData,
				success:function(res){
					
					window.location.href="cart";
				}
			});
        });
		
		// 장바구니 상품 수량 변경
		$(document).on("click",".cart-qty-update",function(){
			var qty = $("#cart-qty").val();
			
		  	$.ajax({
				type: "get",
				url: "../cart/update",
				dataType: "text",
				data: {"cartNum":updateCartNum,"qty":qty},
				success:function(res){
					
					window.location.href="cart";
				}
			});
		});
 		
		// 수량변경 함수
        $('.cart-modal-middle :button').on({'click' : function(e){
                e.preventDefault();
                var $count = $(this).parent('.cart-modal-middle').find('#cart-qty');
                var now = parseInt($count.val());
                var min = 1;
                var max = 999;
                var num = now;
                if($(this).hasClass('minus')){
                    var type = 'm';
                }else{
                    var type = 'p';
                }
                if(type=='m'){
                    if(now>min){
                        num = now - 1;
                    }
                }else{
                    if(now<max){
                        num = now + 1;
                    }
                }
                if(num != now){
                    $count.val(num);
                }
            }
        });
        
        $(document).ready(function(){
            //전체 체크박스 클릭
            $("#cart-all-check").click(function() {
                if ($("#cart-all-check").prop("checked")) {
                    $(".cart-check-one").prop("checked", true);
                } else {
                    $(".cart-check-one").prop("checked", false);
                }
            });
            //전체 체크박스 선택중 체크박스 하나를 풀었을때 "전체" 체크해제
            $(document).on("click",".cart-check-one",function(){
            	
	        	var check = $(".cart-check-one").length;
	        	
                if ($("input[name='check']:checked").length==check) {
                    $("#cart-all-check").prop("checked", true);
                } else {
                    $("#cart-all-check").prop("checked", false);
                }
            });
        });
		
        // 옵션, 위시이동 모달
	    const optionModal = document.getElementById("cart-option-modal")
	    const wishModal = document.getElementById("cart-wish-modal")
	    
		$(document).on("click",".cart-option-button",function(){
			optionModal.style.display = "flex"
			updateCartNum = $(this).attr("cartNum");
			$("body").attr("class","modal-fix");
		});
	    
		$(document).on("click",".cart-wish-button",function(){
			wishModal.style.display = "flex"
			productNum = $(this).attr("productNum");
			$("body").attr("class","modal-fix");
		});
		
		$(document).on("click",".btn-cancel",function(){
		    optionModal.style.display = "none"
	        $("body").attr("class","");
		});
		
		$(document).on("click",".btn-cancel",function(){
		    wishModal.style.display = "none"
	        $("body").attr("class","");
		});
		
		// 나에게 선물하기
		$("#cart-order-self").click(function(){
			
			let checkSize = $('input:checkbox[name=cart-check]:checked').length;
			
			if(checkSize != 0){
				let cartInsertList = [];
				
				$('input:checkbox[name=cart-check]:checked').each(function() {
					
					let data = {
						productNum : $(this).attr("productNum"),
						userNum : $(this).attr("userNum"),
						friendNum : $(this).attr("userNum"),
						qty : $(this).attr("qty"),
						messageCard:"",
						engrave:""
					}
					
					cartInsertList.push(data);
				});
				
			 	$.ajax({
					type: "post",
					url: "../orderDetail/insertSelfCart",
					dataType: "json",
					data: JSON.stringify({"cartInsertList":cartInsertList}),
					contentType: "application/json; charset=utf-8",
					success:function(res){
						
						window.location.href="../payview?num="+res.num;
					}
				});
			} else {
				alert("선택하신 상품이 없습니다.");
			}
		});
		
		// 친구에게 선물하기
		$("#cart-gift-friend").click(function(){
			
			let cartInsertList = [];
			let friendNum = $('input:radio[name=radio]:checked').attr("friendNum");
			
			$('input:checkbox[name=cart-check]:checked').each(function() {
				
				let data = {
					productNum : $(this).attr("productNum"),
					userNum : $(this).attr("userNum"),
					friendNum : friendNum,
					qty : $(this).attr("qty"),
					messageCard:"",
					engrave:""
				}
				
				cartInsertList.push(data);
			});
			
				$.ajax({
				type: "post",
				url: "../orderDetail/insertSelfCart",
				dataType: "json",
				data: JSON.stringify({"cartInsertList":cartInsertList}),
				contentType: "application/json; charset=utf-8",
				success:function(res){
					
					window.location.href="../payview?num="+res.num;
				}
			});
		});
		
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
		
        const modal = document.getElementById("gift-modal")
        const btnModal = document.getElementById("cart-order-gift")
		const closeBtn = modal.querySelector(".gift-close-area")
		
		closeBtn.addEventListener("click", e => {
		    modal.style.display = "none"
	        $("body").attr("class","");
		})
		
		modal.addEventListener("click", e => {
		    const evTarget = e.target
			    if(evTarget.classList.contains("gift-modal-overlay")) {
			        modal.style.display = "none"
	        		$("body").attr("class","");
			    }
		})
		
		window.addEventListener("keyup", e => {
    		if(modal.style.display === "flex" && e.key === "Escape") {
        		modal.style.display = "none"
        		$("body").attr("class","");
   			}
		})
		
		$("#gift-friend").click(function(){
			$("body").attr("class","modal-fix");
		});
        
		$(document).on("click",".btn-cancel",function(){
		    modal.style.display = "none"
		    $("body").attr("class","");
		});
		
		$("#cart-order-gift").click(function(){
			let checkSize = $('input:checkbox[name=cart-check]:checked').length;
			
			if(checkSize != 0){
			    modal.style.display = "flex"
				$("body").attr("class","modal-fix");
				friendList();
			} else {
				alert("선택하신 상품이 없습니다.");
			}
		});
	}); // $(fucntion)
		// cart list 호출 함수
		function cartlist() {
			let userNum = ${sessionScope.loginUserNum};
			let friendNum = userNum;
				
			var s="";
			
			var totalPrice = 0;
				
			$.ajax({
				type: "get",
				url: "../cart/list",
				dataType: "json",
				data: {"userNum":userNum},
				success:function(res){
					
		 			$.each(res, function(i,elt) {
		 				
		 				totalPrice += (elt.price)*(elt.qty);
						
						s += "<div class='cart-object'>";
						s += "<div class='cart-check'>";
						s += "<input type='checkbox' class='cart-check-one' name='cart-check' userNum='"+userNum+"' friendNum='"+friendNum+"' productNum='"+elt.productNum+"' cartNum='"+elt.num+"' qty='"+elt.qty+"'>";
						s += "<a class='cart-check-delete' cartNum='"+elt.num+"'>";
						s += "<i class='fas fa-times'></i>";
						s += "</a>";
						s += "</div>";
						s += "<div class='cart-object-top'>";
						s += "<div class='cart-object-top-left'>";
						s += "<img src='"+elt.thumbnailImageUrl+"' class='cart-image'>";
						s += "<div>";
						s += "<b class='cart-brand' style='color:gray; font-size:13px; margin-bottom:5px;'>"+elt.brand+"</b>";
						s += "<a href='../product/detail?num="+elt.productNum+"' class='cart-name' style='font-size:15px;'>"+elt.name+"</a>";
						s += "<b class='cart-option'></b>";
						s += "</div>";
						s += "</div>";
						s += "<div class='cart-object-top-right'>";
						s += "<div class='cart-option-button' cartNum='"+elt.num+"'>";
						s += "수량 변경";
						s += "</div>";
						s += "<div class='cart-wish-button' productNum='"+elt.productNum+"'>";
						s += "위시로 이동";
						s += "</div>";
						s += "</div>";
						s += "</div>";
						s += "<div class='cart-object-bottom'>";
						s += "<div class='cart-object-bottom-left'>";
						s += "<div class='cart-price-list'>";
						s += "<b>상품금액</b>";
						s += "<b>선택수량</b>";
						s += "</div>";
						s += "<div class='cart-price-list'>";
						s += "<b>"+elt.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원</b>";
						s += "<b>x "+elt.qty+"</b>";
						s += "</div>";
						s += "</div>";
						s += "<div class='cart-object-bottom-right'>";
						s += "<div class='cart-total-left'>";
						s += "<b>결제금액</b>";
						s += "</div>";
						s += "<div class='cart-total-right'>";
						s += "<b>"+((elt.price)*(elt.qty)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원</b>";
						s += "</div>";
						s += "</div>";
						s += "</div>";
						s += "</div>";
						
					});
					$("div.cart-total-right-price").find("b.cart-total-price").text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
					$("div.cart-result").html(s);
				}
			});
		}
		// 친구 리스트
		function friendList() {
			var userNum = ${sessionScope.loginUserNum};
				
			var s="";
				
			$.ajax({
				type: "get",
				url: "../user/friendData",
				dataType: "json",
				data: {"userNum":userNum},
				success:function(res){
					
					s += "<ul style='padding-left:0;'>";
					
					$.each(res, function(i,elt) {
						
						s += "<li style='list-style:none; float:left;'>";
						s += "<div style='margin-right:50px;'>";
						s += "<input type='radio' style='margin-right:10px;' class='chkBox' name='radio' friendNum='"+elt.num+"'>";
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
			
			$.ajax({
				type: "get",
				url: "../user/friendCount",
				dataType: "json",
				data: {"userNum":userNum},
				success:function(res){
					
					$("span.friend-count").text(res);
				}
			});
		}
</script>
<c:set var="root" value="<%=request.getContextPath() %>"/>
</head>
<body>
	<div class="cart-wrapper">
		<div class="cart-top" style="z-index: 2;">
			<div class="cart-title">
				<span>장바구니</span>
				<hr>
			</div>
			<div class="cart-total">
				<div class="cart-total-left">
					<input type="checkbox" id="cart-all-check">
				</div>
				<div class="cart-total-right" style="padding-right: 10px;">
					<b style="color:#a0a0a0; cursor: pointer;" id="cart-all-delete">삭제하기</b>
				</div>
			</div>
		</div>
		<div class="cart-result" style="position: relative; top: -10px;">
		</div>
		<div class="cart-test" style="z-index: 100; width: 75%; display: flex; justify-content: flex-end; margin-top: 100px;">
			<div class="cart-total-right" >
				<div class="cart-total-right-price" style="margin-right: 10px;">
					<b style="font-size:17px; font-weight: normal; margin-right: 30px;">총 결제 금액</b>
					<b class="cart-total-price" style="font-size: 20px;">0</b>
					<b style="font-size:17px; font-weight: normal;">원</b>
				</div>
				<div class="cart-total-right-button" style="margin-left: 20px;">
					<button type="button" id="cart-order-self" class="btn btn-dark" style="margin-right: 10px; font-weight: 1000;">나에게 선물하기</button>
					<button type="button" id="cart-order-gift" class="btn" style="font-weight: 1000;">친구에게 선물하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- option modal -->
    <div id="cart-option-modal" class="cart-modal-overlay">
        <div class="cart-modal-window">
        	<div class="cart-modal-top">
	       		<b style="font-size: 20px;">수량 변경</b>
        	</div>
        	<div class="cart-modal-middle" style="border: 1px solid #f0f0f0; display: flex; align-items: unset; width: 100%;">
	       		<button class="btn btn-outline-light text-dark minus">-</button>
	       		<input type="tel" id="cart-qty" name="qty" value=1 style="width: 80%; border:white; text-align: center;">
	       		<button class="btn btn-outline-light text-dark plus">+</button>
        	</div>
            <div class="cart-modal-bottom">
				<button type="button" class="btn btn-secondary btn-cancel" style="width:180px;">취소</button>
				<div style="width:10px;"></div>
				<button type="button" class="btn cart-qty-update" style="width:180px; background-color: #cff0cc;" cartNum="">확인</button>
            </div>
        </div>
    </div>
	<!-- wish modal -->
    <div id="cart-wish-modal" class="cart-modal-overlay">
        <div class="cart-modal-window">
        	<div class="cart-modal-top">
	       		<b style="font-size: 20px;">위시의 공개범위를 선택해주세요</b>
        	</div>
        	<div class="cart-modal-middle">
        		<form>
		       		<div class="cart-wish-option">
		       			<div style="border-bottom: #f0f0f0 solid 1px; padding-bottom: 15px; margin-bottom: 15px;">
		       				<div>
				       			<input type="radio" name="publicOption" value=1 style="display: inline;" checked="checked">
		       				</div>
			       			<div>
				       			<b style="display: block; font-size: 17px; margin-bottom: 5px;">친구공개! 내 취향은 이거야</b>
				       			<b style="font-size: 13px; color:gray;">내 선물을 고민하는 친구를 위해 힌트 주기</b>
			       			</div>
		       			</div>
		       			<div>
		       				<div>
				       			<input type="radio" name="publicOption" value=0>
		       				</div>
			       			<div>
				       			<b style="display: block; font-size: 17px;">비밀! 나만 볼 수 있어요</b>
				       			<b style="font-size: 13px; color:gray;">나만 알고 싶은 상품, 몰래 찜해두기</b>
			       			</div>
		       			</div>
		       		</div>
        		</form>
        	</div>
            <div class="cart-modal-bottom">
				<button type="button" class="btn btn-secondary btn-cancel" style="width:180px;">취소</button>
				<div style="width:10px;"></div>
				<button type="button" class="btn cart-wish-insert" style="width:180px; background-color: #cff0cc;">담기</button>
            </div>
        </div>
    </div>
    <!-- 친구선택 modal -->
    <div id="gift-modal" class="gift-modal-overlay">
        <div class="gift-modal-window">
        	<form>
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
	            	선물할 친구를 선택하세요.
	            </div>
	            <div class="gift-modal-search">
	            	<input type="search" placeholder="이름, 닉네임 검색">
	            	<img src="${root}/image/search.svg">
	            </div>
        	</div>
            <div class="gift-modal-top">
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
				<button type="button" class="btn" id="cart-gift-friend" style="background-color: #cff0cc;">확인</button>
            </div>
            </form>
        </div>
    </div>
</body>
</html>