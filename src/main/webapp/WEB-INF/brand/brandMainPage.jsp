<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
    
    <!-- 부트스트랩 아이콘 -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

</head>
<style>
div#wrapper{
  margin: 0 auto;
  height: auto;
  min-height: 100%;
  position: relative;
}
div.content{
	max-width: 1180px;
	top:100px;
	display: flex;
	justify-content: space-between;
	margin: 0 auto;
}
div#menu{
	width:30%;
	float: left;
}
div#brandContent{
	width:70%;
	float: right;
	justify-content: center;
}
  
  
/* menu  */
div.my-menu-wrapper {
	position:fixed;
	height: 500px;
	top: 100px;
	width: 300px;
}
div.my-profile{
	width: 100%;
	height: 150px;
	display: flex;
	flex-direction: row;
}
img#my-profile-img {
	width:110px;
	border-radius: 40px;
	border: 3px solid white;
}
div.my-menu {
	padding: 20px 0;
}
div.my-menu>div{
	display: flex;
	flex-direction: column;
}
div.my-menu-top{
	margin-bottom: 30px;	
}
div.my-menu>div>a{
	display: block;
	margin: 5px;
	font-size: 17px;
}  

 .container mt-3{
  	width:33%;
  	height:400px;
  	justify-content: space-around;
  }
  
  .card-wrapper{
  	width:100%;
	display:flex;
	flex-direction:row;
	flex-wrap:wrap;
  }
  
  
  
</style>

<body>
<script>
	$('.sorting').click(function() {
		$('.sorting').css("color","");
		$(this).css("color","red");
	});
</script>
<div>
<button type="button" class="btn btn-info" onclick="location.href='${root}/jogong/brand/detail'">세부 페이지 이동</button>
</div>

<div style="height:1500px">

<div class="wrapper">
	<div class="content">
		<div id="menu">
			<div class="my-menu-wrapper">
				<div class="my-profile">

				</div>
				<div class="my-menu">
					<div class="my-menu-top">
						<h3>브랜드</h3>
						<a href="" class="sorting"><img data-v-9f20d01e="" src="https://sodagift.com/icons/category_all.svg" style="width:20px; height:20px; border-radius:10px">전체</a>
						<a href="" class="sorting"><img data-v-9f20d01e="" src="https://sodagift.com/img/image/1975054641867258.svg" style="width:20px; height:20px; border-radius:10px">식품</a>
						<a href="" class="sorting"><img data-v-9f20d01e="" src="https://sodagift.com/img/image/1975104603360769.svg" style="width:20px; height:20px; border-radius:10px">건강식품</a>
						<a href="" class="sorting"><img data-v-9f20d01e="" src="https://sodagift.com/img/image/1898623566327609.svg" style="width:20px; height:20px; border-radius:10px">뷰티</a>
						<a href="" class="sorting"><img data-v-9f20d01e="" src="https://sodagift.com/img/image/1974989170738795.svg" style="width:20px; height:20px; border-radius:10px">가전제품</a>
						<a href="" class="sorting"><img data-v-9f20d01e="" src="https://sodagift.com/img/image/1975550610153350.svg" style="width:20px; height:20px; border-radius:10px">키친</a>
					</div>
				</div>
			</div>	
		</div>
		
		<div id="brandContent">

			<div class="row wider justify-content-center">
			  <div class="col col-2"><h1>브랜드</h1></div>
			</div>
			
			<div class="row wider justify-content-center">
			  <div class="col col-2" style="width:400px; text-align:center"><p>어떤 브랜드의 제품을 찾고 계신가요?</p></div>
			</div>
			
			
			<div class="card-wrapper">
				<div class="container mt-3" style="width:50%; height:500px; cursor:pointer;">
				  <div class="card">
				    <img class="card-img-top" src="https://sodagift.com/img/image/1703681737372995.jpg" alt="Card image" style="width:100%">
				    <div class="card-body">
  				      <h5 class="card-text">스타벅스</h5>
				      <p class="card-title">한국에서 제일 많은 커피 전문점, 스타벅스! 맛있는 커피, 프라푸치노 등 간편한 기프티콘을 선물해 보세요.</p>
				    </div>
				  </div>
				</div>
				
				<div class="container mt-3" style="width:50%; height:500px; cursor:pointer;">
				  <div class="card">
				    <img class="card-img-top" src="https://sodagift.com/img/image/1704673251338799.jpg" alt="Card image" style="width:100%">
				    <div class="card-body">
  				      <h5 class="card-text">투썸플레이스</h5>
				      <p class="card-title">아는 사람은 다 안다는 소문난 케이크 맛집. 케이크와 함께 커피도 같이 선물하면 센스만점!</p>
				    </div>
				  </div>
				</div>

				<div class="container mt-3" style="width:50%; height:500px; cursor:pointer;">
				  <div class="card">
				    <img class="card-img-top" src="https://sodagift.com/img/image/1704130401389763.jpg" alt="Card image" style="width:100%">
				    <div class="card-body">
				      <h5 class="card-text">이디야커피</h5>
				      <p class="card-title">합리적인 가격으로 최고의 커피 맛을 자랑하는 대한민국 대표 카페! 아침을 깨우는 커피 한잔 선물은 어떠세요? </p>
				    </div>
				  </div>
				</div>

				<div class="container mt-3" style="width:50%; height:500px; cursor:pointer;">
				  <div class="card">
				    <img class="card-img-top" src="https://sodagift.com/img/image/1704460916760368.jpg" alt="Card image" style="width:100%">
				    <div class="card-body">
				      <h5 class="card-text">커피빈</h5>
				      <p class="card-title">세계에서 가장 오래된 커피 프랜차이즈 중 하나! 다양한 커피와, 블렌디드, 그리고 세트메뉴를 선물하세요.</p>
				    </div>
				  </div>
				</div>
				
			</div>
		 </div>
		 
	</div>
</div>
</div>
</body>
</html>