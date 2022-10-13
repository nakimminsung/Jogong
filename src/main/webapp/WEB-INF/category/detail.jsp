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
	a.header-cate>span{
		color:#000 !important;
		border-bottom: 5px solid #cff0cc;
	}

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
	.categoryName{
    margin: auto;
    display: flex;
    padding-top: 2%;
    padding-bottom: 2.5%;
    align-content: stretch;
    justify-content: center;
	}
		 
	 .categoryTotal{
		text-align: center;
	    display: flex;
	    justify-content: space-around;
		width: 1200px;
		margin: auto;	    
	    flex-direction: row;
	    flex-wrap: wrap;
	    align-content: stretch;
	    align-items: baseline;
	} 
	
	.cateImage{
		width: 90px;
		border-radius: 30px;
		
	}
	
	.productImage{
		width:280px;
		height:280px;
		border: 0.1px solid #d3d3d3;
		margin-right: 19px;
		border-radius: 5px;
		margin-bottom: 5px;
	
	}
	
	.categorySort{
		width: 100px;
	    border: 0px;
	    font-size: 15px;
	}
	
	.productList {
		width: 1200px;
		display: flex;
		flex-wrap: wrap;
		margin: auto;
		justify-content: flex-start;		
		margin-top: 10px;
		
	} 
	
	.productItem{
		width: 280px;
		padding-bottom: 5%;
		margin-right: 19px;
	}
	
	.brandName{
		font-weight: bold;
		font-size: 18px;
	}
	
	.productName{
		font-size: 18px;
	
	}
	
	.productPrice{
		font-weight: bold;
		font-size: 20px;
		
	}
	
	.categoryList{
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	    max-width: 1180px;
	    margin: 32px auto;
	}
	
	.categorySort{
	    font-weight: 400;
	    line-height: 16px;
		width: 100px;
	    border: 0px;
	    font-size: 15px;
	    margin-right: 15px;
	}
	
	.categorySort:focus{
    box-sizing: border-box;
    border-radius: 5px;
    outline: 3px solid #F8E4FF;
	}
	
	
	
	a.categoryheader>span{
		font-size: 18px;
	    font-weight: 1000;
	    position: relative;
	    color: #888;
	}
	a.categoryheader>span:hover {
		color: #000
	}
	span::after {
		content: '';
	    display: block;
	    width: 0;
	    height: 5px;
	    position: absolute;
	    left: 0;
	    bottom: -5px;
	    background-color: #cff0cc;
	    opacity: 0.9;
	}
	a.categoryheader:hover span::after {
	    width: 100%;
	    transition: width .3s;
	}

</style>
</head>
<body>
	<div style="width: 100%; margin-top: 15px;" class="contentsBody">
		<h2 style="font-weight: bold;" class="categoryName">${categoryName }</h2>	
			<div class="categoryTotal">	
				<c:forEach var="category" items="${category}" >
					<a class="categoryheader" href="/jogong/category/categoryDetail?num=${category.num}">
						<img src="${category.categoryImage }" class="cateImage" ><br>
						<c:set var="s1" value="${category.num }"></c:set>
						<c:if test="${categoryNum==s1}">
							<span>${category.name }</span>
						</c:if>
						<c:if test="${categoryNum!=s1}">
							<span>${category.name }</span>
						</c:if>					
					</a>
				</c:forEach>
				<div style="margin-top:20px;  border-bottom: 1px solid #ebebeb; width: 100%;"></div>
			</div>
			<div class="categoryList">
				<span><h5>총 상품 갯수 : ${totalCount}개</h5></span>
					<div>
						<select class="categorySort" name="sort">
							<option value="createdAt desc" selected>최신순</option>
							<option value="price desc">가격높은순</option>
							<option value="price asc">가격낮은순</option>
							<option value="readCount desc">인기순</option>
						</select>
					</div>
			</div>
				<div class="productList" >
					<c:forEach var="productList" items="${productList}">
						<div class="productItem">
							<a href="/jogong/product/detail?num=${productList.num}"> 
								<img src="${productList.thumbnailImageUrl }" class="productImage"><br>
								<span style="display: inline-block;">
									<span class="brandName">${productList.brand }</span><br>
									<span class="productName">${productList.name }</span><br>
									<span class="productPrice"><fmt:formatNumber value="${productList.price}" type="number"/>원</span>
								</span>
							</a>
						</div>
					</c:forEach>
				</div>
				</div>
		</div>	
</body>
<script type="text/javascript">
	$(function () {
		$(".categorySort").change(function() {
			var sort=$(this).val();
			var s= "";
			 $.ajax({
					type:"get",
					url:"categorySort",
					dataType:"json",
					data:{"num":${categoryNum}, "sort":sort},
					success:function(res){
						$(".productList").empty();	
						
						
						$.each(res.productList, function(i,elt) {
							var price= elt.price.toLocaleString();
							
							s += "<div class='productItem'>";
							s += "<a href='/jogong/product/detail?num="+elt.num+"'>";
							s += "<img src='"+elt.thumbnailImageUrl+"'class='productImage'><br>";
							s += "<p style='display: inline-block;'>";
							s += "<span class='brandName'>"+elt.brand+"</span><br>";
							s += "<span class='productName'>"+elt.name+"</span><br>";
							s += "<span class='productPrice'>"+price+"원</span>";
							s += "</p>";
							s += "</a>";
							s += "</div>";
						});
						$(".productList").append(s);
						
					}
					
					
				});
		});
	});

</script>
</html>
