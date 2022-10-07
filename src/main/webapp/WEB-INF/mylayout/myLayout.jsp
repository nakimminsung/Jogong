<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
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
<style type="text/css">
	@font-face {
    font-family: 'SeoulNamsanM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulNamsanM.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	body * {
		font-size: 15px;
		font-family: 'SeoulNamsanM';
		word-spacing: -1px;
	}
	header{
		background-color: #fff;
		position: fixed;
		top: 0;
		width: 100%;
		height: 100px;
		z-index: 10;
		font-size: 15px;
		font-family: 'SeoulNamsanM';
		word-spacing: -1px;
	}
	div#wrapper{
	  margin: 0 auto;
	  height: auto;
	  min-height: 100%;
	  position: relative;
	}
	div.content{
		max-width: 1180px;
		top:100px;
		display: flex;
		justify-content: space-between;
		margin: 0 auto;
	}
	div#menu{
		width:30%;
		float: left;
	}
	div#myContent{
		width:70%;
		float: right;
	}
	footer{
	  background-color:lightgray;
	  width: 100%;
	  height: 130px;
	  position: relative;
	  bottom: 0;
	}

</style>
<body>
	<header id="header">
		<tiles:insertAttribute name="header"/>
	</header>	
	<div id="wrapper">
		<div class="content">
			<div id="menu">
				<tiles:insertAttribute name="menu"/>
			</div>	
			<div id="myContent">
				<tiles:insertAttribute name="myContent" ignore="true"/>
			</div>
		</div>
	</div>
	<footer>
		<tiles:insertAttribute name="footer"/>
	</footer>
</body>
</html>