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
a.header-brand>span{
	color:#000 !important;
	border-bottom: 5px solid #cff0cc;
}
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

div.search-box{
	display: flex;
	flex-direction: row;
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
$(function(){
	
	// 카테고리별 조회
	$(".sorting").click(function(e) {
		e.stopPropagation();
		var sort=$(this).attr("value");
		console.log(sort);
		var s= "";
		 $.ajax({
				type:"get",
				url:"categorySelect",
				dataType:"json",
				data:{"sort":sort},
				success:function(res){
					$(".card-wrapper").empty();	
					
					$.each(res, function(i,elt) {
						console.log(elt.brandphoto)
						s+="<div class='container mt-3' style='width:50%; height:500px; cursor:pointer;'>";
						s+="<div class='card'>";
						s+="<img class='card-img-top' src="+elt.brandphoto+" alt='Card image' style='width:100%; height:250px;'>";
						s+="<div class='card-body'>";
						s+="<h5 class='card-text'>"+elt.companyName+"</h5>";
						s+="<p class='card-title' style='display: -webkit-inline-box; -webkit-box-orient: vertical; -webkit-line-clamp: 3; overflow: hidden;'>"+elt.description+"</p>";
						s+="</div></div></div>";
						  
						
					});
					$(".card-wrapper").html(s);
				}
			});
		});
	
	
	 $('a.sorting').click(function() {
		$('.sorting').find("span").css("border-bottom","");
		$(this).find("span").css("border-bottom","4px solid #cff0cc");
	}); 
	 
	 
	// 전체 조회 버튼 
	$(".sortingAll").click(function(e) {
		e.stopPropagation();
		var sort=$(this).attr("value");
		console.log(sort);
		var s= "";
		 $.ajax({
				type:"get",
				url:"categoryAllSelect",
				dataType:"json",
				data:{"sort":sort},
				success:function(res){
					$(".card-wrapper").empty();	
					
					$.each(res, function(i,elt) {
						console.log(elt.brandphoto)
						s+="<div class='container mt-3' style='width:50%; height:500px; cursor:pointer;'>";
						s+="<div class='card'>";
						s+="<img class='card-img-top' src="+elt.brandphoto+" alt='Card image' style='width:100%; height:250px;'>";
						s+="<div class='card-body'>";
						s+="<h5 class='card-text'>"+elt.companyName+"</h5>";
						s+="<p class='card-title' style='display: -webkit-inline-box; -webkit-box-orient: vertical; -webkit-line-clamp: 3; overflow: hidden;'>"+elt.description+"</p>";
						s+="</div></div></div>";
						  
						
					});
					$(".card-wrapper").html(s);
				}
			});
		});
	
	
	// 브랜드 검색
	$(".inputBrand").keyup(function(e) {
		e.stopPropagation();
		var name=$(this).val();
		console.log(name);
		var s= "";
		 $.ajax({
				type:"get",
				url:"../brand/selectBrandName",
				dataType:"json",
				data:{"name":name},
				success:function(res){
					$(".card-wrapper").empty();	
					
					$.each(res, function(i,elt) {
						console.log(elt.companyName);
						s+="<div class='container mt-3' style='width:50%; height:500px; cursor:pointer;'>";
						s+="<div class='card'>";
						s+="<img class='card-img-top' src="+elt.brandphoto+" alt='Card image' style='width:100%; height:250px;'>";
						s+="<div class='card-body'>";
						s+="<h5 class='card-text'>"+elt.companyName+"</h5>";
						s+="<p class='card-title' style='display: -webkit-inline-box; -webkit-box-orient: vertical; -webkit-line-clamp: 3; overflow: hidden;'>"+elt.description+"</p>";
						s+="</div></div></div>";
						  
						
					});
					$(".card-wrapper").html(s);
				}
			});
		});
	
	
});
	
	
</script>
<div>
<button type="button" class="btn btn-info" onclick="location.href='${root}/jogong/brand/detail'">세부 페이지 이동</button>
</div>

<%-- <div>
 <c:forEach var="brand" items="${list}">
	<p>${brand}</p>
</c:forEach> 
</div>--%>


<div style="min-height:1500px">

<div class="wrapper">
	<div class="content">
		<div id="menu">
			<div class="my-menu-wrapper" style="margin-top:40px">
				<div class="my-menu">
					<div class="my-menu-top">
						<h3>브랜드</h3>
						<a href="#" class="sortingAll"><img data-v-9f20d01e="" src="https://sodagift.com/icons/category_all.svg" style="width:20px; height:20px; border-radius:10px">&nbsp;<span>전체</span></a>
						<a href="#" class="sorting" value="패션"><img data-v-9f20d01e="" src="https://sodagift.com/img/image/1975159178990633.svg" style="width:20px; height:20px; border-radius:10px">&nbsp;<span>패션</span></a>
						<a href="#" class="sorting" value="음식"><img data-v-9f20d01e="" src="https://sodagift.com/img/image/1975021698905448.svg" style="width:20px; height:20px; border-radius:10px">&nbsp;<span>음식</span></a>
						<a href="#" class="sorting" value="뷰티"><img data-v-9f20d01e="" src="https://sodagift.com/img/image/1898623566327609.svg" style="width:20px; height:20px; border-radius:10px">&nbsp;<span>뷰티</span></a>
						<a href="#" class="sorting" value="전자기기"><img data-v-9f20d01e="" src="https://sodagift.com/img/image/1974989170738795.svg" style="width:20px; height:20px; border-radius:10px">&nbsp;<span>전자기기</span></a>
						<a href="#" class="sorting" value="카페"><img data-v-9f20d01e="" src="https://sodagift.com/img/image/1975182565069557.svg" style="width:20px; height:20px; border-radius:10px">&nbsp;<span>카페</span></a>
						<a href="#" class="sorting" value="건강식품"><img data-v-9f20d01e="" src="https://sodagift.com/img/image/1975104603360769.svg" style="width:20px; height:20px; border-radius:10px">&nbsp;<span>건강식품</span></a>
						<a href="#" class="sorting" value="생활용품"><img data-v-9f20d01e="" src="https://sodagift.com/img/image/1975550610153350.svg" style="width:20px; height:20px; border-radius:10px">&nbsp;<span>생활용품</span></a>
					</div>
				</div>
			</div>	
		</div>
		
		<div id="brandContent">

			<div class="row wider justify-content-center">
			  <div class="col col-2"><h1>브랜드</h1></div>
			</div>
			
			<div class="row wider justify-content-center">
<!--     			<div class="col col-2" style="width:400px; text-align:center; margin-bottom:50px"><p>어떤 브랜드의 제품을 찾고 계신가요?</p></div> -->
				<div class="search-box">
						<img src="../resources/image/search.svg" style="width:30px;height:30px">
						<input class="inputBrand" type="text" placeholder="&nbsp;&nbsp;어떤 브랜드의 제품을 찾고 계신가요?" autocomplete="off" aria-required="true" aria-invalid="false" style="cursor: pointer; width:100%; height:40px;border:1px solid black; margin-bottom:50px; border-radius:5px">
				</div>
			</div>
					
			
			<!-- 브랜드 정보 카드 -->
			<div class="card-wrapper">
				 <c:forEach var="brand" items="${list}">
					<div class="container mt-3" style="width:50%; height:500px; cursor:pointer;">
					  <div class="card">
					    <img class="card-img-top" src="${brand.brandphoto}" alt="Card image" style="width:100%; height:250px;">
					    <div class="card-body">
	  				      <h5 class="card-text">${brand.companyName}</h5>
					      <p class="card-title" style="display: -webkit-inline-box; -webkit-box-orient: vertical; -webkit-line-clamp: 3; overflow: hidden;">${brand.description}</p>
					    </div>
					  </div>
					</div>
				</c:forEach>
			</div>
		 </div>
	</div>
</div>
</div>
</body>
</html>