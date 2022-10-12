<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    
    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	
	<!-- bootstrap 5 icon -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    
    <!-- 주소api -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    
</head>
<style>
	a.menu-profile {
    	color:#000 !important;
	}
	div.update-top>hr{
		width: 120px; 
		height: 10px; 
		position: relative; 
		top:-28px; 
		color: #cff0cc; 
		opacity: 1; 
		z-index: -1;
	}
	b.update-top-b2 {
		font-size: 25px;
		font-weight: 1000;
	}
	
	div.update-top {
		padding: 25px 0;
		position:sticky;
		top:100px;
		background-color: white;
		height: 90px;
	}
</style>
<body>
	<c:if test="${sessionScope.loginType=='일반'}">
	<div class="updateForm">
		<div class="update-top">
			<b class="update-top-b2">프로필 수정</b>
			<hr>
		</div>
				<div class="pwCheckSuccess" style="width: 400px; margin-top: 10%; margin-left: 18%;">
					<h4 style="float: left;">비밀번호 확인</h4>
				
					<input type="text" class="form-control id" required disabled value="${sessionScope.loginid}">
					<input type="password" class="form-control password" required placeholder="비밀번호"><br>
					<button type="button" class="btn btn-outline-secondary pwCheck" style="margin-left: 170px;">확인</button>
				</div>	
	
		<div class="update-content" style="display: none;">
				<form action="update" method="post" enctype="multipart/form-data">
				
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
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>프로필이미지</th>
						<td>
							<div style="width: 300px;">
								<input type="file" name="upload" class="form-control" >
							</div>
						</td>
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;" ><span style="color: red;">*</span>아이디</th>
							<td>
								<div class="input-group" style="width: 400px;">${list.email }</div>
							</td>
					</tr>	
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>비밀번호</th>
						<td>
							<div style="width: 300px;">
								<input type="password" name="password" class="form-control password1" required="required">
								<div id="userpw"></div>
							</div>
						</td>	
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>비밀번호 확인</th>
						<td>
							<div style="width: 300px;">
								<input type="password" class="form-control password2" required="required">
								<div id="userpw2"></div>
							</div>	
						</td>	
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>이름</th>
						<td>
							<div style="width: 300px;">
								<input type="text" name="nickname" class="form-control" required="required" value="${list.nickname }">
							</div>
						</td>		
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>생년월일</th>
						<td>
							<div style="width: 300px;">
								${list.year }${list.date}
							</div>							
						</td>
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>성별</th>
						<td>
							${list.gender==2?"여":"남" }

						</td>		
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>휴대폰번호</th>
						<td>
							<div style="width: 300px;">
								<input type="text" oninput="autoHyphen2(this)" name="phone" value="${list.phone }" required="required" class="form-control" pattern=".{13,13}" >
							</div>
						</td>	
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>주소</th>
						<td>
							<div class="input-group" style="width: 300px;">
								<input type="text" id="sample4_postcode" name="addressNum" value="${addressNumber }" class="form-control" style="width: 40%; margin-bottom: 5px;" required="required">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-dark btn-sm">
							</div>
							<div style="width: 500px;">
								<input type="text" id="sample4_roadAddress" name="addressMain" value="${address }" size="60" class="form-control" style="margin-bottom: 5px;">
								<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"  size="60" class="form-control">
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" id="sample4_detailAddress" name="address" placeholder="상세주소"  size="60" class="form-control">
								<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  size="60" class="form-control">
								<input type="hidden" id="sample4_engAddress" placeholder="영문주소"  size="60" class="form-control">
							</div>
						</td>	
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>상태메세지</th>
						<td>
							<div class="input-group" style="width: 300px;">
								<input type="text" name="status" value="${list.status }" class="form-control" style="width: 40%; margin-bottom: 5px;" required="required" pattern=".{1,20}">
							</div>
						</td>	
					</tr>
					<tr>
						<td colspan="2" align="center" style="border-bottom: none;"><br>
							<button type="submit" class="btnNext btn btn-outline-secondary">확인</button>
						</td>
					</tr>
				</table>
			</form>
	
		</div>
	</div>
	</c:if>
	<c:if test="${sessionScope.loginType!='일반'}">
	<div class="updateForm">
		<div class="update-top">
			<b class="update-top-b2">프로필 수정</b>
			<hr>
		</div>
		<div class="update-content">
				<form action="updateSocialUser" method="post" enctype="multipart/form-data">
				
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
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>프로필이미지</th>
						<td>
							<div style="width: 300px;">
								<input type="file" name="upload" class="form-control" >
							</div>
						</td>
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;" ><span style="color: red;">*</span>아이디</th>
							<td>
								<div class="input-group" style="width: 400px;">${list.email }</div>
							</td>
					</tr>	
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>이름</th>
						<td>
							<div style="width: 300px;">
								<input type="text" name="nickname" class="form-control" required="required" value="${list.nickname }">
							</div>
						</td>		
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>생년월일</th>
						<td>
							<div style="width: 300px;">
								${list.date}
							</div>							
						</td>
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>성별</th>
						<td>
							${list.gender==2?"여":"남" }

						</td>		
					</tr>
					<tr>
						<th style="background-color: #f5f5f5;"><span style="color: red;">*</span>상태메세지</th>
						<td>
							<div class="input-group" style="width: 300px;">
								<input type="text" name="status" value="${list.status }" class="form-control" style="width: 40%; margin-bottom: 5px;" required="required" pattern=".{1,20}">
							</div>
						</td>	
					</tr>
					<tr>
						<td colspan="2" align="center" style="border-bottom: none;"><br>
							<button type="submit" class="btnNext btn btn-outline-secondary">확인</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</c:if>
</body>
<script type="text/javascript">
$(".pwCheck").click(function(){
	var email=$(".id").val();
	var pass=$(".password").val();
	
	 $.ajax({
		type:"post",
		url:"passwordCheck",
		dataType:"json",
		data:{"email":email,"password":pass},
		success:function(res){
			if(res.result=="fail"){
				alert("아이디나 비밀번호가 틀렸습니다");
			}else{
				$(".pwCheckSuccess").hide();
				$(".update-content").show();
			}
					
		},
	});//ajax 종료 
});//로그인 버튼 이벤트 종료
	
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
</script>
</html>