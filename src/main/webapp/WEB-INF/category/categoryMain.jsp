<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">   

 <link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	a.header-cate>span{
		color:#000 !important;
		border-bottom: 5px solid #cff0cc;
	}
	
	@font-face {
    font-family: 'SeoulNamsanM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulNamsanM.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	body * {
		 font-family: 'SeoulNamsanM';
		 word-spacing: -1px;
	}
	.categoryTotal{
		width: 900px;
		display: flex;
		flex-wrap: wrap;
		justify-content: space-between;	
		text-align: center;	
				
	}
	
	.cateImage{
		width: 200px;
		border-radius: 20px;
		
	}
	.contentsBody {
		width: 100%;
	   display: flex;
	   flex-direction: column;
	   align-items: center;
	   margin-top: 1%;
	}
	.categoryHeader{
	 margin-bottom: .5rem;
    line-height: 1.2;
    font-size: 2rem;
    font-weight: bold;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 100%;
    margin-top: 15px;
	}
</style>
</head>
<body>
<div style="width: 100%;" class="contentsBody">
	<h2 class="categoryHeader" style="">카테고리</h2><br>
	<hr style="width: 120px; height: 10px; position: relative; top:-55px; color: #cff0cc; opacity: 1; z-index: -1;">
	<div class="categoryTotal">
		<c:forEach var="cate" items="${category}" >
			<a href="/jogong/category/categoryDetail?num=${cate.num}">
				<img src="${cate.categoryImage }" class="cateImage" ><br>
				<span style="font-weight: bold; font-size: 20px; display:inline-block; margin: 10px 0px;">${cate.name }</span>
			</a>
		</c:forEach>
	</div>
</div>	
</body>
</html>
