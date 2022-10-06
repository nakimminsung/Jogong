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
	@font-face {
    	font-family: 'SeoulNamsanM';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulNamsanM.woff') format('woff');
    	font-weight: normal;
    	font-style: normal;
	}
	
	body * {
		font-size: 15px;
		font-family: 'SeoulNamsanM';
		word-spacing: -1px;
	}
	
	.productTheme{
		width:90%;
		display: grid;  
  		grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  		margin-bottom: 30px;
	}
	
	.cardTheme>img.card-img-top{ 
		height: 17rem;
	}
	
	.tp{
		margin-left: 50px;
		margin-bottom: 30px;
		cursor: pointer;
	}
	
	.tp>img{
		border-radius: 20%;
	}
	
	.tp>img:hover{
		background-color: #EEEEEE;
		border-radius: 20%;
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
		width: 500px;
   		height: 49px;
    	padding-top: 2px;
    	border: 1px solid #ddd;
    	font-size: 13px;
    	line-height: 45px;
    	color: #222;
    	background-color: white;
	}
	
	.cardTheme{
		margin-left: 30px;
		margin-top:30px;
	}
	
	.tagList>img{
		width: 50px;
	}
	
	div.tagList{
		background-color: #94E3f7;
	}
</style>
</head>
<script type="text/javascript">
	
	$(function(){
		$("document").ready(function(){
			getThemeList(2);
		//	getTagList(2);
		});	
		
		$("div.tp").click(function(){
			var themeNum = $(this).attr("themeNum");
			getThemeList(themeNum);
			//getTagList(themeNum);
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
						s+="<div class='card cardTheme' onclick=\"location.href='product/detail?num="+e.num+"'\">";
							s+="<img class='card-img-top' src='"+ e.thumbnailImageUrl+"' alt='Card image cap'>";
							s+="<div class='card-body'>";
								s+="<h5 class='card-title'>"+e.brand+"</h5>";
								s+="<p class='card-text' style='text-overflow:ellipsis;overflow: hidden;white-space: nowrap;display: block;max-width: 350px;'>"+e.name+"</p>";
								s+="<p class='card-text'><b>&#8361;"+e.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"</b></p>";
							s+="</div>";
						s+="</div>";
					}); 
					
					$("div.productTheme").html(s);
					
					$("div.cardTheme").slice(0, 5).hide(); 
				}
			});
		}
	 /* 
	 	function getTagList(themeNum){
	 		var s="";
	 		$.ajax({
				type:"get",
				url:"product/tagList",
				data:{"themeNum":themeNum},
				dataType:"json", 
				success:function(res){
					$.each(res,function(i,e){   
								s+="<img class='card-img-top' src='"+ e.themeImage +"' width='10' alt='Card image cap'>";
								s+="<div class='card-body'>";
								if(e.name != '쓸모없는 선물'){
									s+="<h5 class='card-title'>"+e.name+" 선물 추천</h5>";
								}else{
									s+="<h5 class='card-title'>"+e.name+" 추천</h5>";
								}
									$.each(e.tag.split(","),function(i,elt){
										s += "#"+elt;
									});
								s+="</div>";
							});
							$("div.tagList").html(s);
						}
					});
			 	} */
			
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
						<img src="${root }/image/fan.png" width="30">
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
				
			<!-- 	<div class="card tagList" style="width: 18rem; height: 10rem; display:flex; align-items:center; justify-content: center; flex-direction:column;" >
				</div>	 -->
					
				<div class="grid-container productTheme" align="center">
				</div>
				
				<button class="loadProduct">더보기&nbsp;<i class='fas fa-angle-down'></i></button>
			</div> 
</body>
</html>