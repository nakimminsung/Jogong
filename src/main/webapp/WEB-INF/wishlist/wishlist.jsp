<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	@font-face {
	    font-family: 'SeoulNamsanM';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulNamsanM.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	body * {
		 font-family: 'SeoulNamsanM';
		 word-spacing: -1px;
	}
	
	div.wish-wrapper {
		padding-bottom: 80px;
	}
	
	.wish-title{
		font-size: 27px;
		font-weight: 1000;
	}
	span.wish-subtitle {
		font-size: 20px;
		color: #808080;
		position: relative;
		top: -30px;
	}
	div.wish-top>hr{
		width: 250px; 
		height: 10px; 
		position: relative; 
		top:-28px; 
		color: #cff0cc; 
		opacity: 1; 
		z-index: -1;
	}
	div.wish-content {
		margin-bottom: 10px;
	}
	div.wish-object {
		width:100%;
		display: flex; 
		flex-direction: row; 
		border: 1px solid #d0d0d0; 
		padding: 10px;
	}
	div.wish-object-left {
		width: 95%; 
		display: flex; 
		flex-direction: row;
		margin-right: 20px;
	}
	.wish-object-left-left>img{
		width:120px; 
		height:120px;
		margin: 0;
	}
	div.wish-object-left-right {
		width:100%; 
		display: flex; 
		flex-direction: column; 
		justify-content: space-between; 
		padding-left: 10px;
	}
	div.wish-object-left-right-top {
		display: flex; 
		flex-direction: column;
	}
	a.wish-product-name {
		font-size: 17px; 
		margin-bottom: 5px;
	}
	div.wish-public-button {
		width:60px; 
		height: 25px; 
		display:flex; 
		flex-direction:row; 
		justify-content:center; 
		cursor: pointer; 
		background-color: #cff0cc; 
		margin-bottom: 5px; 
		display: flex; 
		align-items: center; 
		border-radius: 5px;
	}
	div.wish-public-button>i{
		font-size: 12px;	
	}
	div.wish-public-button>b{
		font-size: 12px;	
	}
	div.wish-object-right {
		width: 5%; 
		padding: 5px 10px; 
		display: flex; 
		justify-content: flex-end;
	}
	div.wish-object-right>i{
		height:10px; 
		font-size:24px; 
		color:red; 
		cursor: pointer;
	}
	div.wish-result {
		margin-top: 30px;
		min-width: 700px;
	}
</style>
</head>
<body>
	<div class="wish-wrapper" style="display: flex; flex-direction: column; align-items: center; max-width: 1180px; margin: 0 auto; min-height: 1000px;">
		<input type="hidden" name="num" value="${userNum}" />
		<input type="hidden" name="count" value="${count}" />
		<div class="wish-top" style="display: flex; flex-direction: column; justify-content: center; align-items: center; width: 100%; margin-top: 30px;">
			<span class="wish-title"></span>
			<hr>
			<span class="wish-subtitle">소중한 분께 감동을 드리세요</span>
		</div>
		<div class="wish-result"></div>
	</div>
</body>
<script>
	userInfo($("input[name=num]").val())

	if($("input[name=count]").val()==0) {
		$("div.wish-result").text("선물 가능한 상품이 없어요").css({"font-size":"25px","text-align":"center","margin-top":"200px","color":"#a0a0a0"});
	} else {
		wishlist($("input[name=num]").val())
	}
	function userInfo(userNum) {
		$.ajax({
			type: "get",
			url: "../user/data",
			dataType: "json",
			data: {"userNum":userNum},
			success:function(res){
				console.log(res);
				$(".wish-title").text(res.nickname+"님의 위시리스트");
			}
		});
	}
		
	function wishlist(userNum) {
			
		let s=""
				
		$.ajax({
			type: "get",
			url: "../wishlist/publicList",
			dataType: "json",
			data: {"userNum":userNum},
			success:function(res){
		
		 		$.each(res, function(i,elt) {
					
		 			s += "<div class='wish-content'>";
		 			s += "<div class='wish-object'>";
		 			s += "<div class='wish-object-left'>";
		 			s += "<div class='wish-object-left-left'>";
		 			s += "<img src='"+elt.thumbnailImageUrl+"'>";
		 			s += "</div>";
		 			s += "<div class='wish-object-left-right'>";
		 			s += "<div class='wish-object-left-right-top'>";
		 			s += "<a href='../product/detail?num="+elt.productNum+"' class='wish-product-name'>"+elt.name+"</a>";
		 			s += "<b>"+elt.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원</b>";
		 			s += "</div>";
		 			s += "<div class='wish-object-left-right-bottom'>";
		 			s += "</div>";
		 			s += "</div>";
		 			s += "</div>";
		 			s += "</div>";
		 			s += "</div>";
						
				});
				$("div.wish-result").html(s);
			}
		});
	}
</script>
</html> 