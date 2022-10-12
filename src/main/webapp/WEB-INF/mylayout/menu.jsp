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
	div.my-menu-wrapper {
		position:fixed;
		height: 500px;
		top: 100px;
		width: 300px;
	}
	div.my-profile{
		width: 100%;
		height: 150px;
		display: flex;
		flex-direction: row;
	}
	img#my-profile-img {
		width:90px;
		border-radius: 35px;
	}
	div.my-menu {
		padding: 20px 0;
	}
	div.my-menu>div{
		display: flex;
		flex-direction: column;
	}
	div.my-menu-top{
		margin-bottom: 30px;	
	}
	div.my-menu>div>a{
		display: block;
		margin: 5px;
		font-size: 17px;
		font-weight: 1000;
		color: #a0a0a0;
	}
	a.menu-select:hover {
		color: #000;
		font-weight: 1000;
	}
</style>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<div class="my-menu-wrapper">
		<div class="my-profile">
			<div class="my-pofile-left" style="display: flex; align-items: center;">
				<img alt="profileImage" src="${sessionScope.loginphoto}" id="my-profile-img">
			</div>
			<div class="my-profile-right" style="padding-left: 10px; display:flex; flex-direction:column; justify-content: center; align-items: flex-start;">
				<b style="font-size: 25px; display: block; font-weight: 1000;">${sessionScope.loginname}</b>
				<b style="font-size: 15px;">내 생일은 6월 3일</b>
			</div>
		</div>
		<div class="my-menu">
			<div class="my-menu-top">
				<h3 style="font-weight: 1000;">쇼핑정보</h3>
				<a class="menu-select menu-gift" href="${root}/orderDetail/page">선물함</a>
				<a class="menu-select menu-wish" href="${root}/wishlist/page">위시리스트</a>
				<a class="menu-select menu-cart" href="${root}/mypage/cart">장바구니</a>
				<a class="menu-select menu-review" href="${root}/review/page">선물후기</a>
			</div>
			<div class="my-menu-bottom">
				<h3 style="font-weight: 1000;">내 정보</h3>
				<a class="menu-select menu-friend" href="${root}/friend/page">친구목록</a>
				<a class="menu-select menu-profile" href="${root}/mypage/user">프로필 정보</a>
				<a class="menu-select menu-qna" href="${root}/mypage/qna">문의 내역</a>
			</div>
		</div>
	</div>	
</body>
</html>