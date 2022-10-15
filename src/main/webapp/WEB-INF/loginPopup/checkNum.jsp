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
	@font-face {
    font-family: 'SeoulNamsanM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulNamsanM.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	body * {
		 font-family: 'SeoulNamsanM';
		 word-spacing: -1px;
	}
	
	.randomNumCheck{
		width: 100%;
		height: 330px;
		text-align: center;
		padding-top: 50px;
	}
	
	.updatePass{
		width: 100%;
		height: 330px;
		text-align: center;
		padding-top: 50px;
	}
</style>

<script type="text/javascript">
$(function () {
	
	alert("인증번호를 메일로 발송했습니다");
	
	//인증번호 검증
	$(".numCheck").click(function () {
		
		var num=$(".num").val();
		var randomNum=$(".randomNum").val().trim();
		//alert(num);
		
		if(num==randomNum){
			$(".randomNumCheck").hide();
			$(".updatePass").show();
			
		}else{
			alert("인증번호가 틀립니다");
			$(".randomNum").val("");
		}
		
	})//numCheck 종료

	
	
	
	//확인(전송) 버튼
	$("#btnSend").click(function () {
	
		var email='${sessionScope.email}';
		var password=$(".pass1").val();
		
		//alert(email + password);
		
		$.ajax({
			type:"get",
			dataType:"text",
			url:"../searchPass2",
			data:{"email":email,"password":password},
			success:function(res){
				alert("비밀번호가 변경되었습니다");
				close();
				
			}, error: function (request, status, error) {
		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText)
		        console.log("error: " + error);
		    }

			
		}); //ajax 종료
	
	}); //전송(클릭) 이벤트 종료
	
	
	$(".pass1").keyup(function () {
		var pw=$(this).val();
	// 정규 표현식
		var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

	// 정규 표현식을 통과하지 못하면
		if(pw.match(regExp) == null){
		// 처리할 문장
			$("#psCheck").html("형식에 맞게 입력하세요");
			$(".pass2").val("");
		}else{
			$("#psCheck").html("");
			$(".pass2").val("");
		}
	});	

	$(".pass2").keyup(function () {
		var check=$(this).val();
		var pw=$(".pass1").val();
		
		if(pw==check){
			$("#psCheck1").html("");
		
		}else{

			// 처리할 문장
			$("#psCheck1").html("비밀번호가 일치하지 않습니다.");
			$("#psCheck1").css("color","#FFAF00");
		}
	});	
	
	
})
</script>
</head>
<body>
	<div class="randomNumCheck">
		<h3>인증번호 확인</h3>
		<hr style="width: 130px; height: 10px; position: relative; top:-25px; left:156px; color: #cff0cc; opacity: 1; z-index: -1;">
		<input type="hidden" class ="num" value="${num }">
			인증번호: <input type="text" class="randomNum" placeholder="인증번호">
		<button class="numCheck">확인</button>
	</div>
		
	
	<div class="updatePass" style="display: none;">
		<h3>비밀번호 재설정</h3>
		<hr style="width: 150px; height: 10px; position: relative; top:-25px; left:148px; color: #cff0cc; opacity: 1; z-index: -1;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호: <input type="password" class="pass1" name="password" placeholder="영문,숫자,특수문자(최소 8자리)" required="required"><br>
		<div id="psCheck" style="font-size: 13px;margin-left: 50px;"></div>
		비밀번호 확인: <input type="password" class="pass2" placeholder="영문,숫자,특수문자(최소 8자리)" style="margin-top: 5px;" required="required"><br>
		<div id="psCheck1" style="font-size: 13px;margin-left: 88px;"></div>
		<br>
		<button class="btn btn-outline-secondary" id="btnSend">확인</button>
	</div>
	
</body>

</html>
