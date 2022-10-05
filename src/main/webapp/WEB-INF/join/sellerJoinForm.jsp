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
	
	.subText{
   		/* margin-top: 10px; */
   		margin-bottom: 5px;
   		color: gray;
   		font-size: 12px;
   }
   
   b {
		color: red;
	}
	
	.insertForm th{
		width: 160px;
		background-color: #dcdcdc;
		
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
	$(function () {
		
		//password1 에 입력했을때
		$(".password1").keydown(function () {
			var pw=$(this).val();
			
			// 정규 표현식
			var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

			if(pw.match(regExp) == null){
				
				// 정규 표현식을 통과하지 못하면
				$("#sellerPass1").html("형식에 맞게 입력하세요");
				
			}else{
				
				// 정규 표현식을 통과하면
				$("#sellerPass1").html("");
			}
		});	
		
		//password2 에 입력했을때
		$(".password2").keyup(function () {

			var check=$(this).val();
			var pw=$(".password1").val();
				
			if(check.match(pw) == null){
				// 처리할 문장
				$("#sellerPass2").html("비밀번호가 일치하지 않습니다.");
				$("#sellerPass2").css("color","#FFAF00");
				
			}else{
				$("#sellerPass2").html("");
			}
		});			
		
		//onsubmit : submit 하기 직전에 호출되는 메서드
		//해당 메서드 조건을 통과해야 submit 할 수 있음
		function check(){
			
			//사용 가능한 아이디 입니다. 가 없으면 alert 띄우기
			if($("#idCheckResult").text()!="사용 가능한 아이디 입니다."){
				
				alert("아이디 중복체크를 해주세요");
				
				return false;
			}
			
		} // check() 메서드 종료
		
		
		// id 중복 체크 버튼 클릭 이벤트
		$(".idcheck").click(function() {
			
			//이메일 입력란이 공란일 때
			if($(".putId").val()==""){
				$("#idCheckResult").text("다시 입력해주시기 바랍니다");
				$("#idCheckResult").css("color","red");
				
				return;
			}
			
			$.ajax({
				type:"get",
				dataType:"json",
				url:"idcheck",	//joinController -> ... -> userMapper
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
			}); //ajax 종료
		}); //중복 체크 이벤트 종료
		
		
	});// $function 종료

</script>
<body>
<!-- <div style="background-color: #f5f5f5;"> -->
<div style="background-color: white;">

	<div class="all">
		
		<!-- 단계 Step Box -->
		<div class="stepBox">
			<h2>판매자 회원가입</h2>
			<ul>
				<li style="color:lightgray; font-weight: bold; border: 1px solid lightgray;">1.약관 동의</li>
				<li style="color:red; font-weight: bold; border: 1px solid red;">2.정보 입력</li>
				<li style="color:lightgray; font-weight: bold; border: 1px solid lightgray;">3.가입 완료</li>
			</ul>	
		</div>
		
		<!-- table 전체 -->
		<div style="margin-top: 50px;">
			
			<form action="sellerJoinComplete" method="post" enctype="multipart/form-data" id="nextForm" onsubmit="return check()">
			<table style="width: 100%;" class="table insertForm">
				
				<tr style="border-bottom: 1px solid black;">
					<td colspan="2">
						<h5 style="font-weight: bold">사업자 회원 정보입력</h5>
					</td>
				</tr>
				
				<!-- subtext -->
				<tr>
					<td colspan="2">
						<div class="subText">
							<b>*</b> 표시 항목은 필수 입력 사항입니다.<br>
							&nbsp;&nbsp;정확한 정보를 입력해주시기 바랍니다. 부정확한 정보 입력 시 회원탈퇴 및 이용정지될 수 있습니다.
						</div>
					</td>
				</tr>
				
				<tr>
					<th><b>*</b> 아이디</th>
					<td>
						<input type="email" placeholder="이메일 형식으로 입력" style="width: 50%;" required name="email" class="putId">
						<button type="button" class="btn btn-dark btn-sm idcheck">중복 확인</button>
						<div id="idCheckResult"></div>
					</td>
				</tr>

				<tr>
					<th><b>*</b> 비밀번호</th>
					<td>
						<input type="password" placeholder="영문, 숫자, 특수문자 8~16자" style="width: 50%;" required
						 name="password" class="password1">
						 <div id="sellerPass1"></div>
						
					</td>
				</tr>

				<tr>
					<th><b>*</b> 비밀번호 확인</th>
					<td>
						<input type="password" placeholder="영문, 숫자, 특수문자 8~16자" style="width: 50%;" required
						 class="password2">
						<div id="sellerPass2"></div>
					</td>
				</tr>

				<tr>
					<th><b>*</b> 담당자 연락처</th>
					<td>
						<input type="text" style="width: 50%;" placeholder="010-1234-5678" required name="phone">
						
					</td>
				</tr>
				
				<!-- 공간 분리 -->
				<tr>
					<td colspan="2" style="height: 50px;"></td>
				</tr>
				
				<!-- 사업자 정보 -->				
				<tr style="border-bottom: 1px solid black;">
					<td colspan="2">
						<h5 style="font-weight: bold">실명 및 가입 여부 확인</h5>
					</td>
				</tr>
				
				<!-- subtext -->
				<tr>
					<td colspan="2">
						<div class="subText">
							사업자 등록번호를 입력하여 가입여부를 확인 후 신청 가능합니다.<br>
							정상적인 사업자등록번호를 입력했으나, 실명확인에 문제가 있는 경우, NICE신용평가정보㈜를 참고해 주시기 바랍니다.
						</div>
					</td>
				</tr>
				
				<tr>
					<th><b>*</b> 개인 / 법인명</th>
					<td>
						<input type="text" style="width: 50%;" required name="companyName">
						
					</td>
				</tr>
				
				<tr>
					<th>
						<b>*</b> 사업자 등록번호
					</th>
					<td style="padding-left: 10px;">
						<input type="text" id="businessNumber" style="width: 50%;" placeholder="숫자만 입력" required name="businessNumber">

						<button type="button" class="btn btn-dark btn-sm" style="width: 105px;">사업자 인증</button>
					</td>
				</tr>
				
				<tr>
					<th><b>*</b> 사업장 주소</th>
					<td>
						<input type="text" id="sample4_postcode" placeholder="우편번호" style="width: 50%; margin-bottom: 5px;" required>
						<input type="button" onclick="sample4_execDaumPostcode()" class="btn btn-dark btn-sm" value="우편번호 찾기" style=" margin-bottom: 5px;"><br>
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" size="60" 
						style="width: 50%; margin-bottom: 5px;" required name="address1"><br>
						
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="60">
						<span id="guide" style="color:#999; display:none"></span>
						<input type="text" id="sample4_detailAddress" placeholder="상세주소"  size="60" 
						style="width: 50%;"required name="address2"><br>
						
						<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60">
						<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" >
					</td>
				</tr>
								
				<tr>
					<td colspan="2">
						<div class="subText">
							동일한 판매자의 중복 상품 등록 남용, 판매자 등급별 상품등록 수량 제한규정 우회 등의 악용 사례를 막기 위해 <br>
		  					현재 조공 판매자 관련 정책상 이미 가입한것으로 판단되는 판매자는 사업자번호가 다르더라도 추가 입점이 제한될 수 있습니다.
						</div>
					</td>
				</tr>
				
				<tr>
					<th><b>*</b> 정산 계좌은행</th>
					<td>
						<select name="bank" required>
	                        <option value="" disabled selected style="display: none;">은행을 선택하세요</option>
	                        <option value="국민">국민은행</option>
	                        <option value="기업">기업은행</option>
							<option value="하나">하나은행</option>
							<option value="신한">신한은행</option>
							<option value="우리">우리은행</option>
							<option value="외환">외환은행</option>
	                        <option value="수협">수협중앙회</option>
	                        <option value="신협">신협중앙회</option>
	                        <option value="우체국">우체국</option>
	                        <option value="케이">케이뱅크</option>
	                        <option value="카카오">카카오뱅크</option>
	                        
						</select>
						
					</td>
				</tr>
				
				<tr>
					<th><b>*</b> 정산 계좌번호</th>
					<td>
						<input type="text" style="width: 50%;" required name="accountNumber">
						
					</td>
				</tr>
				
			</table>
			
			</form>
		</div> <!-- form table 묶은 div 종료 -->
		
		<!-- 다음 버튼 -->
		<div style="text-align: center; margin-top: 40px; font-weight: bold; height: 50px;">
			<button type="submit" form="nextForm" class="btnNext btn btn-outline-secondary">다음</button>
		</div>
		
	</div> <!-- div.all -->

</div>
</body>

<script type="text/javascript">

	/* //중복체크 버튼 클릭 시 ID체크
	$("#btnidcheck").click(function () {
		
		$.ajax({
			type:"get",
			dataType:"json",
			url:"idcheck",
			data:{"id":$("#loginid2").val()},	//loginid가 충돌나는 현상있어서 2로바꿈
			success:function(res){
				
				if(res.count==0){
					$("div.idsuccess").text("ok");	
				}else{
					$("div.idsuccess").text("fail");
				}
				
			}	//res
			
		}); //ajax
	});	//id체크
	 */
	
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
	
	
		//다음 주소검색 API
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
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

	
</script>

</html>