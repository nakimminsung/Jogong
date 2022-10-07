<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet"><!-- font -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"><!-- bootstrap 5 -->
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script><!-- bootstrap 5 icon -->
<script src="https://code.jquery.com/jquery-3.5.0.js"></script><!-- jquery -->

<style>
	*{
		/* font-family: 'Jua'; */
	}
	
	#joinHeader{
		width: 100%;
		height: 100px;
		border: 1px solid gray;
		background-color: #f5f5f5;
	}
	
	#joinContent{
		width: 100%;
	}
	
	footer{
	  background-color: #f0f0f0;
	  width: 100%;
	  height: 155px;
	  position : relative;
	}
	
	div.home{
		min-width:60px;
		width:100%;
		max-width:120px;
	}
	div.home>a{
		font-size:30px;
	}

</style>
</head>
<body>
	<div>
		<div id="joinHeader">
			<div class="home">
				<a href="${root}">조공</a>
			</div>
		</div>
		
		<div id="joinContent">

		</div>
	</div>
	
	<footer>
		<tiles:insertAttribute name="footer"/>
	</footer>
</body>
</html>