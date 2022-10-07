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
		text-align: center;
	    display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
	    align-content: stretch;
	    align-items: baseline;
	    justify-content: center;
		
	}
	
	.cateImage{
		width: 90px;
		border-radius: 30px;
		
	}

</style>
</head>
<body>
	<div style="width: 100%;" class="contentsBody">
		<h2 style="font-weight: bold; width: 900px;">${catebynum }</h2><br>
			<div class="categoryTotal">
				<c:forEach var="cate" items="${category}" >
					<a href="/jogong/category/categoryDetail?num=${cate.num}">
						<img src="${cate.categoryImage }" class="cateImage" ><br>
						<c:set var="s1" value="${cate.num }"></c:set>
						<c:if test="${num==s1}">
							<span style="font-size: 15px; display:inline-block; margin: 10px 0px;border-bottom: 2px solid black;width:100px;">${cate.name }</span>
						</c:if>
						<c:if test="${num!=s1}">
							<span style="font-size: 15px; display:inline-block; margin: 10px 0px;">${cate.name }</span>
						</c:if>					
					</a>
				</c:forEach>
				<div style="border-bottom: 1px solid #dcdcdc; width: 100%;"></div>
			</div>
			
			dd
	</div>	
</body>
</html>
