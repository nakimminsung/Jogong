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
		height: 1000px;
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
   
   .subText{
   		margin-top: 20px;
   		margin-bottom: 20px;
   		color: gray;
   		font-size: 13px;
   		
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
			
			<!-- 단계 Step Box -->
			<div class="stepBox">
				<h2>판매자 회원가입</h2>
				<ul>
					<li style="background-color: #dcdcdc; font-weight: bold;">1.약관 동의</li>
					<li>2.정보 입력</li>
					<li>3.가입 완료</li>
				</ul>	
			</div>

			<!-- 이용약관 div -->
			<div class="sellerTerm" style="width: 100%; height: 400px;">
				<h5>서비스 이용약관</h5>
				<hr>
				<div class="getTerm" style="width: 100%; height: 300px; border: 1px solid gray; overflow:scroll;">
					
				</div>
				<label style="float: right;"><input type="checkbox"> 이용약관 동의</label>
			</div>
			

			<hr>
			<!-- 사업자 인증 -->
			<div class="sellerCert" style="width: 100%; margin-top: 40px;">
				<h5>실명 및 가입 여부 확인</h5>
				<div class="subText">
					사업자 등록번호를 입력하여 가입여부를 확인 후 신청 가능합니다.<br>
					정상적인 사업자등록번호를 입력했으나, 실명확인에 문제가 있는 경우, NICE신용평가정보㈜를 참고해 주시기 바랍니다.
				</div>
				
				<!-- form action -->
				<form action="/jogong/join/sellerJoinForm" id="nextForm">
					<table style="width:100%; height: 60px; border-top: 1px solid gray; border-bottom: 1px solid gray;">
						<tr>
							<th style="width: 160px; background-color: #dcdcdc; text-align: center;">
								사업자 등록번호
							</th>
							<td style="padding-left: 10px;">
								<input type="text" name="businessNumber" id="businessNumber" style="width: 20%;" 
								placeholder="숫자만 입력">
								<!--  
								-
								<input type="text" name="sellerNum2" style="width: 14%"> -
								<input type="text" name="sellerNum3" style="width: 14%"> &nbsp;
								 -->
								<button type="button" class="btn btn-dark btn-sm">사업자 번호 인증</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
			
			<div class="subText">
					* 동일한 판매자의 중복 상품 등록 남용, 판매자 등급별 상품등록 수량 제한규정 우회 등의 악용 사례를 막기 위해 <br>
  					현재 조공 판매자 관련 정책상 이미 가입한것으로 판단되는 판매자는 사업자번호가 다르더라도 추가 입점이 제한될 수 있습니다.
			</div>
			
			
			<!-- 다음 버튼 -->
			<div style="text-align: center; margin-top: 40px; font-weight: bold; height: 50px;">
				<button type="submit" form="nextForm" class="btnNext btn btn-outline-secondary">다음</button>
			</div>
				
		</div> <!-- 전체 div : sellerJoinTerm 종료 -->
	
	</div>
</body>

<script>
	
	// 사업자등록증 하이픈 자동 입력 (3-2-5)
	$('#businessNumber').keydown(function (e) {
	    var key = e.charCode || e.keyCode || 0;
	    $text = $(this); 
	    
	    if (key !== 8 && key !== 9) {
	        if ($text.val().length === 3) {
	            $text.val($text.val() + '-');
	        }
	        if ($text.val().length === 6) {
	            $text.val($text.val() + '-');
	        }
	    }

		return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
		// Key 8번 백스페이스, Key 9번 탭, Key 46번 Delete 부터 0 ~ 9까지, Key 96 ~ 105까지 넘버패트
		// 한마디로 JQuery 0 ~~~ 9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
		});
	
	
	//사업자등록증 유효성 검사
	function fn_ValidationCheck(value) {
	    var valueMap = value.replace(/-/gi, '').split('').map(function (item) {
	        return parseInt(item, 10);
	    });
	 
	    if (valueMap.length === 10) {
	        var multiply = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5);
	        var checkSum = 0;
	 
	        for (var i = 0; i < multiply.length; ++i) {
	            checkSum += multiply[i] * valueMap[i];
	        }
	 
	        checkSum += parseInt((multiply[8] * valueMap[8]) / 10, 10);
	        return Math.floor(valueMap[9]) === ((10 - (checkSum % 10)) % 10);
	    }
	 
	    return false;
	}
</script>

</html>