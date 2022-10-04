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
	body * {
		font-size: 13px;
	}
	div.cart-wrapper{
		max-width: 100%;
		position:relative;
		padding-top: 50px;
		width: 100%
	}
	div.cart-result{
		max-width: 800px;
		margin: 0 0 0 auto;
		margin-top: 20px;
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
	div.cart-total {
		max-width: 800px;
		margin: 0 0 0 auto;
		display: flex;
		justify-content: space-between;
		align-items: center;
		height: 70px;
		border-bottom: 2px solid #f0f0f0;
		padding-bottom: 20px;
		position: sticky;
		top:100px;
		background-color: white;
	
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
        position: relative;
        top: 0px;
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
        position: relative;
        top: 0px;
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
</style>
<script>
	$(function(){
		
		// cart페이지 접속시 카트 select 로드
		cartlist();
		
    	var publicOption = "";
    	let userNum = 1;
    	let productNum = "";
    	var updateCartNum="";
		
		// 단건 상품 삭제
		$(document).on("click",".cart-check-delete",function(){
			
			var cartDeleteResult = confirm("상품 1종이 선물상자에서 삭제됩니다.\n정말 삭제할까요?");
			
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
        
		// 장바구니에서 위시리스트 추가
        $(document).on("click",".cart-wish-insert",function(){
        	
        	publicOption = $(".cart-wish-option").find(":input:radio[name=publicOption]:checked").val();
        	
        	var wishData = {"publicOption":publicOption, "userNum":userNum, "productNum":productNum};
        	
          	$.ajax({
				type: "post",
				url: "../wishlist/insert",
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
		});
	    
		$(document).on("click",".cart-wish-button",function(){
			wishModal.style.display = "flex"
			productNum = $(this).attr("productNum");
			
		});
		
		$(document).on("click",".btn-cancel",function(){
		    optionModal.style.display = "none"
	        $("body").attr("class","");
		});
		
		$(document).on("click",".btn-cancel",function(){
		    wishModal.style.display = "none"
	        $("body").attr("class","");
		});
		
		$(".cart-option-button").click(function(){
			$("body").attr("class","modal-fix");
		});
		
		$(".cart-wish-button").click(function(){
			$("body").attr("class","modal-fix");
		});
	});
	
	// cart list 호출 함수
	function cartlist() {
		let userNum = 1;
			
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
					s += "<input type='checkbox' class='cart-check-one' name='check' cartNum='"+elt.num+"'>";
					s += "<a class='cart-check-delete' cartNum='"+elt.num+"'>";
					s += "<i class='fas fa-times'></i>";
					s += "</a>";
					s += "</div>";
					s += "<div class='cart-object-top'>";
					s += "<div class='cart-object-top-left'>";
					s += "<img src='"+elt.thumbnailImageUrl+"' class='cart-image'>";
					s += "<div>";
					s += "<b class='cart-brand' style='color:gray; font-size:13px;'>"+elt.brand+"</b>";
					s += "<b class='cart-name' style='font-size:15px;'>"+elt.name+"</b>";
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
				$("div.cart-total-right-price").find("b").text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
				$("div.cart-result").html(s);
			}
		});
	}
</script>
</head>
<body>
	<div class="cart-wrapper">
		<div class="cart-total">
			<div class="cart-total-left">
				<input type="checkbox" id="cart-all-check">
			</div>
			<div class="cart-total-right">
				<div class="cart-total-right-price">
					총 결제금액 <b>0</b>원
				</div>
				<div class="cart-total-right-button">
					<button type="button" class="btn btn-dark">나에게 선물하기</button>
					<button type="button" class="btn btn-warning">선물하기</button>
				</div>
			</div>
		</div>
		<div class="cart-result">
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
				<button type="button" class="btn btn-warning cart-qty-update" style="width:180px;" cartNum="">확인</button>
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
				<button type="button" class="btn btn-warning cart-wish-insert" style="width:180px;">담기</button>
            </div>
        </div>
    </div>
</body>
</html>