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
		margin-top: 40px;
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
		margin-top: 40px;
		background-color: #ef3e43;
	}
	
	div.snsLoginBox{
		width: 100%;
		margin-top: 15px;
		display: flex;
		justify-content: space-around;
	}
	
	div.snsLoginBox button{
		width: 45%;
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
			<div class="userLoginBox" style="min-width: 512px;">
				
				<!-- 판매자 로그인 전환 버튼 -->
				<div class="top">
					<h3 style="float: left;">로그인</h3>
					<button type="button" class="btnChange1 btn-sm btn-dark" style="float: right; margin-bottom: 5px;">판매회원 전환</button>
				</div>
				
				<!-- user 로그인 정보 -->
				<input type="email" class="form-control userTextBox" required placeholder="아이디(이메일 형식)" id="userEmail" value="${rememberId=='yes' ? savedId : ''}">
				<input type="password" class="form-control userTextBox" required placeholder="비밀번호" id="userPassword">
				<div style="display: flex; justify-content: space-between;">
					<label style="float: left;"><input type="checkbox" class="form-check-input checkUser" id="rememberId" ${rememberId=='yes' ? 'checked' : ''}> 아이디 저장</label>
					
					<div style="float: right;">
						<a href="javascript:openWindowPop('http://localhost:9000/jogong/loginForm/searchId', '아이디 찾기')" style="border-bottom: 1px solid black; cursor: pointer;">아이디 찾기</a>&nbsp;/
						<a href="javascript:openWindowPop('http://localhost:9000/jogong/loginForm/searchPass', '비밀번호 찾기')" style="border-bottom: 1px solid black; cursor: pointer;">비밀번호 찾기</a>
					</div>
				</div>	
				<button type="button" class="loginok btn btn-danger" id="loginok" >로그인</button>
				<hr style="margin-top: 30px; margin-bottom: 30px; ">
				
				<!-- 소셜회원 로그인 박스 -->
				<div class="snsLoginBox" style="display: flex; justify-content: space-between; flex-wrap: nowrap;">
					
					<!-- 카카오 로그인 버튼 -->
					<button class="btnKakaoLogin" style="background-color: #fde102; height: 50px; min-width: 230px;"><i class='fas fa-comment'></i>  카카오 아이디로 로그인</button>&nbsp;&nbsp;
					
					<!-- 네이버 로그인 버튼이 생기는 영역 -->
					<div id="naverIdLogin" style="min-width: 230px;"></div>
					<!-- <button class="btnNaverLogin" style="background-color: #03c75a; height: 50px; color: white;">N 네이버 아이디로 로그인</button> -->

				
				
				</div>	<!-- 소셜 로그인 div 종료 -->

			</div>	<!-- 일반 회원 div 종료 -->

			
			
			
			
				
			<!-- 판매회원 로그인 박스 -->
			<div class="sellerLoginBox">
			
				<!-- user 로그인 전환 버튼 -->
				<div class="top">
					<h3 style="float: left;">판매 회원 로그인</h3>
					<button type="button" class="btnChange2 btn-sm btn-dark" style="float: right; margin-bottom: 5px;">일반회원 전환</button>
				</div>
				
				<input type="email" class="form-control sellerTextBox" required placeholder="아이디(이메일 형식)" id="sellerEmail" value="${rememberSellerId=='yes' ? savedSellerId : ''}">
				<input type="password" class="form-control sellerTextBox" required placeholder="비밀번호" id="sellerPassword">
				
				<div style="display: flex; justify-content: space-between;">
					<label style="float: left;"><input type="checkbox" class="form-check-input checkSeller" id="rememberSellerId" ${rememberSellerId=='yes' ? 'checked' : ''}> 아이디 저장</label>
					
					<div style="float: right;">
						<a href="#" onclick="sellerAlert()" style="border-bottom: 1px solid black; cursor: pointer;">아이디 / 비밀번호 찾기</a>
					</div>
				</div>
				
				
				<button type="button" class="btnLoginSeller btn btn-danger">로그인</button>
				
			</div>
		</div> <!-- div.all 종료 -->
		
		
		

	</div> <!-- 전체 div 종료 -->
</body>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>	<!-- 카카오 로그인 관련 -->
<!-- 네이버 로그인 관련 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>
	
	//판매회원 아이디 비번찾기 alert
	function sellerAlert() {
		
		alert("영업 담당자에게 문의해주시기 바랍니다.");
	}
	

	// 네아로 로그인 정보를 초기화하기 위하여 init을 호출
	naverLogin.init();
	
	// 초기화할 때 로그아웃
	naverLogin.logout();
	
	
	//네이버 로그인 정보 가져와서 담기
	naverLogin.getLoginStatus(function (status) {
      if (status) {
		let nickname=naverLogin.user.getName();
		let email=naverLogin.user.getEmail();
		let image=naverLogin.user.getProfileImage();
		let gender=naverLogin.user.getGender=="F"?"2":"1";
		let oldbirthday=naverLogin.user.getBirthday();
		let birthday=oldbirthday.replace(/-/g, "");
		 
		
		//회원가입 or 로그인을 위한 Data 전달
		$.ajax({  
			type:"post",
			url:"userNaverLogin",	//LoginController
			dataType:"json",
			data:{"email":email,"nickname":nickname,"profileImage":image,"gender":gender,"date":birthday},         
			success:function(ok){

				location.href="/jogong/";

			},error : function(xhr, status, error){  	// 필요한 정보 못가져올 경우 일반회원폼 이동

				alert("필요한 정보를 가져올 수 없어 일반 회원가입으로 이동합니다");
				location.href="/jogong/join/userAgree";	
			}//error
	
		});//ajax 종료
 
		
 		console.log(email);
 
		}	//if 종료
	});	//naverLogin.getLoginStatus 종료
	
	//console.log(naverLogin);

	
	
	
	//카카오 로그인 버튼 이벤트
	$(".btnKakaoLogin").click(function () {
		location.href='javascript:kakaoLogin();';
	});

	//카카오 회원가입&로그인 관련 메서드
	window.Kakao.init('d4fc125a7dd0ad8b599aeac52a278521');	//본인 자바스크립트 API키

    function kakaoLogin() {
        window.Kakao.Auth.login({
            scope: 'profile_nickname, profile_image, account_email, gender, birthday', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
            success: function(response) {  
            	//console.log(response) // 로그인 성공하면 받아오는 데이터
                
                window.Kakao.API.request({ // 사용자 정보 가져오기 
                    url: '/v2/user/me',
                    success: (res) => {

                         let email= res.kakao_account.email;
                         let birthday = res.kakao_account.birthday;
                         let nickname = res.properties.nickname;
                         let image = res.properties.profile_image;
                         let gender = (res.kakao_account.gender=="female"?"2":"1");

                        //console.log(kakao_email+"/"+kakao_birthday+"/"+kakao_nickname+"/"+kakao_image+"/"+kakao_gender);
                        	
                				$.ajax({  
            	        			type:"post",
            	        			url:"userKakaoLogin",
            	        			dataType:"json",
            	        			data:{"email":email,"nickname":nickname,"profileImage":image,"gender":gender,"date":birthday},          
            	        			success:function(ok){
            	       					location.href="/jogong/";	

                					},error : function(xhr, status, error){  	// 카카오로그인에서 필요한 정보 못가져올 경우 일반회원폼 이동

            							alert("필요한 정보를 가져올 수 없어 일반 회원가입으로 이동합니다");
            							location.href="/jogong/join/userAgree";	
            						}//error
                			
                			});//ajax
                 	   }//success
                });//request
            	
          	  },
           	fail: function(error) {
            console.log(error);
           }
       });
   }// kakaoLogin()

	//user 로그인 버튼
	$("#loginok").click(function(){
		var email=$("#userEmail").val();
		var pass=$("#userPassword").val();
		var rememberId=$("#rememberId").is(':checked');

		$.ajax({
			type:"post",
			url:"userLogin",
			dataType:"json",
			data:{"email":email,"password":pass,"rememberId":rememberId},
			success:function(res){
				if(res.result=="fail"){
					alert("아이디나 비밀번호가 틀렸습니다");
				}else{
					location.href="/jogong/";
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
	
	
	
	//윈도우팝업 테스트
	function openWindowPop(url, name){
        var options = 'top=100, left=600, width=500, height=300, status=no, menubar=no, toolbar=no, resizable=no';

        window.open(url, name, options);
    }
	
	
	
</script>
</html>