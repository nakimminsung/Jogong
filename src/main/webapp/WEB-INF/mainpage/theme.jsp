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
	
	<!-- bootstrap 5 icon -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    
<style type="text/css">
	
	.productTheme{
		width:90%;
		display: grid;  
  		grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  		margin-bottom: 30px;
	}
	
	.cardTheme>img.card-img-top{ 
		height: 15rem;
	}
	
	.tp{
		margin-left: 30px;
		margin-bottom: 30px;
		cursor: pointer;
	}
	
	.tp>img{
		background-color: #EEEEEE;
		border-radius: 20%;
	}
	
	.tp>p:hover{
		color: #A7D2CB;
	}
	
	.themeProduct{
		margin-top: 50px;
		margin-bottom: 50px;
	}
	
	.cardTheme { 
		display:none; 
	}
	
	.cardTheme>div.card-body:hover{
		background-color: #f6f7f7;
		cursor: pointer;
	}	
	
	.loadProduct{
		border-style: solid;
	}
	
	.loadProduct:hover{
		border-style: solid;
		background-color: #A7D2CB;
	}
</style>
</head>
<script type="text/javascript">
	
	$(function(){
		$("document").ready(function(){
			getThemeList(2);
		});	
		
		$("div.tp").click(function(){
			var themeNum = $(this).attr("themeNum");
			getThemeList(themeNum);
		});
		
	    $(".loadProduct").click(function(e){ 
	        e.preventDefault();
	        $("div.cardTheme:hidden").slice(0, 4).show();
	    });    
	});
	 
	 function getThemeList(themeNum){
			var s = "";
			$.ajax({
				type:"get",
				url:"product/themeList",
				data:{"themeNum":themeNum},
				dataType:"json", 
				success:function(res){
					console.log(res);
					$.each(res,function(i,e){
						s+="<div class='card cardTheme' onclick=\"location.href='${root}'\">"
							s+="<img class='card-img-top' src='"+ e.thumbnailImageUrl+"' alt='Card image cap'>";
							s+="<div class='card-body'>";
								s+="<h5 class='card-title'>"+e.brand+"</h5>";
								s+="<p class='card-text'>"+e.name+"</p>";
								s+="<p class='card-text'><b>&#8361;"+e.price+"</b></p>";
							s+="</div>";
						s+="</div>";
					}); 
					
					$("div.productTheme").html(s);
					
					$("div.cardTheme").slice(0, 5).hide(); // 초기갯수
				}
			});
		}
	
</script>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<div class="themeProduct" align="center">
		<div style="display: flex; justify-content: center;">
			<div class="tp" themeNum=1 style="display:flex; flex-direction:column;">
				<img src="${root }/image/birthday-cake.png" width="30">
				<p>생일</p>
			</div>
			<div class="tp" themeNum=2 style="display:flex; align-items:center; justify-content: center; flex-direction:column;">
				<img src="${root }/image/parents.png" width="30">
				<p>효도</p>
			</div>
			<div class="tp" themeNum=3 style="display:flex; align-items:center; justify-content: center;  flex-direction:column;">
				<img src="${root }/image/champagne-glass.png" width="30">
				<p>결혼/집들이</p>
			</div>
			<div class="tp" themeNum=4 style="display:flex; align-items:center; justify-content: center; flex-direction:column;">
				<img src="${root }/image/birthday-cake.png" width="30">
				<p>응원/시험</p>
			</div>
			<div class="tp" themeNum=5 style="display:flex; align-items:center; justify-content: center; flex-direction:column;">
				<img src="${root }/image/thinking.png" width="30">
				<p>쓸모없는선물</p>
			</div>
			<div class="tp" themeNum=6 style="display:flex; align-items:center; justify-content: center; flex-direction:column;">
				<img src="${root }/image/rocking-horse.png" width="30">
				<p>출산/백일돌</p>
			</div>
			<div class="tp" themeNum=7 style="display:flex; align-items:center; justify-content: center; flex-direction:column;">
				<img src="${root }/image/pet.png" width="30">
				<p>댕냥이</p>
			</div>
			<div class="tp" themeNum=8 style="display:flex; align-items:center; justify-content: center; flex-direction:column;">
				<img src="${root }/image/new-product.png" width="30">
				<p>신상품</p>
			</div>
		</div>	
		
		<div class="grid-container productTheme" align="center">
		</div>
		<a href="#" class="loadProduct">더보기</a>
	</div> 
	
	
</body>
</html>