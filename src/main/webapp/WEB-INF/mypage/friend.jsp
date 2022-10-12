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
	a.menu-friend {
    	color:#000 !important;
	}
	div.friend-wrapper {
		min-height: 600px;
	}
	div.friend-top {
		padding: 25px 0;
		position:sticky;
		top:100px;
		background-color: white;
		height: 90px;
		z-index: 10;
	}
	div.friend-top>hr{
		width: 90px; 
		height: 10px; 
		position: relative; 
		top:-28px; 
		color: #cff0cc; 
		opacity: 1; 
		z-index: -1;
	}
	b.friend-top-b2 {
		font-size: 25px;
		font-weight: 1000;
	}
	div.friend-menu {
		margin:0 auto; 
		width: 80%; 
		background-color: #fafafa; 
		display: flex; 
		justify-content: center;
		height: 40px;
		border-top: 1px solid #f0f0f0;
		border-bottom: 1px solid #f0f0f0;
		margin-bottom: 20px;

	}
	div.friend-menu span {
		font-size: 16px;
		color: #808080;
		height: 35px;
		position: relative;
		top: 3px;
	}
	div.friend-menu>div {
		cursor: pointer; 
		width: 50%; 
		display: flex; 
		justify-content: center; 
		align-items: center;
	}
	div.friend-menu>span{
		display: flex; 
		align-items: center; 
		color:#d0d0d0; 
		font-size: 15px; 
	}
</style>
<script>
	$(function(){
		
		// 친구목록 함수 실행
		//let data = {userNum:$("input[name=userNum]").attr("value"),search:""};
		//list(data);
		
		// 친구목록
		$(document).on("click",".friend-after",function(){
			$(this).find("span").css({"color":"#000","border-bottom":"3px solid #000"});
			$(this).siblings().find("span").css({"color":"#808080","border-bottom":"0px solid #000"});
			//reviewList()
		});
		
		// 친구요청목록
		$(document).on("click",".friend-before",function(){
			$(this).find("span").css({"color":"#000","border-bottom":"3px solid #000"});
			$(this).siblings().find("span").css({"color":"#808080","border-bottom":"0px solid #000"});
			//writtenReviewList()
		});
		
		// 친구 검색
		$("#friend-search").on('keyup keypress',function(){
			let data = {userNum:$("input[name=userNum]").attr("value"),search:$(this).val().trim()};
			list(data);
		});
	});
	function friendList() {
		let s="";
		
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
					s += "<input type='radio' style='margin-right:10px;' class='chkBox' name='radio'>";
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
			url: "user/friendCount",
			dataType: "json",
			data: {"userNum":$("input[name=userNum]").attr("value")},
			success:function(res){
				
				$("span.friend-after-count").text(res);
			}
		});
		
		// 요청 친구인원수
		$.ajax({
			type: "get",
			url: "user/friendCount",
			dataType: "json",
			data: {"userNum":$("input[name=userNum]").attr("value")},
			success:function(res){
				
				$("span.friend-before-count").text(res);
			}
		});
	}
</script>
<body>
	<div class="friend-wrapper">
		<div class="friend-top">
			<b class="friend-top-b2">친구목록</b>
			<hr>
		</div>
		<div class="friend-menu">
			<div class="friend-after">
				<span style="color:#000; border-bottom: 3px solid #000;">내 친구</span>
				<span class="friend-after-count"></span>
			</div>
			<span>|</span>
			<div class="friend-before">
				<span>친구 요청 목록</span>
				<span class="friend-before-count"></span>
			</div>
		</div>
	</div>	
</body>
</html>