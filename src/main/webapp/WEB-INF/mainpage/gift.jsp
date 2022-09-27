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
    
<style type="text/css">
	body * {
		font-size: 15px;
	}
	div.gift-background {
		background-color: #f0f0f0;
	}
	div.gift-wrapper{
		display:flex;
		justify-content: space-between;
		align-items:center;
		margin: 0 auto;
		max-width: 880px;
		min-height: 250px;
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
    div.gift-modal-select {
    	display: flex;
    	align-items: center;
    }
    div.gift-modal-select>input{
		margin-right: 10px;
    }
    div.gift-modal-select>img{
		margin-right: 10px;
    }
    div.gift-modal-search {
    	margin-top: 20px;
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
    div{
    	border:solid gray 0px;
    }
</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<div class="gift-background">
		<div class="gift-wrapper">
			<div class="gift-left">
				<h2>누구를 위한 선물인가요?</h2>
			</div>
			<div class="gift-right">
				<img id="gift-friend" class="gift-friend-img" src="${root }/image/default.png">
			</div>
		</div>
	</div>
    <div id="gift-modal" class="gift-modal-overlay">
        <div class="gift-modal-window">
        	<div class="gift-modal-top">
	            <div class="gift-title">
	            	<div>
		                <h5>친구 선택 0</h5>
	            	</div>
	            	<div class="gift-close-area">X</div>
	            </div>
	            <div style="margin-top: 10px;">
	            	<img src="${root }/image/default.png" class="gift-friend-img">
	            	선물할 친구를 선택하세요.
	            </div>
	            <div class="gift-modal-search">
	            	<input class="form-control" type="search" placeholder="이름, 닉네임 검색">
	            	<img src="${root}/image/search.svg">
	            </div>
        	</div>
            <div class="gift-modal-top">
            	<div>나</div>
            	<div class="gift-modal-select">
            		<input type="checkbox" class="form-check-input">
		            <img src="${root }/image/default.png" class="gift-friend-img"> 명국
            	</div>
            	<div style="margin-top: 10px;">
            		친구목록 64
            	</div>
            	<div>
            		<div class="gift-modal-select">
            			<input type="checkbox" class="form-check-input">
		            	<img src="${root }/image/default.png" class="gift-friend-img"> 병찬
            		</div>
            		<div class="gift-modal-select">
            			<input type="checkbox" class="form-check-input">
		            	<img src="${root }/image/default.png" class="gift-friend-img"> 선혜
            		</div>
            		<div class="gift-modal-select">
            			<input type="checkbox" class="form-check-input">
		            	<img src="${root }/image/default.png" class="gift-friend-img"> 민성
            		</div>
            		<div class="gift-modal-select">
            			<input type="checkbox" class="form-check-input">
		            	<img src="${root }/image/default.png" class="gift-friend-img"> 종환
            		</div>
            		<div class="gift-modal-select">
            			<input type="checkbox" class="form-check-input">
		            	<img src="${root }/image/default.png" class="gift-friend-img"> 성민
            		</div>
            	</div>
            </div>
            <div class="gift-modal-button">
				<button type="button" class="btn btn-secondary btn-calcel" onclick="location.href='${root}'">취소</button>
				<div></div>
				<button type="button" class="btn btn-warning">확인</button>
            </div>
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
    </script>
</body>
</html>