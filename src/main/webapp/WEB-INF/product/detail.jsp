<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
	
	<!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    
    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- bootstrap 5 icon -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	
	<!-- bootstrap css -->
    
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/f7b2a5e0aa.js" crossorigin="anonymous"></script>

	<!-- alert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	.detailContainer{	
		display:grid; 
		grid-template-columns: 3fr 4fr 2fr;
		max-width:1180px;
		margin: 0 auto;
	}
	
	.detailItem:nth-child(1) {
		grid-column:1/2;
	}
	 
	.detailItem:nth-child(2) {
		grid-column:2/3;
	}
	
	.detailItem:nth-child(3) {
		grid-column:3/4;
	}
	
	.detailItem:nth-child(4) {
		grid-column:1/3;
	}
	
	.detailDescription{
		border-right: 1px solid #C8D2D1;
	}
	
	.detailRight{
		position: sticky;
		top:100px;
		height:100%; 
	}
	
	.detailContent{ 
		margin-left: 40px;
		border-right: 1px solid #C8D2D1;
	}
	
	._delivery{
		display: inline;
	}
	
	.detailRight{
		margin-left: 30px;
		margin-top:30px;
	}
	
	.detailCount{
		margin-left: 160px;
	}
	
	.totalcost{
		margin-left: 110px;
	}
	
 	.detailCart{
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
	
	.detailInsert{
		margin-top: 10px;
	}
	
	.btn_g{
		width: 50px;
    	padding: 11px 0 11px;
    	background-color: #444;
    	color: #f5f5f5;
  		border-radius: 5px;
	}
	
	.detailGift{
		width: 120px;
    	padding: 13px 0 13px;
    	background-color: #ffde22;
  		border-radius: 5px;
  		border-color: #ffde22;
	}
	
	.detailSelfGift{
		width: 120px;
    	padding: 13px 0 13px;
    	background-color: #111;
    	color: #f5f5f5;
  		border-radius: 5px;
	}
	
</style>
<script type="text/javascript">
$(function(){
	
	var price = $(".proPrice").val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	$('._price').text(price+"원");
	$('.totalcost').text(price+"원");
	
	var deliveryOption = $(".delivery").val();
	if(deliveryOption){
		$('._delivery').text(" 배송비 미포함");
	}else{
		$('._delivery').text(" 배송비포함");
	}
	
	var rating = $('.review .rating');
	
	rating.each(function(){
		var targetScore = $(this).attr('data-rate');
		$(this).find('.fa-star:nth-child(-n'+targetScore+')').css({color:'#F7C815'});
	});
	
	// 수량버튼
	var _price = $(".proPrice").val();
	var plus = document.querySelector(".detailPlus");
	var minus = document.querySelector(".detailMinus");
	var result = document.querySelector("#detailResult");
	var count =1;
	
	plus.addEventListener("click", ()=>{
		count++;
		result.textContent = count;
		var totalcostNum = count * _price;
		/* console.log(totalcostNum); */
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
	/* 	alert(data); */
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
});
</script>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<input type="hidden" class="proPrice" value=${dto.price }>
 	<input type="hidden" class="delivery" value=${dto.deliveryOption }>
 	
	 <form id="insertDetail" method="post" enctype="multipart/form-data">
	 	<!-- order detail (선물하기, 나에게 선물하기, 선물상자 담기)-->
	 	<input type="hidden" name="qty" value="1">
	 	<input type="hidden" name="messageCard" value="">
	 	<input type="hidden" name="engrave" value="">
	 	<input type="hidden" name="friendNum" value="1">
	 	<input type="hidden" name="userNum" value="2">
	 	<input type="hidden" name="productNum" value="${dto.num }">
	 	
	 	<!-- wishlist -->
	 	<!-- <input type="hidden" name="publicOption" value="0"> -->
	 	
		<div class="detailContainer">
			<div class="detailItem">
				<img src="${dto.thumbnailImageUrl }" width="400">
			</div>
			
			<div class="detailItem detailContent">
				<h3>${dto.name }</h3>
				<div class="review">
					<div class="rating" data-rate=${reviewAvg }>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i> 
						&nbsp;(${reviewCount } 건의 선물후기)
					</div>
					
				</div>
				<br><br>
				<h3 class="_price"></h3>
				<hr>
				<i class="fa-solid fa-truck"></i><p class='_delivery'></p>
				<p><i class="fa-solid fa-box"></i>&nbsp;도서산간 배송불가</p>
				<p><i class="fa-solid fa-magnifying-glass"></i>&nbsp;원산지 ${dto.country }</p>
			</div>
			
			<div class="detailItem detailRight">
				<p><b>${dto.name }</b></p>
				<div class="detailNum">
					<span>수량</span>
					<span class="detailCount">
						<a href="#" class="detailMinus"><i class="fa-solid fa-minus"></i>&nbsp;&nbsp;</a>
						<span id="detailResult">1</span>
						<a href="#" class="detailPlus">&nbsp;&nbsp;<i class="fa-solid fa-plus"></i></a>
					</span>
				</div>
				<br>
				<h6 style="display: inline;">총금액</h6><h4 class="totalcost" style="display: inline;">${dto.price }원</h4>
				
				<button type="button" class="detailCart" id="btn_detailCart" data-toggle="modal" data-target="#detailCartModal">
					<i class="fa-solid fa-gift"></i>&nbsp;&nbsp;선물상자 담기
				</button> 
			
				<div class="detailInsert">
					<!-- 위시리스트 -->
					<button type="button" class="btn_g" id="btn_detailWish" data-toggle="modal" data-target="#wishlistModal">
						<span class="likes">	
							<i class='far fa-heart' style="font-size: 20px; margin-left: 5px; margin-top: 3px;"></i>&nbsp;
						</span>
					</button>
					
					<button type="submit" class="detailSelfGift" formaction="../orderDetail/insertSelfGift"><b>나에게 선물하기</b></button>
					<!-- <button type="submit" class="detailGift" formaction="../orderDetail/insert"> -->
					<button type="button" class="detailGift" id="btn_orderDetail" data-toggle="modal" data-target="#orderDetailModal">
						<b>선물하기</b>
					</button>	
				</div>
			</div>
			
			<div class="detailItem detailDescription">		
				<img src="${dto.description }" style="width:100%;">
			</div>
			
			<!-- 선물하기 modal -->
			<div class="modal fade" id="orderDetailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-body">
				        	...
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="detailCart" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				</div>
			</div>
			
			<!-- 선물상자 담기 Modal -->
			<div class="modal fade" id="detailCartModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
				    <div class="modal-content">
				      	<div class="modal-body">
				        	<img src="${dto.thumbnailImageUrl }" width="100" style="float: left;"><h4><b>선물상자에 상품을 담았어요</b></h4>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="detailCart" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				</div>
			</div>	
			
			<!-- wishlist Modal -->
			<div class="modal fade" id="wishlistModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">위시의 공개범위를 선택해주세요</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <label><input type="radio" style="width:18px; height:18px; border:1px;" name="publicOption" value="0" checked="checked">
			        	<h5 style="display: inline-block;">친구공개</h5>
			        </label>
			        <br>
      				<label><input type="radio" style="width:18px; height:18px; border:1px;" name="publicOption" value="1">
			        	<h5 style="display: inline-block;">비공개</h5>
			        </label>
			      </div>
			      <div class="modal-footer">
			     	<!--  formaction="../wishlist/insert" -->
			        <button type="button" class="detailWishlist" data-dismiss="modal">담기</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- 선물하기 modal -->
			<!-- Button trigger modal -->
			 <!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
			  Launch demo modal
			</button> -->
			
			
    
		</div>
	</form>
</body>
</html>