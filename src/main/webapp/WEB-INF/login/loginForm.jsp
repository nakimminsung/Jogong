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
		
	}
	
	div.all{
		width: 100%;
		height: 500px;
		/* padding-top: 50px;
		padding-left: 200px; */
		margin-top: 100px;
		padding-left: 35%;
		padding-right: 35%;
		text-align: center;
	}
	
	.userTextBox{
		margin-bottom: 10px;
	}
	
	.sellerTextBox{
		margin-bottom: 10px;
	}
	
	button.loginok{
		width: 100%;
		height: 50px;
		
		border-radius: 8px;
		/* 
		color: white;
		 */
		font-weight: bold;
		margin-top: 20px;
		background-color: #ef3e43;
	}
	
	button.btnLoginSeller{
		width: 100%;
		height: 50px;
		
		border-radius: 8px;
		/* 
		color: white;
		 */
		font-weight: bold;
		margin-top: 20px;
		background-color: #ef3e43;
	}
	
	div.snsLoginBox{
		width: 100%;
		margin-top: 15px;
		justify-content: space-between;
	}
	
	div.snsLoginBox button{
		width: 47%;
		height: 40px;
		border: 0px;
		border-radius: 8px;
		font-weight: bold;
	}

</style>
</head>
<script>
$(document).ready(function(){
	
	/* 판매회원 로그인 폼 숨기기 */
	$(".sellerLoginBox").hide();
	
	/* 판매회원 로그인 버튼 클릭 이벤트 */
	$(".btnChange1").click(function () {
		
		$(".userLoginBox").hide();
		
		
		$(".sellerLoginBox").show();
	});
	
	/* user 로그인 버튼 클릭 이벤트 */
	$(".btnChange2").click(function () {
		
		$(".sellerLoginBox").hide();
		
		
		$(".userLoginBox").show();
	});
	
	
});
</script>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<div style="background-color: white;">
		
		<div class="all">
		
			<!-- 일반회원 로그인 박스 -->
			<div class="userLoginBox">
				
				<!-- 판매자 로그인 전환 버튼 -->
				<div class="top">
					<h3 style="float: left;">로그인</h3>
					<button type="button" class="btnChange1 btn-sm btn-dark" style="float: right; margin-bottom: 5px;">판매회원 전환</button>
				</div>
				
				<!-- user 로그인 정보 -->
				<input type="email" class="form-control userTextBox" required placeholder="아이디(이메일 형식)" id="userEmail" value="${rememberId=='yes' ? savedId : ''}">
				<input type="password" class="form-control userTextBox" required placeholder="비밀번호" id="userPassword">
				<label style="float: left;"><input type="checkbox" class="form-check-input checkUser" id="rememberId" ${rememberId=='yes' ? 'checked' : ''}> 아이디 저장</label>		
				<button type="button" class="loginok btn btn-danger" id="loginok" >로그인</button>
				<hr>
				
				<!-- 소셜회원 로그인 박스 -->
				<div class="snsLoginBox">
					<button class="btnKakaoLogin" style="background-color: #fde102;"><i class='fas fa-comment'></i> 카카오로 로그인</button>&nbsp;&nbsp;&nbsp;
					<!-- <button class="btnNaverLogin" style="background-color: #19ce60; color: white;">N 네이버로 로그인</button> -->
					<button class="btnKakaoLogout" style="background-color: #19ce60; color: white;" onclick="kakaoLogout()">카카오 로그아웃</button>
				</div>

			</div>	

				
			<!-- 판매회원 로그인 박스 -->
			<div class="sellerLoginBox">
			
				<!-- user 로그인 전환 버튼 -->
				<div class="top">
					<h3 style="float: left;">판매 회원 로그인</h3>
					<button type="button" class="btnChange2 btn-sm btn-dark" style="float: right; margin-bottom: 5px;">일반회원 전환</button>
				</div>
			
				
				<input type="email" class="form-control sellerTextBox" required placeholder="아이디(이메일 형식)" id="sellerEmail" value="${rememberSellerId=='yes' ? savedSellerId : ''}">
				<input type="password" class="form-control sellerTextBox" required placeholder="비밀번호" id="sellerPassword">
				<label style="float: left;"><input type="checkbox" class="form-check-input checkSeller" id="rememberSellerId" ${rememberSellerId=='yes' ? 'checked' : ''}> 아이디 저장</label>
				
				<button type="button" class="btnLoginSeller btn btn-danger">로그인</button>
				
			</div>
			 
			
			
			<!-- 
			<button type="button" class="btnSellerLogin btn btn-outline-secondary">판매 회원 로그인</button>
			 -->
		</div> <!-- div.all 종료 -->
		
		
		

	</div> <!-- 전체 div 종료 -->
</body>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>	<!-- 카카오 로그인 관련 -->
<script>
	
	//카카오 로그인 버튼 이벤트
	$(".btnKakaoLogin").click(function () {
		location.href='javascript:kakaoLogin();';
	});

	//카카오 로그인 관련 메서드
	window.Kakao.init('d4fc125a7dd0ad8b599aeac52a278521');	//본인 자바스크립트 API키

    function kakaoLogin() {
        window.Kakao.Auth.login({
            scope: 'profile_nickname, profile_image, account_email, gender, birthday', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
            success: function(response) {
                
            	console.log(response) // 로그인 성공하면 받아오는 데이터
                
                window.Kakao.API.request({ // 사용자 정보 가져오기 
                    url: '/v2/user/me',
                    success: (res) => {
                        const kakao_account = res.kakao_account;
                        console.log(kakao_account)
                        
                        let profile_nickname = kakao_account.profile.nickname;
                        let profile_image = properties.profile_image;
                        let email = kakao_account.email;
                        let gender = kakao_account.gender;
                        let birthday = kakao_account.birthday;
                        
                        console.log(profile_nickname);
                        console.log(profile_image);
                        console.log(email);
                        console.log(gender);
                        console.log(birthday);
                        
                    }
                });
            	
                //window.location.href='http://localhost:9000/jogong/loginForm' //리다이렉트 되는 코드
            },
            fail: function(error) {
                console.log(error);
            }
        });
    }
	
	
	//카카오 로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	           console.log(response)
	           window.location.href='http://localhost:9000/jogong/'
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	      
	    }
	  }  


	//user 로그인 버튼
	$("#loginok").click(function(){
		var id=$("#userEmail").val();
		var pass=$("#userPassword").val();
		var rememberId=$("#rememberId").is(':checked');

		$.ajax({
			type:"post",
			url:"userLogin",
			dataType:"json",
			data:{"email":id,"password":pass,"rememberId":rememberId},
			success:function(res){
				if(res.result=="fail"){
					alert("아이디나 비밀번호가 틀렸습니다");
				}else{
					location.href="http://localhost:9000/jogong/";
				}
						
			},
		});//ajax 종료
	});//로그인 버튼 이벤트 종료
	
	
	//seller 로그인 버튼
	$(".btnLoginSeller").click(function () {
		
		//아이디와 비밀번호 읽어오기
		var email=$("#sellerEmail").val();
		var password=$("#sellerPassword").val();
		var root='${root}';
		console.log("root : "+root);
		
		var rememberSellerId=$("#rememberSellerId").is(':checked');
		
		$.ajax({
			type:"post",
			url:root+"/sellerLogin",
			dataType:"json",
			data:{"email":email,"password":password,"rememberSellerId":rememberSellerId},
			success:function(res){
				if(res.result=='fail'){
					alert("ID 혹은 비밀번호가 맞지 않습니다");
				}else{
					location.href='${root}';
				}
				
			}
			
		});	//ajax 종료
	});	//로그인 버튼 이벤트 종료
	
	
</script>
</html>