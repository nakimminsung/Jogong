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

<!-- 이용약관 css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/terms.css">

<style>
	*{
		/* font-family: 'Jua'; */
	}

	div.sellerJoinTerm{
		width: 100%;
		height: 1000px;
		/* padding-top: 50px;
		padding-left: 200px; */
		margin-top: 30px;
		padding-left: 24%;
		padding-right: 24%;

	}
	
	.stepBox{
		width: 100%;
		height: 100px;
		margin-top: 10px;
		margin-bottom: 30px;
		
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
	
	.sellerTerm{
		margin-top: 30px;
	}
	
	.btnNext {
      width: 200px;
      height: 50px;
      font-size: 20px;
      /* border: 0px;
      border-radius: 8px; */
      
   }
   
   .subText{
   		margin-top: 20px;
   		margin-bottom: 20px;
   		color: gray;
   		font-size: 13px;
   		
   }
   
   .term1{
   	justify-content: space-between;
   }
   
   .term2{
   	justify-content: space-between;
   }
   

</style>
</head>
<script>
$(document).ready(function(){
	
	 $.ajax({
			type:"get",
			url:"/jogong/resources/terms/sellerTerm1.jsp",
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
			
			<!-- 단계 Step Box -->
			<div class="stepBox">
				<h2>판매자 회원가입</h2>
				<ul>
					<li style="color:red; font-weight: bold; border: 1px solid red;">1.약관 동의</li>
					<li style="color:lightgray; font-weight: bold; border: 1px solid lightgray;">2.정보 입력</li>
					<li style="color:lightgray; font-weight: bold; border: 1px solid lightgray;">3.가입 완료</li>
				</ul>	
			</div>

			<h5 style="border-bottom: 1px solid black; padding: 0px 0px 10px 10px; font-weight: bold;">서비스 이용약관</h5>
			


			<div class="input-group term1">
				<!-- 이용약관 div 1 -->
				<div class="sellerTerm" style="width: 49%; height: 300px;">
					<label style="float: right;"><input type="checkbox"> 조공 이용약관</label>
					<div class="getTerm" style="width: 100%; height: 240px; border: 1px solid gray; overflow:scroll;">
						
					</div>
				</div>
				
				<!-- 이용약관 div 2 -->
				<div class="sellerTerm" style="width: 49%; height: 300px;">
					<label style="float: right;"><input type="checkbox"> 조공 개인정보 수집</label>
					<div class="getTerm" style="width: 100%; height: 240px; border: 1px solid gray; overflow:scroll;">
						
					</div>
				</div>
			</div>
			
			
			<div class="input-group term2">
			
				<!-- 이용약관 div 3 -->
				<div class="sellerTerm" style="width: 49%; height: 300px;">
					<label style="float: right;"><input type="checkbox"> 오픈마켓 판매자 약관</label>
					<div class="getTerm" style="width: 100%; height: 240px; border: 1px solid gray; overflow:scroll;">
						
					</div>
					
				</div>
				
				<!-- 이용약관 div 4 -->
				<div class="sellerTerm" style="width: 49%; height: 300px;">
					<label style="float: right;"><input type="checkbox"> 판매자 개인정보 수집 및 이용안내</label>
					<div class="getTerm" style="width: 100%; height: 240px; border: 1px solid gray; overflow:scroll;">
						
					</div>
				</div>
			</div>

			
			
			<!-- 다음 버튼 -->
			<div style="text-align: center; margin-top: 40px; font-weight: bold; height: 50px;">
				<button type="button" class="btnNext btn btn-outline-secondary" onclick="f_link();">다음</button>
			</div>
				
		</div> <!-- 전체 div : sellerJoinTerm 종료 -->
	
	</div>
</body>
<script>

	function f_link(){
	    location.href = "../join/sellerJoinForm";
	}

</script>
</html>