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

<style>
	*{
		/* font-family: 'Jua'; */
	}
	
	div.joinMain{
		width: 500px;
		height: 500px;
		margin: 70px auto;
		text-align: center;
	}
	
	div.joinPersonal{
		width: 500px;
		height: 260px;
	}
	
	h2.joinTitle{
		font-weight: bold;
	}
	
	button.btnJoin{
		width: 500px;
		height: 50px;
		
		border: 0px;
		border-radius: 8px;
		/* 
		color: white;
		 */
		font-weight: bold;
		
		background-color: #ef3e43;
	}
	
	div.snsJoin{
		width: 500px;
		margin-top: 30px;
		justify-content: space-between;
	}
	
	div.snsJoin button{
		width: 230px;
		height: 40px;
		border: 0px;
		border-radius: 8px;
		font-weight: bold;
	}
	
	button.btnSeller{
		width: 500px;
		height: 50px;
		border-radius: 8px;
		/* 
		border: 1px solid gray;
		background-color: white;
		 */
		font-weight: bold;
	}

</style>
</head>
<body>

<div style="background-color: white;">

	<!-- 전체 div -->
	<div class="joinMain">
	
	
	<div class="joinPersonal">
		<h2 class="joinTitle">조공 회원가입</h2>
		<p style="margin-top: 20px;">지금 회원가입 하신 후 조공에서 다양한 서비스를 경험해보세요</p>
		<button class="btnJoin btn btn-danger" onclick="location.href = '../join/userJoin'" >개인 회원가입</button>
		
		<div class="snsJoin">
			<button class="btnNaver" style="background-color: #19ce60; color: white;">N 네이버로 가입</button>&nbsp;&nbsp;&nbsp;
			<button class="btnKakao" style="background-color: #fde102;"><i class='fas fa-comment'></i> 카카오로 가입</button>
		</div>
		
		<p style="margin-top: 10px; color: gray; font-size: 14px;">SNS계정 회원가입(만 14세 이상 가능)</p>
	
	</div>	<!-- 개인/SNS 회원가입 div 종료 -->
	
	<hr><br>
	
	<button class="btnSeller btn btn-outline-secondary" onclick="f_link();">판매자 회원가입</button>
	<p style="margin-top: 10px; color: gray; font-size: 14px;">판매 목적의 개인/법인 사업자 가입 가능</p>
	
	
	</div>	<!-- 전체 div -->
	
</div>
</body>

<script>

	function f_link(){
	    location.href = "../join/sellerJoin";
	}

</script>
</html>