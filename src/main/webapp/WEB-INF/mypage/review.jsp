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
    
</head>
<style>
	a.menu-review {
    	color:#000 !important;
	}
	div.review-wrapper {
		width: 100%;
		margin-bottom: 100px;
	}
	div.review-title>span {
		font-size: 25px;
		font-weight: 1000;
	}
	div.review-title>hr{
		width: 87px; 
		height: 10px; 
		position: relative; 
		top:-28px; 
		color: #cff0cc; 
		opacity: 1; 
		z-index: -1;
	}
	div.review-menu {
		margin:0 auto; 
		width: 80%; 
		background-color: #f0f0f0; 
		display: flex; 
		justify-content: center;
		height: 40px;
		border-top: 1px solid lightgray;
		border-bottom: 1px solid lightgray;
		margin-bottom: 20px;

	}
	div.review-menu span {
		font-size: 16px;
		color: #808080;
	}
	div.review-menu>div {
		cursor: pointer; 
		width: 50%; 
		display: flex; 
		justify-content: center; 
		align-items: center;
	}
	div.review-top-fix{
		position:sticky; 
		height: 85px; 
		top:100px; 
		background-color: white; 
		padding: 25px 0;
	}
	div.review-menu>span{
		display: flex; 
		align-items: center; 
		color:#d0d0d0; 
		font-size: 15px; 
	}
	div.review-object {
		margin-bottom: 20px; 
		padding:10px;
	}
	div.review-top {
		display: flex; 
		flex-direction: row; 
		margin-bottom: 10px;
	}
	div.review-product-image>img{
		background-color: lightgray; 
		width: 86px; 
		height: 86px; 
		margin: 0;
	}
	div.review-product-info {
		display: flex; 
		justify-content: space-between; 
		flex-direction: column; 
		margin-left: 10px;
	}
	span.review-product-content-span1 {
		display: block; 
		font-size: 13px; 
		color:#909090; 
		margin-bottom: 5px;
	}
	div.review-product-date>span{
		font-size: 13px; 
		color:#909090;
	}
	div.review-button {
		border:1px solid #d0d0d0; 
		cursor: pointer; 
		height: 40px; 
		display: flex; 
		align-items: center; 
		justify-content: center;
	}
	div.review-button>span {
		color:#808080; 
		font-size: 13px;
	}
	div.review-show-left{
		display:flex;
		flex-direction:column;
	}
	div.review-show-left>img{
		width:200px; 
		height:200px;
	}
	span.review-subject{
		font-size:20px; 
		margin:10px 0;
	}
	div.review-show-right {
		padding:10px;
	}
	div.review-show-right span{
		color:#808080;
		font-size: 13px;
	}
</style>
<script>
	$(function(){
		// 페이지 접속시 작성가능한 후기 함수 호출
		writtenReviewList()
		
		// 리뷰보기 버튼 이벤트
		$(document).on("click",".review-show",function(){
			$(this).siblings(".review-show").slideToggle().css("display","flex");
			$(this).attr("class","review-button review-hide");
			$(this).text("리뷰닫기").css({"color":"#808080","font-size":"13px"});
		});
		// 리뷰닫기 버튼 이벤트
		$(document).on("click",".review-hide",function(){
			$(this).siblings(".review-show").slideToggle().css("display","flex");
			$(this).attr("class","review-button review-show");
			$(this).text("작성한 리뷰 보기").css({"color":"#808080","font-size":"13px"});
		});
		
		// 작성한 후기 갯수
		$(document).ready(function(){
			let userNum = ${sessionScope.loginid};
				
			$.ajax({
				type: "get",
				url: "../review/myCount",
				dataType: "json",
				data: {"userNum":userNum},
				success:function(res){
		
					$("span.review-menu-count").text("("+res+")");
				}
			});
		});
	});
	// 작성 가능한 후기
	function reviewList(){
		let userNum = ${sessionScope.loginid};
		
		let s="";
			
		$.ajax({
			type: "get",
			url: "../review/writtenReview",
			dataType: "json",
			data: {"userNum":userNum},
			success:function(res){
				
	 			$.each(res, function(i,elt) {
				
	 				s += "<div class='review-object'>";
	 				s += "<div class='review-top'>";
	 				s += "<div class='review-product-image'>";
	 				s += "<img src='"+elt.thumbnailImageUrl+"'>";
	 				s += "</div>";
	 				s += "<div class='review-product-info'>";
	 				s += "<div class='review-product-content'>";
	 				s += "<span class='review-product-content-span1'>"+elt.brand+"</span>";
	 				s += "<span>"+elt.name+"</span>";
	 				s += "</div>";
	 				s += "<div class='review-product-date'>";
	 				s += "<span>"+elt.createdAt+"</span>";
	 				s += "</div>";
	 				s += "</div>";
	 				s += "</div>";
	 				s += "<div class='review-button'>";
	 				s += "<span>선물 후기 작성</span>";
	 				s += "</div>";
	 				s += "</div>";
					
				});
				$("div.review-result").html(s);
			}
		});
	}
	// 작성한 후기
	function writtenReviewList(){
		let userNum = ${sessionScope.loginid};
		
		let s="";
			
		$.ajax({
			type: "get",
			url: "../review/writtenReview",
			dataType: "json",
			data: {"userNum":userNum},
			success:function(res){
				
	 			$.each(res, function(i,elt) {
				
	 				s += "<div class='review-object'>";
	 				s += "<div class='review-top'>";
	 				s += "<div class='review-product-image'>";
	 				s += "<img src='"+elt.thumbnailImageUrl+"'>";
	 				s += "</div>";
	 				s += "<div class='review-product-info'>";
	 				s += "<div class='review-product-content'>";
	 				s += "<span class='review-product-content-span1'>"+elt.brand+"</span>";
	 				s += "<span>"+elt.name+"</span>";
	 				s += "</div>";
	 				s += "<div class='review-product-date'>";
	 				s += "<span>"+new Date(+elt.createdAt + 3240 * 10000).toISOString().replace("T", " ").replace(/\..*/, '')+"</span>";
	 				s += "</div>";
	 				s += "</div>";
	 				s += "</div>";
	 				s += "<div class='review-show' style='display:none; justify-content:space-between; border-top:1px solid #f0f0f0; margin-bottom:10px;'>";
	 				s += "<div class='review-show-left'>";
	 				s += "<img src='"+elt.reviewImageUrl+"'>";
	 				s += "<span class='review-subject'>"+elt.subject+"</span>";
	 				s += "<span>"+elt.content+"</span>";
	 				s += "</div>";
	 				s += "<div class='review-show-right'>";
	 				s += "<span>"+new Date(+elt.createdAt + 3240 * 10000).toISOString().replace("T", " ").replace(/\..*/, '')+"</span>";
	 				s += "</div>";
	 				s += "</div>";
	 				s += "<div class='review-button review-show'>";
	 				s += "<span>작성한 리뷰 보기</span>";
	 				s += "</div>";
	 				s += "</div>";
					
				});
				$("div.review-result").html(s);
			}
		});
	}
</script>
<body>
	<div class="review-wrapper">
		<div class="review-top-fix">
			<div class="review-title">
				<span>선물후기</span>
				<hr>
			</div>
		</div>
			<div class="review-menu">
				<div class="review-before">
					<span>작성 가능한 후기</span>
				</div>
				<span>|</span>
				<div class="review-after">
					<span>작성한 후기</span>
					<span class="review-menu-count"></span>
				</div>
			</div>
		<div class="review-result">
		</div>
	</div>	
</body>
</html>