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
	
	<!-- bootstrap 5 icon -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <c:set var="root" value="<%=request.getContextPath() %>"/>
<style type="text/css">
	body * {
		font-size: 15px;
	}
	div.gift-background {
		background-color: #f0f0f0;
	}
	div.gift-wrapper{
		padding: 50px 0;
		display:flex;
		margin: 0 auto;
		max-width: 880px;
		min-height: 250px;
		flex-direction: column;
		justify-content: center;
		
	}
	div.gift-top{
		display:flex;
		justify-content: space-between;
	}
	img#gift-friend {
		width:130px;
		border-radius: 50px;
		border: 3px solid white;
		cursor: pointer;
	}
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
        position: relative;
        top: 0px;
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
</style>
<script>
	$(function(){
		$(".gift-friend-img").click(function(){
			list();
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
				$(".friend-length").text(fl);
				
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
		
		$(document).on("click","button.getWishlist",function(){
			if(fl == 0){
				location.href="${root}";
			} else if (fl == 1) {
				
				var wishNum = $("li.wish").attr("num");
				var wishName = $("li.wish").attr("name");
				var wishImg = $("img.wish").attr("src");
				var wl = "";
				
				$.ajax({
					type: "get",
					url: "wishlist/friend",
					dataType: "json",
					data: {"userNum":wishNum},
					success:function(res){
						
						modal.style.display = "none"
						
						$("body").attr("class","");
						$("h2.friendNum").text(wishName+"님을 위한");
						$("h2.friendText").text("선물하기");
						$("#gift-friend").attr("src",wishImg);
						
						wl += "<h4 style='margin-bottom:20px; margin-top:50px;'>"+wishName+"님의 위시리스트</h4>";
						
						wl += "<ul style='padding-left:0;'>";
						
						$.each(res, function(i,elt) {
							
							wl += "<li style='list-style:none; float:left; margin-right:20px;'>";
							wl += "<div>";
							wl += "<label>";
							wl += "<img src='"+elt.thumbnailImageUrl+"' style='width:150px; height:150px; display:block;'>";
							wl += "<b style='display:block;'>"+elt.brand+"</b>";
							wl += "<b style='text-overflow:ellipsis;overflow: hidden;white-space: nowrap;display: block;max-width: 150px;'>"+elt.name+"</b>";
							wl += "<b style='display:block;'>"+elt.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"</b>";
							wl += "</label>";
							wl += "</div>";
							wl += "</li>";
						});
						wl += "</ul>";
						$("div.gift-bottom").html(wl);
					}
				});
			}
		});
	});
		
	function list() {
		var userNum = 2;
			
		var s="";
			
		$.ajax({
			type: "get",
			url: "user/friendData",
			dataType: "json",
			data: {"userNum":userNum},
			success:function(res){
				
				s += "<ul style='padding-left:0;'>";
				
				$.each(res, function(i,elt) {
					
					s += "<li style='list-style:none; float:left;'>";
					s += "<div style='margin-right:50px;'>";
					s += "<input type='checkbox' style='margin-right:10px;' class='chkBox'>";
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
			url: "user/friendCount",
			dataType: "json",
			data: {"userNum":userNum},
			success:function(res){
				
				$("span.friend-count").text(res);
			}
		});
	}
</script>
</head>
<body>
	<div class="gift-background">
		<div class="gift-wrapper">
			<div class="gift-top">
				<div class="gift-left">
					<div>
						<h2 class="friendNum"></h2>
						<h2 class="friendText">누구를 위한 선물인가요?</h2>
					</div>
				</div>
				<div class="gift-right">
					<img id="gift-friend" class="gift-friend-img" src="${root }/image/default.png">
				</div>
			</div>
			<div class="gift-bottom"></div>
		</div>
	</div>
	<!-- modal -->
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
            	<div>나</div>
            	<div class="gift-modal-friend-list">
	            	<div class="gift-modal-select">
	            		<input type="checkbox" class="chkBox">
			            <img src="${root }/image/default.png" class="gift-friend-img"> 명국
	            	</div>
            	</div>
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
				<button type="button" class="btn btn-warning getWishlist">확인</button>
            </div>
            </form>
        </div>
    </div>
    <script>
        const modal = document.getElementById("gift-modal")
        const btnModal = document.getElementById("gift-friend")
		
        btnModal.addEventListener("click", e => {
		    modal.style.display = "flex"
		})
		
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
    </script>
</body>
</html>