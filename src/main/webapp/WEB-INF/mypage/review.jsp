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
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>
    
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
		background-color: #fafafa; 
		display: flex; 
		justify-content: center;
		height: 40px;
		border-top: 1px solid #f0f0f0;
		border-bottom: 1px solid #f0f0f0;
		margin-bottom: 20px;

	}
	div.review-menu span {
		font-size: 16px;
		color: #808080;
		height: 35px;
		position: relative;
		top: 3px;
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
		z-index: 2;
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
	div.review-content {
		padding: 20px 0;
		width: 100%;
	}
	div.review-content-left{
		display:flex;
		justify-content: space-between;
		min-height: 150px;
		width: 100%;
	}
	div.review-content-left-content{
		display:flex;
		flex-direction:column;
		padding-right: 10px;
		justify-content: space-between;
	}
	div.review-content-left-image>a>img{
		width:100px; 
		height:100px;
		position: relative;
		top: 35px;
	}
	div.review-content-left-image{
		margin-left: 20px;
	}
	span.review-subject{
		font-size:20px; 
		margin:10px 0;
	}
	div.review-content-right {
		padding: 0 10px;
		display: flex;
		flex-direction: column;
		align-items: flex-end;
		width: 40%;
	}
	div.review-content-right span{
		color:#808080;
		font-size: 13px;
	}
	.checked {
	    color: orange;
	}
	/* textarea 포커싱 효과 제거 */
	input:focus {
    outline: none;
	}
	textarea:focus {
	    outline: none;
	}
	div.review-form {
		display:none; 
		flex-direction: column; 
		padding-top: 20px;
	}
	div.review-update-form {
		display:none; 
		flex-direction: column; 
		padding-top: 20px;
	}
	div.review-object {
		margin-bottom: 30px; 
		border-bottom: 1px solid #f0f0f0;
	}
	div.form-rating {
		display: flex; 
		flex-direction: column; 
		justify-content: center; 
		align-items: center; 
		border-bottom: 1px solid #f0f0f0; 
		padding-bottom: 30px;
	}
	div.form-rating>span {
		font-size: 20px;
		font-weight: 1000;
	}
	div.make_star {
		margin-top: 20px; 
		margin-bottom: 10px;
	}
	div.rating i {
		font-size: 30px;
	}
	i.fa-quote-left, i.fa-quote-right{
		font-size: 50px; 
		position: relative; 
		top: 10px; 
		color: #cff0cc; 
		font-weight: 1000;
	}
	span.rating-message {
		font-size: 30px; 
		margin-bottom: 20px; 
		margin-right: 10px; 
		margin-left: 10px;
	}
	div.form-review {
		border-bottom: 1px solid #f0f0f0; 
		padding-bottom: 20px; 
		margin-top: 20px;
	}
	span.form-review-title {
		display: block; 
		font-size: 20px; 
		font-weight: 1000;
	}
	label.lab_tbx {
		visibility: visible; 
		line-height: 21px; 
		padding: 9px 12px 8px; 
		width: 777px; 
		position: relative; 
		top: 70px; 
		left:10px;
	}
	label.lab_tbx>span {
		font-size: 12px; 
		color: #a0a0a0;
	}
	textarea#tf_review {
		height: 185px; 
		width: 100%; 
		border: 0px; 
		background-color: #f0f0f0; 
		padding: 10px;
	}
	div.form-photo-button {
		display: flex; 
		justify-content: center; 
		cursor:pointer; 
		align-items:center; 
		border: 1px solid #f0f0f0; 
		width: 100%; 
		height:40px;
	}
	div.form-photo-button>i {
		font-size: 15px; 
		color: #a0a0a0; 
		margin-right: 10px;
	}
	div.form-photo-button>span {
		font-size: 15px; 
		color: #a0a0a0;
	}
	i.fa-question-circle {
		font-size: 11px; 
		color: #a0a0a0;
	}
	span.review-term {
		font-size: 11px; 
		color: #a0a0a0;
	}
	div.form-tag {
		padding-top: 20px; 
		border-bottom: 1px solid #f0f0f0; 
		padding-bottom: 20px;
	}
	span.review-tag-title {
		display: block; 
		font-size: 20px; 
		font-weight: 1000; 
		margin-bottom: 20px;
	}
	span.review-tag-info {
		font-size: 15px; 
		color: #a0a0a0;
	}
	div.review-tag {
		display: flex; 
		flex-direction: row; 
		margin-top: 10px;
	}
	div.review-tag-obejct {
		width:50px; height: 25px; 
		border-radius: 10px; 
		display: flex; 
		justify-content: center; 
		align-items: center; 
		margin: 0 3px; 
		cursor: pointer;
	}
	div.review-tag-obejct>span {
		font-size: 13px; 
		font-weight: 1000;
	}
	div.form-option {
		padding-top: 20px; 
		border-bottom: 1px solid #f0f0f0; 
		padding-bottom: 20px;
	}
	span.review-option-title {
		display: block; 
		font-size: 20px; 
		margin-bottom: 10px; 
		font-weight: 1000;
	}
	div.review-option-select {
		display: flex; 
		flex-direction: row; 
		width: 100%; 
		margin-top: 20px;
	}
	div.review-option-object {
		width: 50%;
	}
	div.review-option-object img {
		width: 50px; 
		height: 50px; 
		border:0px; 
		border-radius: 15px; 
		background-color: #ffeeaa;
	}
	div.reivew-option-info {
		width: 100%; 
		height: 110px; 
		background-color: #f0f0f0; 
		margin-top: 30px; 
		padding: 10px;
	}
	div.form-button {
		margin-top: 20px; 
		display: flex; 
		flex-direction: row; 
		justify-content: space-between;
	}
	button.review-button{
		width: 49%; 
		height: 50px; 
		font-weight: 1000;
	}
	button.review-insert{
		background-color: #cff0cc;
	}
	button.review-update-btn{
		background-color: #cff0cc;
	}
	span.review-term2 {
		font-size: 13px; 
		color: #a0a0a0;
	}
	
	div.lb-outerContainer {
		width:500px;
	}
	
	/* 리뷰 업데이트 모달 */
	#review-modal.review-modal-overlay {
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
    #review-modal .review-modal-window {
        background: #fff;
        box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
        backdrop-filter: blur( 13.5px );
        -webkit-backdrop-filter: blur( 13.5px );
        border-radius: 10px;
        border: 1px solid rgba( 255, 255, 255, 0.18 );
        width: 400px;
        height: 300px;
   		position: absolute;
        top: 200px;
        padding: 20px;
    }
    .modal-fix {
	  position: fixed;
	  width :100%;
	  height: 100%;
	  overflow: scroll;
	}
</style>
<script>
	$(function(){
		// 페이지 접속시 작성가능한 후기 함수 호출
		reviewList()
		
		// 리뷰보기 버튼 이벤트
		$(document).on("click",".review-show",function(){
			$(this).siblings(".review-content").slideToggle().css("display","flex");
			$(this).attr("class","review-button review-hide");
			$(this).text("리뷰닫기").css({"color":"#808080","font-size":"13px"});
			
			// 작성된 리뷰의 별점 표시
			var rating2 = $(".rating2");
			
			rating2.each(function(){
				var targetScore = $(this).attr("data-rate");
				$(this).find("i:nth-child(-n+"+targetScore+")").css("color","#fbea4e");
			});
		});
		
		// 리뷰닫기 버튼 이벤트
		$(document).on("click",".review-hide",function(){
			$(this).siblings(".review-content").slideToggle().css("display","flex");
			$(this).attr("class","review-button review-show");
			$(this).text("작성한 리뷰 보기").css({"color":"#808080","font-size":"13px"});
		});
		
		// 작성 가능한 후기 버튼 이벤트
		$(document).on("click",".review-before",function(){
			$(this).find("span").css({"color":"#000","border-bottom":"3px solid #000"});
			$(this).siblings().find("span").css({"color":"#808080","border-bottom":"0px solid #000"});
			reviewList()
		});
		
		// 작성한 후기 버튼 이벤트
		$(document).on("click",".review-after",function(){
			$(this).find("span").css({"color":"#000","border-bottom":"3px solid #000"});
			$(this).siblings().find("span").css({"color":"#808080","border-bottom":"0px solid #000"});
			writtenReviewList()
		});
		
		// 리뷰작성 버튼 이벤트
		$(document).on("click",".review-write",function(){
			
			$(".review-top-fix").css("display","none");
			$(".review-menu").css("display","none");
			$(".review-result").css("display","none");
			
			$(".review-form").css("display","flex");
			
			let num = $(this).attr("productNum");
			$("input[name=productNum]").attr("value",num);
			
			let s = "";
			
			$.ajax({
				type: "get",
				url: "../product/select",
				dataType: "json",
				data: {"num":num},
				success:function(res){
					
					s += "<div class='review-object'>";
					s += "<div class='review-top'>";
					s += "<div class='review-product-image'>";
					s += "<img src='"+res.thumbnailImageUrl+"'>";
					s += "</div>";
					s += "<div class='review-product-info'>";
					s += "<div class='review-product-content'>";
					s += "<span class='review-product-content-span1'>"+res.brand+"</span>";
					s += "<a href='../product/detail?num="+res.num+"'>"+res.name+"</a>";
					s += "</div>";
					s += "</div>";
					s += "</div>";
					s += "</div>";
					
					$("div.form-product-info").html(s);
				}
			});
		});
		
		// 리뷰수정 버튼 이벤트
		$(document).on("click",".review-update-button",function(){
			
			$(".review-top-fix").css("display","none");
			$(".review-menu").css("display","none");
			$(".review-result").css("display","none");
			
			$(".review-update-form").css("display","flex");
			
			let productNum = $(this).attr("productNum");
			let reviewNum = $(this).attr("reviewNum");
			$("input[name=num]").attr("value",reviewNum);
			
			// 기존 리뷰 정보 출력
			$.ajax({
				type: "get",
				url: "../review/selectOne",
				dataType: "json",
				data: {"num":reviewNum},
				success:function(res){
					
					$("input[name=subject]").val(res.subject);
					$("textarea[name=content]").val(res.content);
					$("div.review-tag-obejct[tagNum="+res.tagNum+"]").css("border","3px solid lightgray");
					$("input[name=tagNum]").attr("value",res.tagNum);
					$("div.rating").attr("data-rate",res.rating);
					$("input[name=rating]").attr("value",res.rating);
					
					if(res.publicOption) {
						$("input.review-update-option[name=publicOption][value='1']").attr("checked","checked");
					} else {
						$("input.review-update-option[name=publicOption][value='0']").attr("checked","checked");
					}
					
					// 작성된 리뷰의 별점 표시
					var rating = $(".rating");
					
					rating.each(function(){
						var targetScore = $(this).attr("data-rate");
						$(this).find("i:nth-child(-n+"+targetScore+")").css("color","#fbea4e");
					});
				}
			});
			
			// 페이지 상단 상품정보 출력
			let s = "";
			
			$.ajax({
				type: "get",
				url: "../product/select",
				dataType: "json",
				data: {"num":productNum},
				success:function(res){
					
					s += "<div class='review-object'>";
					s += "<div class='review-top'>";
					s += "<div class='review-product-image'>";
					s += "<img src='"+res.thumbnailImageUrl+"'>";
					s += "</div>";
					s += "<div class='review-product-info'>";
					s += "<div class='review-product-content'>";
					s += "<span class='review-product-content-span1'>"+res.brand+"</span>";
					s += "<a href='../product/detail?num="+res.num+"'>"+res.name+"</a>";
					s += "</div>";
					s += "</div>";
					s += "</div>";
					s += "</div>";
					
					$("div.form-product-info").html(s);
				}
			});
			
			
		});
		
		// 취소버튼 이벤트
		$(".review-cancel").click(function(){
			$(".review-top-fix").css("display","block");
			$(".review-menu").css("display","flex");
			$(".review-result").css("display","block");
			
			$(".review-form").css("display","none");
		});
		
		$(document).ready(function(){
			
			// 작성한 후기 갯수
			reviewCount()
			
			// 태그 정보 불러오기
			tagList()
			
			// lightbox2 설정
			lightbox.option({
			    resizeDuration: 100,       // 리사이징 애니매이션 시간(밀리초, milliseconds). default:700
			    wrapAround: true,         // 페이징 순환 여부. default:false
			    disableScrolling: false,   // 스크롤 활성 여부 default:false
			    fitImagesInViewport:false, // viewport에 호응하여 사이즈 조절. default:true
			    maxWidth:500               // 최대 너비(픽셀, pixels). default:NULL
			});
		});
		
		// 마우스오버시 별점 설정
		$(document).on("mouseover",".make_star i",function(){
			let targetNum = $(this).index()+1;
			$("input[name=rating]").attr("value",targetNum);
			$('.make_star i').css({"color":"#000"});
			$('.make_star i:nth-child(-n+'+targetNum+')').css({"color":"#fbea4e"});
			
			let ratingMessage = [
				"매우 아쉬워요",
				"아쉬워요",
				"보통이에요",
				"만족해요",
				"아주 만족해요"
			];
			
			$(".rating-message").text(ratingMessage[targetNum-1]);
		});
		
/* 		// 클릭시 별점 설정
		$(document).on("click",".make_star i",function(){
			let targetNum = $(this).index()+1;
			$("input[name=rating]").attr("value",targetNum);
			$('.make_star i').css({"color":"#000"});
			$('.make_star i:nth-child(-n+'+targetNum+')').css({"color":"#fbea4e"});
			
			let ratingMessage = [
				"매우 아쉬워요",
				"아쉬워요",
				"보통이에요",
				"만족해요",
				"아주 만족해요"
			];
			
			$(".rating-message").text(ratingMessage[targetNum-1]);
		}); */
		
		// 리뷰 작성 박스 클릭시 라벨 제거
		$(document).on("click","#tf_review",function(){
			$(this).siblings(".lab_tbx").css("visibility","hidden");
		});
		
		// 태그 선택시 이벤트
		$(document).on("click",".review-tag-select",function(){
			
			let tagNum = $(this).attr("tagNum");
			$("input[name=tagNum]").attr("value",tagNum);
			
			$(this).css("border","3px solid lightgray");
			$(this).siblings(".review-tag-select").css("border","0px solid lightgray");
		});
		
		// 사진첨부 실행
		$(".form-photo-button").click(function(){
			$("input[name=upload]").trigger("click");
		});
		
		// 리뷰 삭제
		$(document).on("click","span.review-delete",function(){
			
			let ans = confirm("리뷰를 삭제하시겠습니까?");
			let num = $(this).attr("reviewNum");
			
			if(ans) {
				
				$.ajax({
					type: "get",
					url: "../review/delete",
					data:{"num":num},
					success:function(res){
			            
						reviewCount()
			            writtenReviewList()
					}
				});
			}
		});
		
	/* 	// 리뷰 수정 모달
	    const reviewModal = document.getElementById("review-modal")
	    
		$(document).on("click",".review-update-button",function(){
			
			reviewNum = $(this).attr("reviewNum");
			$("input[name=num]").attr("num",reviewNum);
			
			reviewModal.style.display = "flex"
			$("body").attr("class","modal-fix");
		});
		
		$(document).on("click",".btn-cancel",function(){
		    reviewModal.style.display = "none"
	        $("body").attr("class","");
		}); */
	});
	
	// 작성 가능한 후기
	function reviewList(){
		let userNum = ${sessionScope.loginUserNum};
		
		let s="";
			
		$.ajax({
			type: "get",
			url: "../select/WriteableList",
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
	 				s += "<a href='../product/detail?num="+elt.num+"'>"+elt.name+"</a>";
	 				s += "</div>";
	 				//s += "<div class='review-product-date'>";
	 				//s += "<span>11</span>";
	 				//s += "</div>";
	 				s += "</div>";
	 				s += "</div>";
	 				s += "<div class='review-button review-write' productNum='"+elt.num+"'>";
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
		let userNum = ${sessionScope.loginUserNum};
		
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
	 				s += "<a href='../product/detail?num="+elt.productNum+"'>"+elt.name+"</a>";
	 				s += "</div>";
	 				s += "<div class='review-product-date'>";
	 				s += "<span> 작성날짜: "+elt.createdAt+"</span>";
	 				s += "</div>";
	 				s += "</div>";
	 				s += "</div>";
	 				s += "<div class='review-content' style='display:none; justify-content:space-between; border-top:1px solid #f0f0f0; margin-bottom:10px;'>";
	 				s += "<div class='review-content-left'>";
	 				s += "<div class='review-content-left-content'>";
					
	 				// 별점
	 				s += "<div class='rating2' data-rate='"+elt.rating+"'>";
	 				s += "<i class='fas fa-star'></i>";
	 				s += "<i class='fas fa-star'></i>";
	 				s += "<i class='fas fa-star'></i>";
	 				s += "<i class='fas fa-star'></i>";
	 				s += "<i class='fas fa-star'></i>";
	 				s += "<span style='margin-left: 5px; font-size: 17px; font-weight: 10000;'>"+elt.rating+"</span>";
			 		s += "</div>";
	 				
	 				
	 				s += "<span class='review-subject'>"+elt.subject+"</span>";
	 				// 태그
	 				s += "<span>"+elt.content+"</span>";
	 				s += "<div class='review-tag-obejct' style='background-color:"+elt.tagBColor+"; cursor:default; margin-top:40px;' tagNum='"+elt.tagNum+"'>";
					s += "<span style='color:"+elt.tagTColor+";'>#"+elt.tagName+"</span>";
					s += "</div>";
	 				s += "</div>";
	 				s += "<div class='review-content-left-image'>";
	 				if(elt.reviewImageUrl != null) {
		 				s += "<a href='"+elt.reviewImageUrl+"' data-lightbox='example-set'>";
		 				s += "<img class='img-thumbnail' src='"+elt.reviewImageUrl+"' onerror='this.style.display=\"none\"'>";
		 				s += "</a>";
	 				}
	 				s += "</div>";
	 				s += "</div>";
	 				s += "<div class='review-content-right'>";
	 				s += "<span class='review-delete' style='font-size:20px; color:#d0d0d0; cursor:pointer;' reviewNum='"+elt.num+"'>X</span>";
	 				s += "<div class='review-update-button' style='position:relative; top:10px; left:-20px; width:150px; height:40px; display:flex; justify-content:center; align-items:center; border:1px solid #d0d0d0; cursor:pointer;' reviewNum='"+elt.num+"' productNum='"+elt.productNum+"'>수정하기</div>"
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
	// 작성한 후기 갯수
	function reviewCount(){
		let userNum = ${sessionScope.loginUserNum};
			
		$.ajax({
			type: "get",
			url: "../review/myCount",
			dataType: "json",
			data: {"userNum":userNum},
			success:function(res){
	
				$("span.review-menu-count").text("("+res+")");
			}
		});
	}
	// 태그 정보 불러오기
	function tagList(){
		
		let s = "";
		
		$.ajax({
			type: "get",
			url: "../tag/select",
			dataType: "json",
			success:function(res){
				
				$.each(res, function(i,elt) {
					
					s += "<div class='review-tag-obejct review-tag-select' name='tag' style='background-color:"+elt.backgroundColor+"' tagNum='"+elt.num+"'>";
					s += "<span style='color:"+elt.textColor+"'>#"+elt.content+"</span>";
					s += "</div>";
				
				});
				$("div.review-tag").html(s);
			}
		});
	}
	function tagSelectOne(tagNum) {
		$.ajax({
			type: "get",
			url: "../tag/selectOne",
			dataType: "json",
			data: {"num":tagNum},
			success:function(res){
				s += "<div class='review-tag-obejct' style='background-color:"+res.backgroundColor+"' tagNum='"+res.num+"'>";
				s += "<span style='color:"+res.textColor+"'>#"+res.content+"</span>";
				s += "</div>";
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
					<span style="color:#000; border-bottom: 3px solid #000;">작성 가능한 후기</span>
				</div>
				<span>|</span>
				<div class="review-after">
					<span>작성한 후기</span>
					<span class="review-menu-count"></span>
				</div>
			</div>
		<div class="review-result"></div>
		<!-- 리뷰 작성 폼 -->
		<div class="review-form">
			<form action="insert" method="post" enctype="multipart/form-data">
				
				<input type="hidden" name="userNum" value="${sessionScope.loginUserNum}">
				<input type="hidden" name="productNum" value="">
				<input type="hidden" name="tagNum" value="16">
				<input type="hidden" name="rating" value="3">
				<input type="file" name="upload" style="display: none">
				
				<div class="form-product-info"></div>
				<div class="form-rating">
					<span>선물로 만족하셨나요?</span>
					<div class="make_star">
						<div class="rating">
							<i class="fas fa-star" style="color:#fbea4e;"></i>
							<i class="fas fa-star" style="color:#fbea4e;"></i>
							<i class="fas fa-star" style="color:#fbea4e;"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
						</div>
					</div>
					<div>
						<i class='fas fa-quote-left'></i>
						<span class="rating-message">별점을 선택해주세요</span>
						<i class='fas fa-quote-right'></i>
					</div>
				</div>
				<div class="form-review">
					<span class="form-review-title">선물 후기를 남겨주세요</span>
					<div class="form-write-box">
						<input type="text" name="subject" class="form-control" placeholder="제목" style="position:relative; top: 20px; ">
						<label class="lab_tbx" for="tf_review"></label>
						<textarea name="content" class="form-control" cols="20" rows="1" id="tf_review" spellcheck="true" autocapitalize="off" autocomplete="off" autocorrect="off" placeholder="받은 선물의 소중한 후기를 남겨주세요. 남겨주신 후기는 다른 분들이 선물을 선택할 때 큰 도움이 됩니다."></textarea>
					</div>
					<div class="form-photo-button">
						<i class='fas fa-camera'></i>
						<span>사진 첨부</span>
					</div>
					<i class='far fa-question-circle'></i>
					<span class="review-term">교환권 도용 피해 예방을 위해 바코드 정보를 노출하지 않도록 주의해 주세요.</span>
					<br>
					<i class='far fa-question-circle'></i>
					<span class="review-term">전기통신사업법에 따라 방송통신심의위원회에서 불법 촬영물 등으로 심의한 정보에 해당하는 영상이나 이미지는 삭제될 수 있어요.</span>
				</div>
				<div class="form-tag">
					<span class="review-tag-title">이 선물의 태그를 남겨주세요</span>
					<span class="review-tag-info">#어떤 선물인가요?</span>
					<div class="review-tag"></div>
				</div>
				<div class="form-option">
					<span class="review-option-title">후기 등록 프로필을 선택해주세요</span>
					<span class="review-term2">프로필을 '사진/닉네임 공개'로 선택하신 경우, 작성하신 후기가 다른 고객들의 선물 고민에 도움을 주는 상품 홍보 및 광고에 활용될 때에 닉네임이 함께 공개됩니다. 프로필 공개를 원치 않으시면 '익명' 프로필로 선택해 주세요.</span><br>
					<span class="review-term2">아이콘 프로필의 홍보 활용 여부는 등록한 후기 별로 설정이 가능합니다.</span>
					<div class="review-option-select">
						<div class="review-option-object">
							<label>
								<input type="radio" name="publicOption" value="1" checked="checked">
								<img src="https://gift-s.kakaocdn.net/dn/gift/common/profile_default_1808.png">
								<span>사진/닉네임 공개</span>
							</label>
						</div>
						<div class="review-option-object">
							<label>
								<input type="radio" name="publicOption" value="0">
								<img src="https://gift-s.kakaocdn.net/dn/gift/gift/neo.png">
								<span>익명표기</span>
							</label>
						</div>
					</div>
					<div class="reivew-option-info">
						<i class='far fa-question-circle'></i>
						<span class="review-term">카카오쇼핑 이용약관에 따른 운영정책에 위반되는 내용 작성 시 통보 없이 삭제 및 혜택이 회수될 수 있습니다.</span><br>
						<i class='far fa-question-circle'></i>
						<span class="review-term">회원님의 휴대폰 번호와 같은 개인 정보 및 바코드 정보 노출이 금지되어 있으며 관련해서 발생하는 모든 피해에 대해 카카오는 책임지지 않습니다.</span><br>
						<i class='far fa-question-circle'></i>
						<span class="review-term">후기 등록 시 카카오톡 선물하기의 검색 결과, 콘텐츠, 프로모션 홍보 및 광고 등에 활용될 수 있음에 동의 되며, 동의 철회시 까지 유효합니다.</span><br>
						<i class='far fa-question-circle'></i>
						<span class="review-term">동의하신 이후에도 해당 후기를 언제든지 고객센터를 통해 활용 동의 철회 또는 삭제 요청 할 수 있으며, ‘작성한 후기’ 페이지에서 직접 삭제도 가능합니다.</span>
					</div>
				</div>
				<div class="form-button">
					<button type="button" class="btn btn-dark review-button review-cancel">취소</button>
					<button type="submit" class="btn review-button review-insert">동의 후 작성완료</button>
				</div>
			</form>
		</div>
		<!-- 리뷰 수정 폼 -->
		<div class="review-update-form">
			<form action="update" method="post" enctype="multipart/form-data">
			
				<input type="hidden" name="num" value="">
				<input type="hidden" name="userNum" value="${sessionScope.loginUserNum}">
				<input type="hidden" name="tagNum" value="">
				<input type="hidden" name="rating" value="">
				<input type="file" name="upload" style="display: none">
				
				<div class="form-product-info"></div>
				<div class="form-rating">
					<span>선물로 만족하셨나요?</span>
					<div class="make_star">
						<div class="rating">
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
						</div>
					</div>
					<div>
						<i class='fas fa-quote-left'></i>
						<span class="rating-message">별점을 선택해주세요</span>
						<i class='fas fa-quote-right'></i>
					</div>
				</div>
				<div class="form-review">
					<span class="form-review-title">선물 후기를 남겨주세요</span>
					<div class="form-write-box">
						<input type="text" name="subject" class="form-control" placeholder="제목" style="position:relative; top: 20px; ">
						<label class="lab_tbx" for="tf_review"></label>
						<textarea name="content" class="form-control" cols="20" rows="1" id="tf_review" spellcheck="true" autocapitalize="off" autocomplete="off" autocorrect="off" placeholder="받은 선물의 소중한 후기를 남겨주세요. 남겨주신 후기는 다른 분들이 선물을 선택할 때 큰 도움이 됩니다."></textarea>
					</div>
					<div class="form-photo-button">
						<i class='fas fa-camera'></i>
						<span>사진 첨부</span>
					</div>
					<i class='far fa-question-circle'></i>
					<span class="review-term">교환권 도용 피해 예방을 위해 바코드 정보를 노출하지 않도록 주의해 주세요.</span>
					<br>
					<i class='far fa-question-circle'></i>
					<span class="review-term">전기통신사업법에 따라 방송통신심의위원회에서 불법 촬영물 등으로 심의한 정보에 해당하는 영상이나 이미지는 삭제될 수 있어요.</span>
				</div>
				<div class="form-tag">
					<span class="review-tag-title">이 선물의 태그를 남겨주세요</span>
					<span class="review-tag-info">#어떤 선물인가요?</span>
					<div class="review-tag"></div>
				</div>
				<div class="form-option">
					<span class="review-option-title">후기 등록 프로필을 선택해주세요</span>
					<span class="review-term2">프로필을 '사진/닉네임 공개'로 선택하신 경우, 작성하신 후기가 다른 고객들의 선물 고민에 도움을 주는 상품 홍보 및 광고에 활용될 때에 닉네임이 함께 공개됩니다. 프로필 공개를 원치 않으시면 '익명' 프로필로 선택해 주세요.</span><br>
					<span class="review-term2">아이콘 프로필의 홍보 활용 여부는 등록한 후기 별로 설정이 가능합니다.</span>
					<div class="review-option-select">
						<div class="review-option-object">
							<label>
								<input class="review-update-option" type="radio" name="publicOption" value="1">
								<img src="https://gift-s.kakaocdn.net/dn/gift/common/profile_default_1808.png">
								<span>사진/닉네임 공개</span>
							</label>
						</div>
						<div class="review-option-object">
							<label>
								<input class="review-update-option" type="radio" name="publicOption" value="0">
								<img src="https://gift-s.kakaocdn.net/dn/gift/gift/neo.png">
								<span>익명표기</span>
							</label>
						</div>
					</div>
					<div class="reivew-option-info">
						<i class='far fa-question-circle'></i>
						<span class="review-term">카카오쇼핑 이용약관에 따른 운영정책에 위반되는 내용 작성 시 통보 없이 삭제 및 혜택이 회수될 수 있습니다.</span><br>
						<i class='far fa-question-circle'></i>
						<span class="review-term">회원님의 휴대폰 번호와 같은 개인 정보 및 바코드 정보 노출이 금지되어 있으며 관련해서 발생하는 모든 피해에 대해 카카오는 책임지지 않습니다.</span><br>
						<i class='far fa-question-circle'></i>
						<span class="review-term">후기 등록 시 카카오톡 선물하기의 검색 결과, 콘텐츠, 프로모션 홍보 및 광고 등에 활용될 수 있음에 동의 되며, 동의 철회시 까지 유효합니다.</span><br>
						<i class='far fa-question-circle'></i>
						<span class="review-term">동의하신 이후에도 해당 후기를 언제든지 고객센터를 통해 활용 동의 철회 또는 삭제 요청 할 수 있으며, ‘작성한 후기’ 페이지에서 직접 삭제도 가능합니다.</span>
					</div>
				</div>
				<div class="form-button">
					<button type="button" class="btn btn-dark review-button review-cancel">취소</button>
					<button type="submit" class="btn review-button review-update-btn">동의 후 수정완료</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>