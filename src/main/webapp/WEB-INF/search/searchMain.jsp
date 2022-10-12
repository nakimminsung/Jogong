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
		height: 1000px;
	}
	
	.search_area{
		width: 55%;
		height: 55px;
		background-color: #f5f6f7;
		
		display: flex;
		position: relative;
		justify-content: space-between;
		align-items: center;
	
		margin: 5px auto;
		margin-bottom: 10px;
		
	}
	
	.recent_area{
		background-color: #e0dbef;
		width: 100%;
		height: 40px;
		
	}
	
	.recent_word{
		color: gray;
		padding: 5px;
		border: 1px solid lightgray;
		border-radius: 10px;
		background-color: #fafafa;
		margin-right:5px;
		
		cursor: pointer;
		
	}

</style>
</head>
<body>
<div class="all">

	<div class="searchBox_area"">
		
		<!-- 검색어 입력 -->
		<div class="search_area">
		<form action="">
			<input type="text" class="form-control" placeholder="검색어를 입력해주세요"
			style="width: 90%; height: 50px; border-radius: 5px; border: 0px; background-color: #f5f6f7;">
			
			<i class='fas fa-search sh' style="font-size:26px; margin-right: 5px;"></i>
		</div>
		
		
		
		
		</form>
		
		<!-- 최근 검색어 목록 -->
		<div class="recent_area">
			<span><b style="color: gray;">최근 검색어</b></span>&nbsp;&nbsp;
			
			<!-- 샘플 -->
			<span class="recent_word" >스타벅스</span>
			<span class="recent_word" >꽃</span>
			<span class="recent_word" >아이패드 프로</span>
		</div>
		
		<hr>
		
	</div>	<!-- 검색 영역 종료 -->
	
	
	
	<!-- 결과 영역 -->
	<div class="result_area" style="background-color: #e0dbef; height: 300px; width: 100%">
		
		<!-- 디폴트 -->
		<div class="recommendWord" style="text-align: center;">
			<h4><b>추천 검색어</b></h4>
			<hr style="width: 50px;">
		</div>
		
		
		<!-- 결과 -->
		<div class="resultTop" style="display: flex; justify-content: space-between;">
			<p style="font-size: 20px;">상품 <b style="font-size: 20px;">100개</b> </p>
			
			<div>
				<select class="form-control" >
					<option selected>최신순</option>
					<option>인기순</option>
					<option>높은 가격순</option>
					<option>낮은 가격순</option>
				</select>
			</div>
	
		</div>
		
		
		
		
		
		
		
		
	</div>
	
	

	
	
	
</div> <!-- div.all 종료 -->
</body>
</html>