<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet"><!-- font -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"><!-- bootstrap 5 -->
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script><!-- bootstrap 5 icon -->
<script src="https://code.jquery.com/jquery-3.5.0.js"></script><!-- jquery -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<style>
	*{
		
	}
	
	.all{
		margin-top: 50px;
		padding-left: 20%;
		padding-right: 20%;
		
		width: 100%;
		height: 500px;
		
		
	}
	
	.searchBar{
		width: 80%;
		height: 40px;
		background-color: #f5f6f7;
	}

</style>
</head>
<body>
<div class="all">

	<div class="searchBox_area">
		
		<!-- 검색어 입력 -->
		<div class="input-group" style="width:100%; height: 55px;">
			<input type="text" class="form-control searchBar" placeholder="검색어를 입력해주세요" >
			<i class='fas fa-search sh' style="font-size:30px"></i>
		</div>
		
		<!-- 최근 검색어 목록 -->
		<div class="recent_area">
			<span><b style="color: gray;">최근 검색어</b></span>&nbsp;&nbsp;
			<span style="border: 1px solid lightgray; border-radius: 10px; background-color: #fafafa; color: gray; cursor: pointer;">스타벅스</span>
		</div>
		
		<hr>
		
	</div>	<!-- 검색 영역 A 종료 -->
	
	
	
	<div class="result_area" style="background-color: #e0dbef; height: 300px;">
		결과 영역 B
		
		1. 디폴트 : 추천 검색어영역 (내 임의대로)
		2. 디폴트 : 이벤트 영역 (필수 아님)
	</div>
	
	
</div> <!-- div.all 종료 -->
</body>
</html>