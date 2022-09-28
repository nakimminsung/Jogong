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
	}
	
	.cardTheme>img.card-img-top{ 
		height: 15rem;
	}
	
	.tp{
		margin-left: 30px;
		margin-bottom: 30px;
	}
	
	.themeProduct{
		margin-top: 50px;
		margin-bottom: 50px;
	}
	
	.cardTheme { display:none; }
</style>
</head>
<script type="text/javascript">
	/* $(function(){
		
		$("document").ready(function(){
			getThemeList(2);
		});	
		
		$("div.tp").click(function(){
			var themeNum = $(this).attr("themeNum");
			getThemeList(themeNum);
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
			}
		});
	}
	 */
	$(function(){
		$("document").ready(function(){
			console.log("111");
			getThemeList(2);
		});	
		
		$("div.tp").click(function(){
			var themeNum = $(this).attr("themeNum");
			getThemeList(themeNum);
		});
		
	    $("#load").click(function(e){ // 클릭시 more
	    	console.log("222");
	        e.preventDefault();
	        $("div.cardTheme:hidden").slice(0, 1).show(); // 클릭시 more 갯수 지저정
	        if($("div.cardTheme:hidden").length == 0){ // 컨텐츠 남아있는지 확인
	            alert("게시물의 끝입니다."); // 컨텐츠 없을시 alert 창 띄우기 
	        }
	    });
	});
	 
	 function getThemeList(themeNum){
		 console.log("333");
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
					//var tag = "<div class='card-deck productTheme' align='center'>"+s+"</div>";
					
					$("div.productTheme").html(s);
					//$("div.themeProduct").html(tag);
					
					$("div.cardTheme").slice(0, 4).hide(); // 초기갯수
				}
			});
		}
	
</script>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<div class="themeProduct" align="center">
		<div style="display: flex; justify-content: center;">
			<div class="tp" themeNum=1 style="display:flex; flex-direction:column;"><img src="${root }/image/birthday-cake.png" width="30">생일</div>
			<div class="tp" themeNum=2 style="display:flex; align-items:center; justify-content: center; flex-direction:column;"><img src="${root }/image/birthday-cake.png" width="30">효도</div>
			<div class="tp" themeNum=3 style="display:flex; align-items:center; justify-content: center;  flex-direction:column;"><img src="${root }/image/birthday-cake.png" width="30">결혼/집들이</div>
			<div class="tp" themeNum=4 style="display:flex; align-items:center; justify-content: center; flex-direction:column;"><img src="${root }/image/birthday-cake.png" width="30">응원/시험</div>
			<div class="tp" themeNum=5 style="display:flex; align-items:center; justify-content: center; flex-direction:column;"><img src="${root }/image/birthday-cake.png" width="30">쓸모없는선물</div>
			<div class="tp" themeNum=6 style="display:flex; align-items:center; justify-content: center; flex-direction:column;"><img src="${root }/image/birthday-cake.png" width="30">출산/백일돌</div>
			<div class="tp" themeNum=7 style="display:flex; align-items:center; justify-content: center; flex-direction:column;"><img src="${root }/image/birthday-cake.png" width="30">댕냥이</div>
			<div class="tp" themeNum=8 style="display:flex; align-items:center; justify-content: center; flex-direction:column;"><img src="${root }/image/birthday-cake.png" width="30">신상품</div>
		</div>	
		
		<div class="card-deck productTheme" align="center">
		</div>
	</div> 
	
	<a href="#" id="load">더 보기</a>
</body>
</html>