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
	
	$(function () {
		$("#totalAgree").on('click', function(){
			var checked = $(this).is(':checked');
			//alert(checked);	
			
			if(checked) {
		    	$(".agree").prop('checked', true);
		    }else{
		    	$(".agree").prop('checked', false);
		    }
			
		});
		$(".agree").on('click', function(){
			var checked1 = $("#agree1").is(':checked');
			var checked2 = $("#agree2").is(':checked');
			
			if(checked1!=checked2){
				$("#totalAgree").prop('checked', false);
			}else if(checked1==false || checked2==false){
				$("#totalAgree").prop('checked', false);
			}else{
				$("#totalAgree").prop('checked', true);
			}
			
		});
		
		$(".btnNext").click(function () {
			var checked = $("#totalAgree").is(':checked');
			//alert(checked);
			if(checked){
				$(".agreeform").hide();
				$(".insertForm").show();
				$(".agrees").css("background-color","white");
				$(".agrees").css("font-weight","normal");
				$(".insert").css("background-color","#dcdcdc");
				$(".insert").css("font-weight","bold");
				$("html").scrollTop(0);
			}else{
				alert("필수 약관을 동의해주시기 바랍니다");
			}
			
		})
	});
</script>
<body>
	<div style="background-color: white;">

		<div class="sellerJoinTerm"> <!-- div 전체 -->
			
			<div class="stepBox">
				<h2>개인 회원가입</h2>
				<ul>
					<li style="background-color: #dcdcdc; font-weight: bold;" class="agrees">1.약관 동의</li>
					<li class="insert">2.정보 입력</li>
					<li class="gaip">3.가입 완료</li>
				</ul>	
			</div>
			
		<div class="agreeform">	
			<div class="sellerTerm" >
				<h5>서비스 이용약관</h5>
				<hr>
				<div class="getTerm" style="width: 100%; height: 300px; border: 1px solid gray; overflow:scroll;">
					
				</div>
				<label style="float: right;"><input type="checkbox" class="agree" id="agree1"><b>[필수]</b> 조공서비스 약관 동의</label>
			</div>
			
			<div class="sellerTerm" >
				<h5>개인정보 보호 약관</h5>
				<hr>
				<div class="getTerm" style="width: 100%; height: 300px; border: 1px solid gray; overflow:scroll;">
					
				</div>
				<label style="float: right;"><input type="checkbox" class="agree" id="agree2"><b>[필수]</b> 개인정보 수집동의</label>
			</div>
			
			<div style="text-align: center; margin-top: 40px; font-weight: bold;">
				<label><input type="checkbox" id="totalAgree"> 전체 동의합니다</label><br><br>
				<button class="btnNext btn btn-outline-secondary">다음</button>
			</div>
			</div>	
			
			<div class="insertForm" style="display: none;">
				<form action="insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
					<table style="width: 600px">
						<caption align="top"><h4 class="alert alert-danger"><b>회원가입</b></h4></caption>
							<tr>
								<td style="width:250px" rowspan="4" align="center">
									<div class="input-group">
										<input type="file" id="myphoto" name="myphoto" style="display: none;">
										<button type="button" id="btnphoto" class="btn btn-secondary">사진선택</button>
										<br>
										<img id="showimg">
									</div>
								</td>
								<td>
									<div class="input-group mb-3">
										<input type="text" placeholder="아이디입력" id="loginid2" name="loginid"
										class="form-control" style="width: 120px;" required="required">
										<button type="button" class="btn btn-danger btn-sm" id="btnidcheck">중복체크</button>
										&nbsp;
										<div class="idsuccess" style="width:60px;">check</div>
									</div>
								</td>
							</tr>
							<tr>
								<td style="border-bottom: 3px solid black;">
									<div class="input-group">
										<input type="password"  style="width:120px;" class="form-control"
										name="pass" id="pass" placeholder="숫자4자리" maxlength="4" pattern="[0-9]{4,}"
										required="required">
										
										<input type="password"  style="width:120px; border: none;" class="form-control" 
										 id="pass2" placeholder="숫자4자리" maxlength="4" pattern="[0-9]{4,}"
										  required="required">
										 &nbsp;
										<div class="passsuccess" style="width:60px;">check</div>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" name="name" class="form-control" style="width: 150px;"
									placeholder="이름을 입력하세요" required="required">
								</td>
							</tr>
							<tr>
								<td>
									<input type="email" name="email" class="form-control" 
									placeholder="이메일을 입력하세요" required="required">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="input-group">
										<input type="text" name="hp" placeholder="(-)없이 HP번호만 입력"  class="form-control"
										style="width: 200px;" required="required">
										
										<input type="text" name="address" placeholder="주소입력"  class="form-control"
										style="width: 300px;" required="required">
									</div>
								</td>		
							</tr>
							<tr>
								<td colspan="2" align="center">
									<button type="submit" class="btn btn-info" style="width: 180px;">회원가입</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
				
		</div> <!-- 전체 div : sellerJoinTerm 종료 -->
	
	</div>
</body>
</html>