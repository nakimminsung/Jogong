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

	div.sellerJoinTerm{
		width: 100%;
		height: 650px;
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
	
	.sellerTerm{
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
<script>
$(document).ready(function(){
	 
	 $.ajax({
			type:"get",
			url:"/jogong/resources/terms/sampleterm.jsp",
			dataType:"html",
			async: false,
			success:function(res){
				
				$("div.getTerm").html(res);
				
			}
			
		});
	 
	});
</script>
<body>
	<div style="background-color: white;">

		<div class="sellerJoinTerm"> <!-- div 전체 -->
			
			<div class="stepBox">
				<h2>판매자 회원가입</h2>
				<ul>
					<li style="border: 2px solid red;">1.약관 동의</li>
					<li>2.정보 입력</li>
					<li>3.가입 완료</li>
				</ul>	
			</div>
	
			<div class="sellerTerm" >
				<h5>서비스 이용약관</h5>
				<hr>
				<div class="getTerm" style="width: 100%; height: 300px; border: 1px solid gray; overflow:scroll;">
					
				</div>
				<label style="float: right;"><input type="checkbox"> 이용약관 동의</label>
			</div>
			
			<div style="text-align: center; margin-top: 40px; font-weight: bold;">
				<button class="btnNext btn btn-outline-secondary">다음</button>
			</div>
				
		</div> <!-- 전체 div : sellerJoinTerm 종료 -->
	
	</div>
</body>
</html>