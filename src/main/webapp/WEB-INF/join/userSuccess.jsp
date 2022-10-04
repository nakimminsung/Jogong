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
	*{
		/* font-family: 'Jua'; */
	}

	div.userJoinTerm{
		width: 100%;
		height: 1100px;
		/* padding-top: 50px;
		padding-left: 200px; */
		margin-top: 30px;
		padding-left: 20%;
		padding-right: 20%;

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
	}
	
	.userJoinTerm{
		margin-top: 50px;
	}
	
	.btnNext {
      width: 200px;
      height: 50px;
      font-size: 20px;
      /* border: 0px;
      border-radius: 8px; */
      
   }
</style>
</head>
<body>
	<div style="background-color: white;">

		<div class="userJoinTerm"> <!-- div 전체 -->
			<div class="stepBox">
				<h2>개인 회원가입</h2>
				<ul>
					<li class="agrees">1.약관 동의</li>
					<li class="insert">2.정보 입력</li>
					<li style="background-color: #dcdcdc; font-weight: bold;" class="gaip">3.가입 완료</li>
				</ul>	
			</div>
	
			<div class="userSuccessTerm" >
				가입 완료하였습니다.<br>
				가입을 진심으로 축하드립니다.
				</div>
		</div> <!-- 전체 div : sellerJoinTerm 종료 -->
	
	</div>
</body>
</html>
