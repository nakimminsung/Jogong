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
		
	}
	
	.all{
		margin-top: 30px;
		padding-left: 15%;
		padding-right: 15%;
		
		width: 100%;
		height: 3000px;
	}
	
	.productList{
		display: flex;
		flex-flow: row;
		flex-wrap: wrap;
		justify-content: flex-start;
		
	}
	
	.productImage{
		width: 280px;
		height: 280px;
		margin-right: 15px;
	}
	
	.productItem{
		width: 280px;
		margin-right: 15px;
		margin-bottom: 20px;
		
	}
	
	

</style>
</head>
<body>

<div class="all">

	<!-- 상품 갯수, 필터 -->
	<div class="resultTop" style="display: flex; justify-content: space-between;">
		<b style="font-size: 20px;">'${searchword}' (으)로 검색된 상품 : ${searchCount}개</b>
		
		<div>
			<select class="form-select searchSort" name="sort">
				<option value="createdAt desc" selected>최신순</option>
				<option value="readCount desc">인기순</option>
				<option value="price desc">높은 가격순</option>
				<option value="price asc">낮은 가격순</option>
			</select>
		</div>

	</div>
	
	<hr>
	
	<!-- 검색결과 -->
	<div class="resultBody">
		<c:if test="${searchCount==0}">
			<div style="text-align: center;">
				<br>
				<b><h4>검색된 상품이 없습니다</h4></b>
			</div>
		</c:if>
		
		<div class="productList" style="margin-left: 10px;">
			<c:forEach var="productList" items="${searchProduct}">
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

<script>

var searchword="${searchword}";

$(".searchSort").change(function() {
	
	//select option에서 선택한 value값을 sort에 저장
	var sort=$(this).val();
	var s= "";
	
	 
	$.ajax({
		type:"get",
		url:"search/searchSort",
		dataType:"json",
		data:{"searchword":searchword, "sort":sort},
		success:function(res){
				
			//기존의 검색 결과 비우기
			$(".productList").empty();	
				
			$.each(res.productList, function(i,elt) {
			
				var price= elt.price.toLocaleString();
				
				s += "<div class='productItem'>";
					s += "<a href='/jogong/product/detail?num="+elt.num+"'>";
						s += "<img src='"+elt.thumbnailImageUrl+"'class='productImage'><br>";
						s += "<span style='display: inline-block;'>";
							s += "<span class='brandName'>"+elt.brand+"</span><br>";
							s += "<span class='productName'>"+elt.name+"</span><br>";
							s += "<span class='productPrice'>"+price+"원</span>";
						s += "</span>";
					s += "</a>";
				s += "</div>";
			
			}); //each 반복문 종료
			
			$(".productList").append(s); //결과값 productList에 출력
		
		} //success 종료 
		
		
	}); //ajax 종료
	
	
}); //change 이벤트 종료

</script>
</html>