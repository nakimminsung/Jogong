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
		margin-top: -20px;
	}
	span.form-review-title {
		position: relative; 
		top:50px; 
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
		eft:10px;
	}
	label.lab_tbx>span {
		font-size: 12px; color: #a0a0a0;
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
	div.review-option-object>img {
		width: 50px; 
		height: 50px; 
		border:0px; 
		border-radius: 20px; 
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
	span.review-term2 {
		font-size: 13px; 
		color: #a0a0a0;
	}
</style>
<script>
	$(function(){
		// 페이지 접속시 작성가능한 후기 함수 호출
		reviewList()
		
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
					s += "<span>"+res.name+"</span>";
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
		
		// 마우스오버시 별점 설정
		$(document).on("mouseover",".make_star i",function(){
			let targetNum = $(this).index()+1;
			$(this).parents(".make_star").attr("review-rating",targetNum);
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
		
		// 클릭시 별점 설정
		$(document).on("click",".make_star i",function(){
			let targetNum = $(this).index()+1;
			$(this).parents(".make_star").attr("review-rating",targetNum);
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
		
		// 리뷰 작성 박스 클릭시 라벨 제거
		$(document).on("click","#tf_review",function(){
			$(this).siblings(".lab_tbx").css("visibility","hidden");
		});
		
		// 태그 선택시 이벤트
		$(document).on("click",".review-tag-obejct",function(){
			$(this).css("border","3px solid lightgray");
			$(this).siblings(".review-tag-obejct").css("border","0px solid lightgray");
		});
	});
	
	// 작성 가능한 후기
	function reviewList(){
		let userNum = ${sessionScope.loginid};
		
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
	 				s += "<span>"+elt.name+"</span>";
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
					<span style="color:#000; border-bottom: 3px solid #000;">작성 가능한 후기</span>
				</div>
				<span>|</span>
				<div class="review-after">
					<span>작성한 후기</span>
					<span class="review-menu-count"></span>
				</div>
			</div>
		<div class="review-result"></div>
		<div class="review-form">
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
					<label class="lab_tbx" for="tf_review">
						<span>받은 선물의 소중한 후기를 남겨주세요.<br>남겨주신 후기는 다른 분들이 선물을 선택할 때 큰 도움이 됩니다.</span>
					</label>
					<textarea cols="20" rows="1" id="tf_review" spellcheck="true" autocapitalize="off" autocomplete="off" autocorrect="off"></textarea>
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
				<div class="review-tag">
					<div class="review-tag-obejct" tagNum=1>
						<span>#생일</span>
					</div>
					<div class="review-tag-obejct" tagNum=2>
						<span>#연인</span>
					</div>
					<div class="review-tag-obejct" tagNum=3>
						<span>#효도</span>
					</div>
				</div>
			</div>
			<div class="form-option">
				<span class="review-option-title">후기 등록 프로필을 선택해주세요</span>
				<span class="review-term2">프로필을 '사진/닉네임 공개'로 선택하신 경우, 작성하신 후기가 다른 고객들의 선물 고민에 도움을 주는 상품 홍보 및 광고에 활용될 때에 닉네임이 함께 공개됩니다. 프로필 공개를 원치 않으시면 '익명' 프로필로 선택해 주세요.</span><br>
				<span class="review-term2">아이콘 프로필의 홍보 활용 여부는 등록한 후기 별로 설정이 가능합니다.</span>
				<div class="review-option-select">
					<div class="review-option-object">
						<input type="radio">
						<img src="">
						<span>익명표기</span>
					</div>
					<div class="review-option-object">
						<input type="radio">
						<img src="">
						<span>사진/닉네임 공개</span>
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
		</div>
	</div>	
</body>
</html>