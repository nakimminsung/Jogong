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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>


<style>
	*{
		/* font-family: 'Jua'; */
	}
	
	div.joinMain{
		width: 500px;
		height: 500px;
		margin: 70px auto;
		text-align: center;
	}
	
	div.joinPersonal{
		width: 500px;
		height: 260px;
	}
	
	h2.joinTitle{
		font-weight: bold;
	}
	
	button.btnJoin{
		width: 500px;
		height: 50px;
		
		border: 0px;
		border-radius: 8px;
		/* 
		color: white;
		 */
		font-weight: bold;
		
		background-color: #ef3e43;
	}
	
	div.snsJoin{
		width: 100%;
		margin-top: 30px;
		justify-content: space-between;
	}
	
	div.snsJoin button{
		width: 230px;
		height: 40px;
		border: 0px;
		border-radius: 8px;
		font-weight: bold;
	}
	
	button.btnSeller{
		width: 500px;
		height: 50px;
		border-radius: 8px;
		/* 
		border: 1px solid gray;
		background-color: white;
		 */
		font-weight: bold;
	}

</style>
</head>
<body>

<div style="background-color: white;">

	<!-- 전체 div -->
	<div class="joinMain">
	
	
	<div class="joinPersonal">
		<h2 class="joinTitle">조공 회원가입</h2>
		<p style="margin-top: 20px;">지금 회원가입 하신 후 조공에서 다양한 서비스를 경험해보세요</p>
		<button class="btnJoin btn btn-danger" onclick="location.href = '../join/userAgree'" >개인 회원가입</button>
		
		<div class="snsJoin input-group">
			<button class="btnKakao" style="background-color: #fde102; height: 50px;"><i class='fas fa-comment'></i>  카카오 아이디로 로그인</button>&nbsp;&nbsp;&nbsp;
			<!-- 네이버 로그인 버튼이 생기는 영역 -->
			<div id="naverIdLogin"></div>
			
			<!-- <button class="btnNaver" style="background-color: #19ce60; color: white;">N 네이버로 가입</button> -->
		</div>
		
		<p style="margin-top: 10px; color: gray; font-size: 14px;">SNS계정 회원가입(만 14세 이상 가능)</p>
	
	</div>	<!-- 개인/SNS 회원가입 div 종료 -->
	
	<hr><br>
	
	<button class="btnSeller btn btn-outline-secondary" onclick="f_link();">판매자 회원가입</button>
	<p style="margin-top: 10px; color: gray; font-size: 14px;">판매 목적의 개인/법인 사업자 가입 가능</p>
	
	
	</div>	<!-- 전체 div -->
	
</div>
</body>

<script>

	function f_link(){
	    location.href = "../join/sellerJoin";
	}
	
	
	//카카오 로그인 버튼 이벤트
	$(".btnKakao").click(function () {
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
   
   
   
    //네이버 로그인 정보를 초기화하기 위하여 init을 호출
	naverLogin.init();
	
	//초기화할 때 로그아웃
	naverLogin.logout();
	
	//네이버 로그인 정보 가져오기
	naverLogin.getLoginStatus(function (status) {
      if (status) {
		const nickname=naverLogin.user.getName();
		const email=naverLogin.user.getEmail();
		const image=naverLogin.user.getProfileImage();
		const gender=naverLogin.user.getGender=="F"?"2":"1";
		const oldbirthday=naverLogin.user.getBirthday();
		const birthday=oldbirthday.replace(/-/g, "");
		 
		//회원가입 or 로그인을 위한 Data 전달
		$.ajax({  
			type:"post",
			url:"userNaverLogin",	//LoginController
			dataType:"json",
			data:{"email":email,"nickname":nickname,"profileImage":image,"gender":gender,"date":birthday},         
			success:function(ok){

				//location.href="/jogong/";	

			},error : function(xhr, status, error){  	// 필요한 정보 못가져올 경우 일반회원폼 이동

				alert("필요한 정보를 가져올 수 없어 일반 회원가입으로 이동합니다");
				location.href="/jogong/join/userAgree";	
			}//error
	
		});//ajax 종료

		
		}	//if 종료
	});	//naverLogin.getLoginStatus 종료
   
   
</script>
</html>