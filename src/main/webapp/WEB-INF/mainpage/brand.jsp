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
        cursor: pointer;
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
    </div>
</body>
<script>
	eventList()
		
	function eventList(){
		var s="";
		
		$.ajax({
			type: "get",
			url: "event/list",
			dataType: "json",
			success:function(res){
				
				$.each(res, function(i,elt) {
					
					s += "<div class='event-object'>";
					s += "<img src='"+elt.thumbnailImageUrl+"'>";
					s += "<b>"+elt.subject+"</b>";
					s += "</div>";
					
				});
				$("div.event-wrapper").html(s);
			}
		});
	}
	$(".event-wrapper").slick({
    	lazyLoad: "ondemand",
        slidesToShow: 4,
        slidesToScroll: 1,
    });
    $(".slick-prev").html("<");
    $(".slick-next").html(">");
</script>
</html>
