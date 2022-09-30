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
	div.my-profile{
		width: 100%;
		height: 200px;
		background-color: gray;
	}
	div.my-menu {
		padding:20px 30px;
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
	}
</style>
<body>
	<div class="my-menu-wrapper">
		<div class="my-profile">
		</div>
		<div class="my-menu">
			<div class="my-menu-top">
				<h3>쇼핑정보</h3>
				<a>선물함</a>
				<a>위시리스트</a>
				<a>주문내역</a>
				<a>선물후기</a>
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