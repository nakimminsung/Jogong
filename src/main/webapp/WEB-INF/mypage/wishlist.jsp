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
	a.menu-wish {
	    color:#000 !important;
	}
	body * {
		font-size: 15px;
	}
	div.wish-wrapper {
		width: 100%;
		margin-bottom: 100px;
	}
	div.wish-top {
		padding: 25px 0;
		position:sticky;
		top:100px;
		background-color: white;
		height: 90px;
	}
	div.wish-top>hr{
		width: 110px; 
		height: 10px; 
		position: relative; 
		top:-28px; 
		color: #cff0cc; 
		opacity: 1; 
		z-index: -1;
	}
	b.wish-top-b2 {
		font-size: 25px;
		font-weight: 1000;
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
	b.wish-product-name {
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
	div.lock-open {
		background-color : #cff0cc;
	}
	div.lock {
		background-color : white;
		border : 1px solid #cff0cc;
	}
</style>
<script>
	$(function(){
		
		wishlist();
		
		// 위시리스트 삭제
		$(document).on("click",".wish-option",function(){
			
			let wishOption = $(this).attr("wishOption");
			
			let userNum = ${sessionScope.loginid};
			let productNum = $(this).attr("productNum");
			let publicOption = 1;
			
			if(wishOption != 0){
				
				let num = $(this).attr("num");
				
				$.ajax({
					type: "get",
					url: "../wishlist/delete",
					dataType: "text",
					data: {"num":num},
					success:function(res){

					}
				});
				$(this).attr({
					"class":"far fa-heart wish-option",
					"wishOption":"0"}).css("color","#d0d0d0");	

			} else if(wishOption == 0){	
				
				$.ajax({
					type: "post",
					url: "../wishlist/cart_insert",
					dataType: "text",
					data: {
						"userNum":userNum,
						"productNum":productNum,
						"publicOption":publicOption
						},
					success:function(res){

					}
				});
				
				$(this).attr({
					"class":"fas fa-heart wish-option",
					"wishOption":"1"}).css("color","red");				
			}
		});
		// 위시리스트 공개설정
		$(document).on("click",".wish-public-button",function(){
			
			let publicOption = $(this).attr("publicOption");
			let num = $(this).attr("num");
			
			if(publicOption != 0){
				
				$.ajax({
					type: "get",
					url: "../wishlist/update",
					dataType: "text",
					data: {"num":num,"publicOption":0},
					success:function(res){

					}
				});
				
				$(this).find("i").attr("class","fas fa-lock");
				$(this).find("b").text("비밀");
				$(this).attr("publicOption","0");
				$(this).attr("class","wish-public-button lock-open").css({"background-color":"#ffffff","border":"1px solid #cff0cc"});
			
			} else {	
				
				$.ajax({
					type: "get",
					url: "../wishlist/update",
					dataType: "text",
					data: {"num":num,"publicOption":1},
					success:function(res){

					}
				});
				
			 	$(this).find("i").attr("class","fas fa-lock-open");				
				$(this).find("b").text("공개");				
				$(this).attr("publicOption","1");
				$(this).attr("class","wish-public-button lock").css("background-color","#cff0cc");
			}
		});
	});
	// wishlist 호출 함수
	function wishlist() {
		let userNum = ${sessionScope.loginid};
			
		let s="";
			
		$.ajax({
			type: "get",
			url: "../wishlist/list",
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
	 				s += "<b class='wish-product-name'>"+elt.name+"</b>";
	 				s += "<b>"+elt.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원</b>";
	 				s += "</div>";
	 				s += "<div class='wish-object-left-right-bottom'>";
	 				if(elt.publicOption) {
		 				s += "<div class='wish-public-button lock-open' publicOption='"+elt.publicOption+"' num='"+elt.num+"'>";
	 					s += "<i class='fas fa-lock-open wish-public-option'></i>";	 					
		 				s += "&nbsp;";
		 				s += "<b>공개</b>";
		 				s += "</div>";
	 				} else {
		 				s += "<div class='wish-public-button lock' style='white' publicOption='"+elt.publicOption+"' num='"+elt.num+"'>";
	 					s += "<i class='fas fa-lock wish-public-option'></i>";
		 				s += "&nbsp;";
		 				s += "<b>비밀</b>";
		 				s += "</div>";
	 				}
	 				s += "</div>";
	 				s += "</div>";
	 				s += "</div>";
	 				s += "<div class='wish-object-right'>";
	 				s += "<i class='fas fa-heart wish-option' wishOption=1 productNum='"+elt.productNum+"' num='"+elt.num+"'></i>";
	 				s += "</div>";
	 				s += "</div>";
	 				s += "</div>";
					
				});
				$("div.wish-result").html(s);
			}
		});
	}
</script>
<body>
	<div class="wish-wrapper">
		<div class="wish-top">
			<b class="wish-top-b2">위시리스트</b>
			<hr>
		</div>
		<div class="wish-result"></div>
	</div>	
</body>
</html>