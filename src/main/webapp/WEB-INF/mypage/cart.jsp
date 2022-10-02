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
	}
	div.cart-result{
		max-width: 700px;
		margin: 0 auto;
		margin-top: 50px;
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
		justify-content: center;
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
</style>
<script>
	$(function(){
		
		// cart페이지 접속시 카트 select 로드
		cartlist();
		
		// 단건 상품 삭제
		$(document).on("click",".cart-check-delete",function(){
			confirm("상품을 삭제하시겠습니까?");
			var cartNum = $(this).attr("cartNum");
			
			$.ajax({
				type: "get",
				url: "cart/delete",
				dataType: "text",
				data: {"cartNum":cartNum},
				success:function(res){
					
					location.reload();
				}
			});		
		});
	});
	function cartlist() {
		var userNum = 1;
			
		var s="";
			
		$.ajax({
			type: "get",
			url: "cart/list",
			dataType: "json",
			data: {"userNum":userNum},
			success:function(res){
				
	 			$.each(res, function(i,elt) {
					
					s += "<div class='cart-object'>";
					s += "<div class='cart-check'>";
					s += "<input type='checkbox' cartNum='"+elt.num+"'>";
					s += "<a class='cart-check-delete' cartNum='"+elt.num+"'>";
					s += "<i class='fas fa-times'></i>";
					s += "</a>";
					s += "</div>";
					s += "<div class='cart-object-top'>";
					s += "<div class='cart-object-top-left'>";
					s += "<img src='"+elt.thumbnailImageUrl+"' class='cart-image'>";
					s += "<div>";
					s += "<b class='cart-brand'>"+elt.brand+"</b>";
					s += "<b class='cart-name'>"+elt.name+"</b>";
					s += "<b class='cart-option'>옵션</b>";
					s += "</div>";
					s += "</div>";
					s += "<div class='cart-object-top-right'>";
					s += "<div class='cart-change-button'>";
					s += "옵션/수량 변경";
					s += "</div>";
					s += "<div class='cart-wish-button'>";
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
					s += "<b>10000원</b>";
					s += "</div>";
					s += "</div>";
					s += "</div>";
					s += "</div>";
					
				});
				$("div.cart-result").html(s);
			}
		});
		/* $.ajax({
			type: "get",
			url: "user/friendCount",
			dataType: "json",
			data: {"userNum":userNum},
			success:function(res){
				
				$("span.friend-count").text(res);
			}
		}); */
	}
</script>
</head>
<body>
	<div class="cart-wrapper">
		<div class="cart-result">
		</div>
	</div>	
</body>
</html>