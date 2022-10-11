<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	.brandTop{
		-webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    background-repeat: no-repeat;
	    box-sizing: inherit;
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    margin: 0;
	    -webkit-font-smoothing: antialiased;
	    top: 0;
	    width: 100%;
	    border-bottom: 10px solid #ebebeb;
	    position: relative;
	    padding: 0 16px;
	}
	
	brandTop_inner{
	    -webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    box-sizing: inherit;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    -webkit-font-smoothing: antialiased;
	    position: relative;
	    background: #fff;
	    display: flex;
	    align-items: center;
	    max-width: 1180px;
	    margin: 0 auto;
	    padding: 28px 0 40px;
	    border: 0;
	}
	.brandTop_logo{
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    background-repeat: no-repeat;
	    box-sizing: inherit;
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    margin: 0;
	    padding: 0;
	    -webkit-font-smoothing: antialiased;
	    margin-right: 24px;
	}
	.brandTop_logo img{
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    margin: 0;
	    padding: 0;
	    -webkit-font-smoothing: antialiased;
	    background-size: cover;
	    background-position: 50%;
	    width: 120px;
	    border-radius: 24px;
	}
	.brandTop_content{
		-webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    background-repeat: no-repeat;
	    box-sizing: inherit;
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    margin: 0;
	    -webkit-font-smoothing: antialiased;
	    padding: 0;
	}
	.brandTop_name{
	    -webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    background-repeat: no-repeat;
	    border: 0;
	    vertical-align: baseline;
	    margin: 0;
	    padding: 0;
	    -webkit-font-smoothing: antialiased;
	    box-sizing: border-box;
	    margin-bottom: 16px;
	    font-weight: 600;
	    font-size: 28px;
	}
	.brandTop_desc{
		-webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    background-repeat: no-repeat;
	    border: 0;
	    vertical-align: baseline;
	    margin: 0;
	    padding: 0;
	    -webkit-font-smoothing: antialiased;
	    box-sizing: border-box;
	    margin-bottom: 16px;
	    font-weight: 500;
	    margin-top: 12px;
	    font-size: 16px;
	}
	.brandContent{
	    -webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    font-family: "Poppins","Noto Sans KR",sans-serif;
	    box-sizing: inherit;
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    margin: 0;
	    -webkit-font-smoothing: antialiased;
	    position: relative;
	    background: #fff;
	    z-index: 10;
	    padding: 0 16px;
	    border-top: 1px solid #ebebeb;
	}
	
	.brandList{
	    -webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    font-family: "Poppins","Noto Sans KR",sans-serif;
	    background-repeat: no-repeat;
	    box-sizing: inherit;
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    padding: 0;
	    -webkit-font-smoothing: antialiased;
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	    max-width: 1180px;
	    margin: 32px auto;
	}
	.itemList{
	    -webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    font-family: "Poppins","Noto Sans KR",sans-serif;
	    box-sizing: inherit;
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    margin: 0;
	    -webkit-font-smoothing: antialiased;
	    background: #fff;
	    grid-template-columns: repeat(4,1fr);
	    grid-gap: 0;
	    padding: 0;
	    border-bottom: none;
	    margin-top: 0;
	}
	.listRow{
	    -webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    font-family: "Poppins","Noto Sans KR",sans-serif;
	    background-repeat: no-repeat;
	    box-sizing: inherit;
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    margin: 0;
	    padding: 0;
	    -webkit-font-smoothing: antialiased;
	}
	ul{
	    -webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    font-family: "Poppins","Noto Sans KR",sans-serif;
	    background-repeat: no-repeat;
	    box-sizing: inherit;
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    -webkit-font-smoothing: antialiased;
	    list-style: none;
	    padding: 0!important;
	    display: grid;
	    grid-template-columns: repeat(4,1fr);
	    grid-gap: 28px;
	    max-width: 1180px;
	    margin: 0 auto;
	}
	.sgItem{
	    -webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    list-style: none;
	    font-family: "Poppins","Noto Sans KR",sans-serif;
	    background-repeat: no-repeat;
	    box-sizing: inherit;
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    margin: 0;
	    -webkit-font-smoothing: antialiased;
	    padding: 0;
	    box-shadow: none;
	}
</style>
</head>
<body>
<div class="brand_layout">
	<!-- 상단에 브랜드 노출 -->
	<div class="brandTop">
		<div class="brandTop_inner input-group" style="flex-wrap: unset;">
			<div class="brandTop_logo">
				<img alt="로고썸네일" src="${dto.logoImage}">
			</div>
			<div class="brandTop_content">
				<p class="brandTop_name">${brand}</p>
				<p class="brandTop_desc">${dto.description}</p>
			</div>
		</div>
	</div>
	<!-- 상단에 브랜드 노출 끝 -->
	<!-- 컨텐트 뷰 -->
	<div class="brandContent">
		<!-- 옵션 -->
		<div class="brandList">
			<h3><span>${count}개</span></h3>
			<div>
				<select class="categorySort" name="sort">
					<option value="createdAt desc" selected>최신순</option>
					<option value="price desc">가격높은순</option>
					<option value="price asc">가격낮은순</option>
					<option value="readCount desc">인기순</option>
				</select>
			</div>
		</div> 
		<!-- 옵션 끝 -->
		<!-- 상품목록  -->
		<div class="itemList">	
			<div class="listRow">
				<ul class="productList">
				<c:forEach var="productList" items="${productList}">
					<li class="sgItem">
					<div class='card cardTheme'>
					<a href="/jogong/product/detail?num=${productList.num}">
						<img class='card-img-top' src="${productList.thumbnailImageUrl }" alt='Card image cap'>
						<div class='card-body'>
							<h5 class='card-title'>${productList.brand }</h5>
							<p class='card-text' style='text-overflow:ellipsis;overflow: hidden;white-space: nowrap;display: block;max-width: 350px;'>${productList.name }</p>
							<p class='card-text'><b><fmt:formatNumber value="${productList.price}" type="number"/>원</b></p>
						</div>
					</a>
					</div>
					</li>
				</c:forEach>	
				</ul>
			</div>
		</div>
	<!-- 상품목록 끝  -->
	</div><!-- 컨텐트 뷰 끝 -->
</div>
</body>
<script type="text/javascript">
$(function () {
	$(".categorySort").change(function() {
		var sort=$(this).val();
		var s= "";
		 $.ajax({
				type:"get",
				url:"brandSort",
				dataType:"json",
				data:{"brand":'${brand}', "sort":sort},
				success:function(res){
					
					$(".productList").empty();	
					console.log(res);
					$.each(res.productList, function(i,elt) {
						var price= elt.price.toLocaleString();
						
					/* s+=	"<ul class='productList'>"
					s+=	"<c:forEach var='productList' items='"+${productList}+"'>"
					s+=	"<li class='sgItem'>"
					s+=	"<div class='card cardTheme'>"
					s+= "<a href='/jogong/product/detail?num=${productList.num}'>" 
					s+=	"<img class='card-img-top' src='"+${productList.thumbnailImageUrl}+"' alt='Card image cap'>"
					s+=	"<div class='card-body'>"
					s+=	"<h5 class='card-title'>"+${productList.brand}+"</h5>"
					s+=	"<p class='card-text' style='text-overflow:ellipsis;overflow: hidden;white-space: nowrap;display: block;max-width: 350px;'>"+${productList.name}+"</p>"
					s+=	"<p class='card-text'><b><fmt:formatNumber value='"+${productList.price}+"' type='number'/>원</b></p>"
					s+=	"</div>"
					s+= "</a>"
					s+=	"</div>"
					s+=	"</li>"
					s+=	"</c:forEach>"	
					s+=	"</ul>" */
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