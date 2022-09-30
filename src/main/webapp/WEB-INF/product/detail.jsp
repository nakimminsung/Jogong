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
	
	<!-- bootstrap 5 icon -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/f7b2a5e0aa.js" crossorigin="anonymous"></script>

<style>

	span.star-prototype, span.star-prototype > * {
    height: 16px; 
    background: url(http://i.imgur.com/YsyS5y8.png) 0 -16px repeat-x;
    width: 80px;
    display: inline-block;
	}
 
	span.star-prototype > * {
    	background-position: 0 0;
    	max-width:80px; 
	}
	
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
	
	.detailRight{
		position: sticky;
		top:100px;
		height:100%; 
	}
	
	.detailContent{ 
		margin-left: 40px;
	}
	
	._delivery{
		display: inline;
	}
</style>
<script type="text/javascript">
$(function(){
	$.fn.generateStars = function() {
	    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
	};
	$('.star-prototype').generateStars();
	
	var price = $(".proPrice").val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
/* 	console.log(price); */
	$('._price').text(price+"원");
	
	
	var deliveryOption = $(".delivery").val();
	console.log(deliveryOption); 
	if(deliveryOption){
		$('._delivery').text(" 배송비미포함");
	}else{
		$('._delivery').text("배송비포함");
	}
	
});
	
</script>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<input type="hidden" class="proPrice" value=${dto.price }>
 	<input type="hidden" class="delivery" value=${dto.deliveryOption }>
	<div class="detailContainer">
		<div class="detailItem">
			<img src="${dto.thumbnailImageUrl }" width="400">
		</div>
		<div class="detailItem detailContent">
			<h3>${dto.name }</h3>
			<span class="star-prototype">${reviewAvg }</span>&nbsp;(${reviewCount } 건의 선물후기)
			<br><br>
			<h3 class="_price"></h3>
			<hr>
			<i class="fa-solid fa-truck"></i><p class='_delivery'></p>
			<p><i class="fa-solid fa-box"></i>&nbsp;도서산간 배송불가</p>
			<p><i class="fa-solid fa-magnifying-glass"></i>&nbsp;원산지 ${dto.country }</p>
		</div>
		<div class="detailItem detailRight">
			<p>sss</p>
		</div>
		<div class="detailItem">
			<img src="${dto.description }" style="width:100%;">
		</div>
	</div>
</body>
</html>