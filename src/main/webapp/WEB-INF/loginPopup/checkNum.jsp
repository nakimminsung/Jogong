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
			dataType:"html",
			url:"searchPass",
			data:{"email":email,"password":password},
			success:function(res){
				
				alert('비밀번호가 변경되었습니다.');
				
				close();
			}
			
		}); //ajax 종료
	
	}); //전송(클릭) 이벤트 종료
	
})
</script>
</head>
<body>
	<div class="randomNumCheck">
		<input type="hidden" class ="num" value="${num }">
			인증번호: <input type="text" class="randomNum">
		<button class="numCheck">확인</button>
	</div>
		
	<div class="updatePass" style="display: none;">
		비밀번호: <input type="password" class="pass1" name="password" placeholder="영문,숫자,특수문자(최소 8자리)" required="required"><br>
		비밀번호 확인: <input type="password" class="pass2" placeholder="영문,숫자,특수문자(최소 8자리)" required="required"><br>
		
		<button class="btn btn-secondary" id="btnSend">확인</button>
	</div>
</body>

</html>
