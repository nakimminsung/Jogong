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
		width:110px;
		border-radius: 40px;
		border: 3px solid white;
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
	}
</style>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<div class="my-menu-wrapper">
		<div class="my-profile">
			<div class="my-pofile-left" style="display: flex; align-items: center;">
				<img alt="profileImage" src="${root}/image/default.png" id="my-profile-img">
			</div>
			<div class="my-profile-right" style="padding-left: 10px; display:flex; flex-direction:column; justify-content: center; align-items: flex-start;">
				<b style="font-size: 20px; display: block;">이름</b>
				<b style="font-size: 15px;">내 생일은 6월 3일</b>
			</div>
		</div>
		<div class="my-menu">
			<div class="my-menu-top">
				<h3>쇼핑정보</h3>
				<a href="${root}/mypage/cart">선물함</a>
				<a href="${root}/mypage/wishlist">위시리스트</a>
				<a href="${root}/mypage/orderlist">주문내역</a>
				<a href="${root}/mypage/review">선물후기</a>
			</div>
			<div class="my-menu-bottom">
				<h3>내 정보</h3>
				<a>프로필 정보</a>
				<a>주소록</a>
			</div>
		</div>
	</div>	
</body>
</html>