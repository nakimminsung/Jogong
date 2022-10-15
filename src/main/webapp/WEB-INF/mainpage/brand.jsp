<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

    <!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet"/>

    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- bootstrap 5 icon -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <style>
    body * {
    	font-size: 15px;
    }
	.slide_wrapper{
        position: relative;
        width: 890px;
        margin: 0 auto;
        height: 330px;
        overflow:hidden;
    }
    .slides{
        position:absolute;
        left:0;
        top:0;
        transition:left 0.5s ease-out;
        padding:0;
    }
    
    .slides li:not(:last-child){
        float:left;
        margin-right: 30px;
    }
    
    li{
        list-style:none;
    }
    
    .controls{
        text-align:center;
    
        display: flex;
        justify-content: space-between;
    }
    
    .controls div{
        background:#fff;
        color:#aaa;
        padding: 10px 20px;
        margin: 0 10px;
        cursor: pointer;
    }
    
    .controls div.prev{
    	position:relative;
    	top: -240px;
    }
    .controls div.next{
    	position:relative;
    	top: -240px;
    }
    
    </style>
    <script>
    $(function(){
    	eventList()
    });
	function eventList(){
		
		var sort="createdAt desc";
		var s="";
		
		$.ajax({
			type:"get",
			url:"event/list",
			data:{"sort":sort},
			dataType:"json", 
			success:function(res){
				
				$.each(res,function(i,elt){
					
					s += "<li style='cursor:pointer;'>";
					s += "<div class='card' style='width:200px; height:330px;'>";
					s += "<img class='card-img-top' src='"+elt.thumbnailImageUrl+"' style='width: 200px; height:250px;'/>";
					s += "<div class='card-body' style='width:200px; height:80px;'>";
					s += "<b class='card-title'>"+elt.subject+"</b>";
					s += "</div>";
					s += "</div>";					
					s += "</li>";
		      		
				});
				$(".slides").html(s);
			}
		});
	}

    </script>
</head>
<body>
    <c:set var="root" value="<%=request.getContextPath() %>" />
	<div class="slide_wrapper">
		<ul class='slides'></ul>
	</div>
	<div class='controls'>
        <div class='prev'>
        	<span>
        		<i class="material-icons" style="font-size:36px">keyboard_arrow_left</i>
        	</span>
        </div>
        <div class='next'>
        	<span>
        		<i class="material-icons" style="font-size:36px">keyboard_arrow_right</i>
        	</span>
        </div>
    </div>
</body>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript">

	window.onload = function(){
		
		var slides = document.querySelector('.slides'),
			slide = document.querySelectorAll('.slides li'),
			//slideCount = slide.length,
			slideCount = 12,
			currentIdx = 0,
			prevBtn = document.querySelector('.prev'),
			slideWidth = 200,
			slideMargin = 30,
			nextBtn = document.querySelector('.next');
		
		slides.style.width = (slideWidth + slideMargin) * slideCount - slideMargin + 'px';
		
		function moveSlide(num) {
			slides.style.left = -num * 230 + 'px';
			currentIdx = num;
		}
		
		nextBtn.addEventListener('click',function(){
			if(currentIdx < slideCount - 4){
				moveSlide(currentIdx + 1);
				console.log(currentIdx);
			} else {
				moveSlide(0);
			}
		});
		
		prevBtn.addEventListener('click',function(){
			if(currentIdx > 0){
				moveSlide(currentIdx - 1);
				console.log(currentIdx);
			} else {
				moveSlide(slideCount - 4);
			}
		});
	}
</script>
</html>