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
	
	.categoryTotal{
		text-align: center;
		margin: auto;
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
		width:100%;
		border-radius: 10px;
	
	}
	
	.sort{
		width: 100px;
	    border: 0px;
	    font-size: 15px;
	}
	
	.productList {
		width: 1200px;
		display: flex;
		flex-wrap: wrap;
		margin: auto;
		justify-content: space-around;		
	}
	
	.productItem{
		width: 280px;
	}

</style>
</head>
<body>
	<div style="width: 100%;" class="contentsBody">
		<h2 style="font-weight: bold; width: 900px;">${catebynum }</h2><br>
			<div class="categoryTotal">
				<c:forEach var="cate" items="${category}" >
					<a href="/jogong/category/categoryDetail?num=${cate.num}">
						<img src="${cate.categoryImage }" class="cateImage" ><br>
						<c:set var="s1" value="${cate.num }"></c:set>
						<c:if test="${num==s1}">
							<span style="font-size: 15px; display:inline-block; margin: 10px 0px;border-bottom: 2px solid black;width:100px;">${cate.name }</span>
						</c:if>
						<c:if test="${num!=s1}">
							<span style="font-size: 15px; display:inline-block; margin: 10px 0px;">${cate.name }</span>
						</c:if>					
					</a>
				</c:forEach>
				<div style="border-bottom: 1px solid #dcdcdc; width: 100%;"></div>
			</div>
			<div class="List">
				<h3 style="width: 1200px; margin: auto; margin-top: 30px; padding-legt: 10px;">총 ${count }개</h3>
				<div style="width: 1200px; margin:auto; display: flex; flex-direction: row-reverse;">
					<select class="sort" name="sort">
						<option value="createdAt desc" selected>최신순</option>
						<option value="price desc">가격높은순</option>
						<option value="price asc">가격낮은순</option>
						<option value="readCount desc">인기순</option>
					</select>
				</div>
				
				<div class="productList" >
					<c:forEach var="productList" items="${productList}">
						<div class="productItem">
							<a href="/jogong/product/detail?num=${productList.num}"> 
								<img src="${productList.thumbnailImageUrl }" class="productImage"><br>
								<span style="display: inline-block;">
									<span>${productList.name }</span><br>
									<span><fmt:formatNumber value="${productList.price}" type="number"/>원</span>
								</span>
							</a>
						</div>
					</c:forEach>
				</div>
				</div>
		</div>
	</div>	
</body>
<script type="text/javascript">
	$(function () {
		$(".sort").change(function() {
			var sort=$(this).val();
			var s= "";
			 $.ajax({
					type:"get",
					url:"categorySort",
					dataType:"json",
					data:{"num":${num}, "sort":sort},
					success:function(res){
						$(".productList").empty();	
						
						$.each(res.productList, function(i,elt) {
							var price= elt.price.toLocaleString();
							
							s += "<div>";
							s += "<a href='/jogong/product/detail?num="+elt.num+"'>";
							s += "<img src='"+elt.thumbnailImageUrl+"'class='productImage'><br>";
							s += "<p style='display: inline-block;'>";
							s += "<span>"+elt.name+"</span><br>";
							s += "<span>"+price+"원</span>";
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
