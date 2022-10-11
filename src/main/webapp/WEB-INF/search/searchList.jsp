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

</style>
</head>
<body>

<div class="all">

	<!-- 상품 갯수, 필터 -->
	<div class="resultTop" style="display: flex; justify-content: space-between;">
		<b style="font-size: 20px;">검색된 상품 : 100개 / ${searchCount}개</b>
		
		<div>
			<select class="form-select" >
				<option selected>최신순</option>
				<option>인기순</option>
				<option>높은 가격순</option>
				<option>낮은 가격순</option>
			</select>
		</div>

	</div>
	
	<hr>
	
	<!-- 검색결과 -->
	<div>
		<c:if test="${searchCount==0}">
			<b><h5>검색된 상품이 없습니다</h5></b>
		</c:if>
	</div>
	
</div>
	
</body>
</html>