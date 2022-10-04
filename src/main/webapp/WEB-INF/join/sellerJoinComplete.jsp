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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script><!-- daum 주소검색 -->
<style>
	*{
		
	}
	
	div.all{
		width: 100%;
		height: 600px;
		/* padding-top: 50px;
		padding-left: 200px; */
		margin-top: 30px;
		padding-left: 24%;
		padding-right: 24%;
		text-align: center;
	}
	
	.stepBox{
		width: 100%;
		height: 100px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	
	.stepBox ul{
		list-style: none;
		padding-left: 0px;
	}
	
	.stepBox li{
		width: 33.3333%;
		height: 50px;
		float: left;
		border: 1px solid gray;
		text-align: center;
		padding-top: 10px;
		margin-top: 10px;
		font-size: 20px;
	}

</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<div style="background-color: white;">
		<div class="all">
			
			<!-- 단계 Step Box -->
			<div class="stepBox">
				<h2>판매자 회원가입</h2>
				<ul>
					<li style="color:lightgray; font-weight: bold; border: 1px solid lightgray;">1.약관 동의</li>
					<li style="color:lightgray; font-weight: bold; border: 1px solid lightgray;">2.정보 입력</li>
					<li style="color:red; font-weight: bold; border: 1px solid red;">3.가입 완료</li>
				</ul>		
			</div> <!-- stepBox 종료 -->
			
			<hr style="margin-top: 30px; margin-bottom: 70px;">
			
			<!-- textBox -->
			<div class="textBox" style="height: 400px; vertical-align: middle;">
				
				<i class='fas fa-check-circle' style='font-size:60px; color:#19ce60'></i>
				<br><br>
				<p style="color: gray; font-size: 36px;">조공 <b style="color: black; font-size: 36px;">회원가입이 완료</b>되었습니다.</p>
				<p>회원님은 조공의 모든 기능을 사용하실 수 있습니다. 로그인 후 이용 가능합니다.</p>
				
				<br>
				<button type="button" class="btn btn-outline-secondary" style="margin-top: 20px;"
				onclick="location.href='${root}/login/loginForm'">로그인 페이지로 이동</button>
				
			</div>
		
		</div> <!-- div.all 종료 -->
	</div>
</body>
</html>