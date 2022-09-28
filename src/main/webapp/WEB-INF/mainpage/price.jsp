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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<!-- bootstrap 5 icon -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    
</head>
<style>
	.productPrice{ 
		width:90%;	
		margin-bottom: 30px;
	}
	
	.cardPrice>div.card-body:hover{
		background-color: #f6f7f7;
		cursor: pointer;
	}
	
	.cardPrice>img.card-img-top{
		height: 15rem;
	}
	
	.priceRange{
		margin-top:30px;
		margin-bottom: 30px;
		cursor: pointer;
	}
	
	.pr img{
		border-radius: 70%;
	}
	
	.pr{
		margin-left: 30px;
	}
	
	.pr img:hover{
		box-shadow: 5px 5px 5px;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$("document").ready(function(){
			getProductList(50000);
		});	
		
		$("span.pr").click(function(){
			var price = $(this).attr("price");
			getProductList(price);
		});
	});
	
	function getProductList(price){
		var s = "";
		$.ajax({
			type:"get",
			url:"product/list",
			data:{"price":price},
			dataType:"json", 
			success:function(res){
				console.log(res);
				$.each(res,function(i,e){
					s+="<div class='card cardPrice' onclick=\"location.href='${root}'\">"
						s+="<img class='card-img-top' src='"+ e.thumbnailImageUrl+"' alt='Card image cap'>";
						s+="<div class='card-body'>";
							s+="<h5 class='card-title'>"+e.brand+"</h5>";
							s+="<p class='card-text'>"+e.name+"</p>";
							s+="<p class='card-text'><b>&#8361;"+e.price+"</b></p>";
						s+="</div>";
					s+="</div>";
				});
				$("div.productPrice").html(s);
			}
		});
	}
</script>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<div align="center">
		<h2>가격대별 인기상품</h2>
		<div class="priceRange">
			<span class="pr" price=1><img src="${root }/image/price5.jpeg" width="45">&nbsp;~5만원</span>
			<span class="pr" price=2><img src="${root }/image/price10.png" width="45">&nbsp;~10만원</span>
			<span class="pr" price=3><img src="${root }/image/price20.png" width="45">&nbsp;~20만원</span>
			<span class="pr" price=4><img src="${root }/image/price30.png" width="45">&nbsp;20만원~</span>
		</div>
		
		<div class="card-deck productPrice">
		</div>
	</div>
</body>
</html>