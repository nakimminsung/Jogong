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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>
	*{
		/* font-family: 'Jua'; */
	}

	div.userJoinTerm{
		width: 100%;
		height: 1100px;
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
	
	.agreeTerm{
		margin-top: 50px;
	}
	
	.btnNext {
      width: 200px;
      height: 50px;
      font-size: 20px;
      /* border: 0px;
      border-radius: 8px; */
      
   }
   
   .insertForm{
	margin-top: 60px;
   }
   
   .test th{
   	
   	height: 70px;
   	vertical-align: middle;
   	width: 20%;
   	text-align: center;
   	background-color: gray;
   }
   .test td{
   	vertical-align: middle;
   }
   
</style>
</head>
<script>
$(document).ready(function(){
	 
	 $.ajax({
			type:"get",
			url:"/jogong/resources/terms/sampleterm1.jsp",
			dataType:"html",
			async: false,
			success:function(res){
				
				$("div.getTerm").html(res);
				
			}
			
		});
	 
	 $.ajax({
			type:"get",
			url:"/jogong/resources/terms/sampleterm1.jsp",
			dataType:"html",
			async: false,
			success:function(res){
				
				$("div.getTerm").html(res);
				
			}
			
		});
	 
	});
	
	$(function () {
		
		//약관 동의(모두 동의)
		$("#totalAgree").on('click', function(){
			var checked = $(this).is(':checked');	
			
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
				$(".agreeForm").hide();
				$(".insertForm").show();
				$("html").scrollTop(0);
			}else{
				alert("필수 약관을 동의해주시기 바랍니다");
			}
			
		});
		
		
		$(".password1").keydown(function () {
				var pw=$(this).val();
			// 정규 표현식
				var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

			// 정규 표현식을 통과하지 못하면
			if(pw.match(regExp) == null){
				// 처리할 문장
				$("#userpw").html("형식에 맞게 입력하세요");
				$(".password2").val("");
			}else{
				$("#userpw").html("");
				$(".password2").val("");
			}
		});	
		
		$(".password2").keyup(function () {
			var check=$(this).val();
			var pw=$(".password1").val();
				
			if(pw==check){
				$("#userpw2").html("");
				
			}else{

				// 처리할 문장
				$("#userpw2").html("비밀번호가 일치하지 않습니다.");
				$("#userpw2").css("color","#FFAF00");
			}
		});	
		// 아이디 중복체크
			$(".idcheck").click(function() {
				if($(".putId").val()==""){
					$("#idCheckResult").text("다시 입력해주시기 바랍니다");
					$("#idCheckResult").css("color","red");
					return;
				}
				$.ajax({
					type:"get",
					dataType:"json",
					url:"idcheck",
					data:{"email":$(".putId").val()},
					success:function(res){
						if(res.userCount!=0){
							$("#idCheckResult").text("이미 가입된 이메일이 있습니다");
							$("#idCheckResult").css("color","red");
						}else{
							$("#idCheckResult").css("color","#FFAF00");
							$("#idCheckResult").text("사용 가능한 아이디 입니다.");
						}
					}
				});
			});
	});
	//onsubmit : submit 전에 호출
	function check(){
		if($("#idCheckResult").text()!="사용 가능한 아이디 입니다."){
			alert("아이디 중복체크를 해주세요");
			return false;
		}
		
	}
	//주소 api
	function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
         
                document.getElementById("sample4_engAddress").value = data.addressEnglish;
                       
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
	
	//휴대폰 하이픈 정규식
const autoHyphen2 = (target) => {
 target.value = target.value
   .replace(/[^0-9]/g, '')
  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}
</script>
<body>
	<div style="background-color: white;">

		<div class="userJoinTerm"> <!-- div 전체 -->
			<div class="agreeForm">
				<div class="stepBox">
					<h2>판매자 회원가입</h2>
					<ul>
						<li style="color:red; font-weight: bold; border: 1px solid red;">1.약관 동의</li>
						<li style="color:lightgray; font-weight: bold; border: 1px solid lightgray;">2.정보 입력</li>
						<li style="color:lightgray; font-weight: bold; border: 1px solid lightgray;">3.가입 완료</li>
					</ul>	
				</div>
			
			
			<div class="agreeTerm" >
				<h5>서비스 이용약관</h5>
				<hr>
				<div class="getTerm" style="width: 100%; height: 300px; border: 1px solid gray; overflow:scroll;">
					
				</div>
				<label style="float: right;"><input type="checkbox" class="agree" id="agree1"><b>[필수]</b> 조공서비스 약관 동의</label>
			</div>
			
			<div class="agreeTerm" >
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
		<!-- 정보 입력 테이블-->
		<div class="insertForm" style="display: none;">
			<!-- 단계 Step Box -->
			<div class="stepBox">
				<h2>판매자 회원가입</h2>
				<ul>
					<li style="color:lightgray; font-weight: bold; border: 1px solid lightgray;">1.약관 동의</li>
					<li style="color:red; font-weight: bold; border: 1px solid red;">2.정보 입력</li>
					<li style="color:lightgray; font-weight: bold; border: 1px solid lightgray;">3.가입 완료</li>
				</ul>	
			</div>
			<form action="insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
				<h5 style="font-weight: bold;">개인 회원가입</h5>
				<table class="table test" style="width: 100%">
					<tr style="border-top: 2px solid gray;">
						<td colspan="2">
							<div style="padding-top: 15px; padding-bottom: 15px;">
								<span style="color: red;">*</span> 표시 항목은 필수 입력 사항입니다.<br>
								정확한 정보를 입력해주시기 바랍니다.부정확한 정보 입력 시 회원탈퇴 및 이용정지 될 수 있습니다.
							</div>
						</td>
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>아이디</th>
							<td>
								<div class="input-group" style="width: 400px;">
									<input type="email" name="email" placeholder="이메일 형식으로 입력해주세요" required="required" class="form-control putId">
									<button type="button" class="btn btn-dark btn-sm idcheck">중복체크</button>
								</div>
								<div id="idCheckResult"></div>
							</td>
					</tr>
						
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>비밀번호</th>
						<td>
							<div style="width: 300px;">
								<input type="password" name="password" class="form-control password1" placeholder="영문,숫자,특수문자(최소 8자리)" required="required">
								<div id="userpw"></div>
							</div>
						</td>	
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>비밀번호 확인</th>
						<td>
							<div style="width: 300px;">
								<input type="password" class="form-control password2" placeholder="영문,숫자,특수문자(최소 8자리)" required="required">
								<div id="userpw2"></div>
							</div>	
						</td>	
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>이름</th>
						<td>
							<div style="width: 300px;">
								<input type="text" name="nickname" class="form-control" required="required">
							</div>
						</td>		
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>생년월일</th>
						<td>
							<div style="width: 300px;">
								<input type="date" name="date" class="form-control" placeholder="(-)없이 HP번호만 입력" required="required">
							</div>							
						</td>	
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>성별</th>
						<td>
							<input type="radio" name="gender" value="1">남 <input type="radio" name="gender" value="2" required="required">여<br/>

						</td>		
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>휴대폰번호</th>
						<td>
							<div style="width: 300px;">
								<input type="text" oninput="autoHyphen2(this)" name="phone" maxlength="13" placeholder="전화번호를 입력하세요" required="required" class="form-control">
							</div>
						</td>	
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>주소</th>
						<td>
							<div class="input-group" style="width: 300px;">
								<input type="text" id="sample4_postcode" name="addressNum" placeholder="우편번호" class="form-control" style="width: 40%; margin-bottom: 5px;" required="required">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-dark btn-sm">
							</div>
							<div style="width: 500px;">
								<input type="text" id="sample4_roadAddress" name="addressMain" placeholder="도로명주소" size="60" class="form-control" style="margin-bottom: 5px;">
								<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="60" class="form-control">
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" id="sample4_detailAddress" name="address" placeholder="상세주소"  size="60" class="form-control">
								<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60" class="form-control">
								<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" class="form-control">
							</div>
						</td>	
					</tr>
					<tr>
						<td colspan="2" align="center" style="border-bottom: none;"><br>
							<button class="btnNext btn btn-outline-secondary">확인</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
			
	</div> <!-- 전체 div : userJoinTerm 종료 -->
	
	</div>
</body>
</html>