<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JoGongGift</title>
<link rel="shortcut icon" href="/jogong/resources/image/favicon.ico" type="image/x-icon">
<link rel="icon" href="/jogong/resources/image/favicon.ico" type="image/x-icon">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<c:set var="root" value="<%=request.getContextPath() %>"/>
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
	
	#wrapper{
	  width:100%;
	  height: auto;
	  min-height: 100%;
	  padding-top: 100px;
	}
	header#header{
		background-color: #fff;
		position: fixed;
		top: 0;
		width: 100%;
		height: 100px;
		z-index: 100;
	}
	div.content{
	  max-width: 1180px;
	  margin: 0 auto;
	}
	footer{
	  background-color: #fafafc;
	  width: 100%;
	  height: 100px;
	  position : relative;
	}
	#brand {
		margin-top:50px;
	}
</style>
</head>
<body>
	<header id="header">
		<tiles:insertAttribute name="header"/>
	</header>
	<div id="wrapper">
		<div class="content">
			<div id="gift">
				<tiles:insertAttribute name="gift"/>
			</div>	
			<div id="brand">
				<tiles:insertAttribute name="brand"/>
			</div>
			<div id="theme">
				<tiles:insertAttribute name="theme"/>
			</div>
			<div id="price">
				<tiles:insertAttribute name="price"/>
			</div>
		</div>
	</div>
	<footer>
		<tiles:insertAttribute name="footer"/>
	</footer>
</body>
</html>