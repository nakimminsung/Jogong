<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

    <!-- font -->
    <link
      href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
      rel="stylesheet"
    />

    <!-- bootstrap 5 -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- bootstrap 5 icon -->
    <script
      src="https://kit.fontawesome.com/a076d05399.js"
      crossorigin="anonymous"
    ></script>

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    
    <!-- 카카오 로그인 관련 -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>	
    
    <!-- 네이버 로그인 관련 -->
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

</head>
<style>
	@font-face {
    font-family: 'SeoulNamsanM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulNamsanM.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	* {
		font-size: 15px;
		font-family: 'SeoulNamsanM';
		word-spacing: -1px;
	}
	div.header-wrapper {
		display: flex;
		justify-content: space-between;
		max-width: 1180px;
		margin: 10px auto;
		padding: 16px 3px;
	}
	a {
		color: black;
		text-decoration: none;
	}
	div>a:hover {
		color: black;
		text-decoration: none;
	}
	a:link, a:visited {
		color: black;
		text-decoration: none;
	}
	div.left {
		display: flex;
		justify-content: flex-start;
		margin-right:10px;
		width:100%;
	}
	div.left>div {
		display: flex;
		align-items:center;
	}
	div.right {
		display: flex;
		justify-content: flex-end;
		align-items: center;
		min-width:300px;
	}
	form.search{
	    display: flex;
	    align-items: center;
	    min-width: 100%;
	    padding: 10px 18px;
	    border-radius: 12.2px;
	    background: #f4f4f4;
	}
	div.menu>a{
		margin-right:20px;
	}
	div.right button{
		margin-left:10px;
	}
	div.home{
		min-width:60px;
		width:100%;
		max-width:120px;
	}
	div.home>a{
		font-size:30px;
	}
	div.menu{
		min-width:180px;
	}
	div.search-box{
		width:100%;
		max-width:500px;
	}
	div.search-box img{
		width:20px;
		margin-right:12px;
	}
	a.login {
		color: #add0bb;
		font-size:18px;
		font-weight:bold;
		margin-left:15px;
	}
	a.login:hover {
		color: #add0bb;
		text-decoration: none;
	}
	button.btn-header{
		background-color: #cff0cc;
		color: #000;
		font-weight:400;	
	}
	.profile{
		border-radius:100px;
		width:30px;
		height:30px;
		margin:5px 5px;
	}
	
	.quick{
    line-height: 2;
    color: rgba(0,0,0,.87);
    box-sizing: inherit;
    font-size: 100%;
    font-weight: 400;
 	display:none;
    padding: 16px;
    border-radius: 20px;
    width: 180px;
    position: absolute;
    left: 72%;
    background-color: white;
    border: none;
    box-shadow: 1px 1px 3px gray;
  	
	
	}
	.myMenu{
	adding: 10px 12px;
    border-radius: 8px;
    text-align: left;
    font-size: 13px;
    font-weight: 500;
    padding: 12px;
	
	}
	
	.logout{
	padding: 20px 12px 0;
    border-top: 1px solid hsla(0,0%,85.1%,.5);
	
	}
	
	
</style>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<div class="header-wrapper">
		<div class="left">
			<div class="home">
				<a href="${root}">조공</a>
			</div>
			<div class="menu">
				<a href="${root}">브랜드</a>
				<a href="${root}">카테고리</a>
				<a href="${root}/review/list">후기</a>
			</div>
			<div class="search-box">
				<form class="search">
					<img src="${root}/image/search.svg">
					<input disabled="disabled" type="text" placeholder="선물, 브랜드 검색" autocomplete="off" aria-required="true" aria-invalid="false" style="cursor: pointer; border:0px;">
				</form>
			</div>
		</div> <!-- div.left 종료 -->
		
		<div class="right">

			<!-- 로그아웃 상태일때 -->
			<c:if test="${sessionScope.loginok==null}"> <!-- 세션영역(세션에서 찾을때 무조건써줘야함) -->
				<a href="${root}/cscenter/faq"><b style="font-size: 15px; word-spacing: -1px;">고객센터</b></a>
				<a class="login" href="${root}/loginForm" style="margin-right: 10px;">로그인</a>
			
				<div>
					<button type="button" class="btn btn-header"
					onclick="location.href='${root}/join/joinMain'">회원가입</button>
				</div>
				
			</c:if>
			
			<!-- 로그인 상태일때 -->
			<c:if test="${sessionScope.loginok!=null}"> <!-- 세션영역(세션에서 찾을때 무조건써줘야함) -->

				<a href="${root}/cscenter/faq"><b style="font-size: 16px; word-spacing: -1px;">고객센터</b></a>&emsp;
				<div class="mainProfile" style="cursor: pointer;">
					<img src="${sessionScope.loginphoto}" class="profile">
					<b style="max-width:500px;">${sessionScope.loginname}님</b>&emsp;<span class="upIcon"><i class='fas fa-angle-down'></i></span>
				</div>

			</c:if>
			
		</div>	<!-- div.right 종료 -->

    </div>
    <!--  div.header-wrapper 종료 -->
    
     <div class="quick" style="z-index:1000;">
		<div>
			<img src="${sessionScope.loginphoto}" style="width: 50px;border-radius:100px;height:50px;">
			<span style="align-items: center;padding: 0 12px;"><b style="max-width:500px;">${sessionScope.loginname}님</b></span>
		</div> 
		<div>
			<div class="myMenu">
				<a href="/jogong/mypage/cart" >마이페이지</a><br> 
				<a href="#">쿠폰함</a> 
			</div>
		</div> 
		<div class="logout">
			<button type="button" onclick="location.href='${root}/logout'" class="btn"> 로그아웃</button>
		</div>
	</div>  
  </body>
  
<script>
//카카오 로그아웃  
	  window.Kakao.init('d4fc125a7dd0ad8b599aeac52a278521');  
		function kakaoLogout() {
            if (!Kakao.Auth.getAccessToken()) {
                alert('Not logged in.');
                return;
            }
            Kakao.Auth.logout(function() {
                alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
            });
	}
		
		$(".mainProfile").click(function () {
			$(".quick").toggle();
			
			if($(".quick").is(":visible")){
			      $(".fas").html("");
				  $(".upIcon").html("<i class='fas fa-angle-up'></i>");
			  }else{
				  $(".fas").html("");
				  $(".upIcon").html("<i class='fas fa-angle-down'></i>");
			  }
		})
 
		
		// 네이버 로그인 관련 // header.jsp 의 스크립트에 삽입했음
		let naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "CweUwT4uDWQRHuTIz4CB",	/* "YOUR_CLIENT_ID" */
					callbackUrl: "http://localhost:9000/jogong/loginForm",	/* "YOUR_CALLBACK_URL" */
					//로그인 팝업 여부
					isPopup: false,
					loginButton: {color: "green", type: 3, height: 50}
				}
			);
		

</script>	
  
</html>
