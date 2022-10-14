<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

    <!-- font -->
    <link
      href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
      rel="stylesheet"
    />

    <!-- bootstrap 5 -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <!-- bootstrap 5 icon -->
    <script
      src="https://kit.fontawesome.com/a076d05399.js"
      crossorigin="anonymous"
    ></script>

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

    <!-- slick -->
    <link
      rel="stylesheet"
      type="text/css"
      href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"
    />
    
    
    <script
      type="text/javascript"
      src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"
    ></script>

    <style>
      body * {
        font-size: 15px;
      }
      div.event-wrapper {
        width: 100%;
        display: flex;
        justify-content: center;
      }
      div.event-object {
        width: 350px;
        height: 350px;
        padding: 0 10px;
        margin: 30px 0;
      }
      div.event-object > img {
        width: 100%;
        height: 90%;
      }
      button.slick-arrow {
        width: 50px;
        height: 50px;
        border-radius: 100%;
        position: relative;
        top: 100px;
      }
      button.slick-prev {
      	position: relative;
      	top: 145px;
  		left: 0px;
  		z-index: 10;
  		border-radius: 0;
  		width: 300px;
  		height: 100px;
  		font-size: 50px;
  		background: #fff;
  		border: 0px;
  		color: #f0f0f0;
  		font-weight: 1000;
      }
      button.slick-next {
        position: relative;
      	top: 145px;
      	right: 0px;
  		z-index: 10;
  		border-radius: 0;
  		width: 300px;
  		height: 100px;
  		font-size: 50px;
  		background: #fff;
  		border: 0px;
  		color: #f0f0f0;
  		font-weight: 1000;
      }
      
      $wh : #ffffff;
	  $bk : #000000;
	  $pt : #ffc0cb;
	
	  button.slick-arrow {
	  		font-size:50px;
	        z-index: 10;
	        width: 100px;
	        height: 100px;
	        background: rgba($bk, 0.2);
	
	        transition: background 0.5s;
	        &:hover {
	            background: rgba($pt, 0.9);
	
	            &::before {
	                color: rgba($bk, 0.5);
	            }
	        }
	        &::before {
	            font-family: 'Line Awesome Free';
	            font-weight: 900;
	            font-size: 49px;
	            transition: all 0.5s;
	        }
	    }
	    
	    .slick-prev {
			
	        &::before {
	            content: "<"";
	        }
	    }
	
	    .slick-next {
	
	        &::before {
	            content: ">";
	        }
	    }
    </style>
  </head>
  <body>
    <c:set var="root" value="<%=request.getContextPath() %>" />
    <div class="event-wrapper">
    	<div class="event-object">
        	<img src="https://luckydraw-media.s3.amazonaws.com/post/168/thumbnail_1628437119671.jpeg" style="width: 200"/>
        	<b>나이키 덩크 이벤트 2탄</b>
      	</div>
      	<div class="event-object">
        	<img src="https://mblogthumb-phinf.pstatic.net/MjAyMDEwMTNfMTAy/MDAxNjAyNTQxMDczMTU0.LBNn4Q8eodVYZ6hmg-jvF1pxbn8e19y7UHTtO_FWfdUg.UpYSOQ05uqdXvkl1VwqPLys__hmzi1BYzjdV7KTiM28g.PNG.liveforu/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2020-10-13_%EC%98%A4%EC%A0%84_7.17.19.png?type=w800"/>
        	<b>애플 이벤트</b>
      	</div>
      	<div class="event-object">
        	<img src="http://img.wemep.co.kr/deal/1/035/1870351/c47c21fcc6497c0701889cc85804c03d20fc3071.jpg"/>
        	<b>이솝 인기화장품 한자리에</b>
      	</div>
      	<div class="event-object">
        	<img src="https://cdn.onews.tv/news/photo/202109/88599_94974_3248.png"/>
        	<b>정관장 건강하 잔소리</b>
      	</div>
      	<div class="event-object">
        	<img src="https://golfshop-vx.s3.ap-northeast-2.amazonaws.com/Image-shop-vx/event/22/07/01/mo01.gif"/>
        	<b>카카오프렌즈 골프 덕후 구매왕</b>
      	</div>
      	<div class="event-object">
        	<img src="https://images-kr.amoremall.com/fileupload/plandisplay/2021/12/31/6444_slide3_2.jpg"/>
        	<b>NEW 헤라 "위시로켓" 런칭 특별 이벤트</b>
      	</div>
    </div>
</body>
<script type="text/javascript">
	$(".event-wrapper").slick({
    	lazyLoad: "ondemand",
        slidesToShow: 4,
        slidesToScroll: 1,
    });
    $(".slick-prev").html("<");
    $(".slick-next").html(">");
</script>
</html>
