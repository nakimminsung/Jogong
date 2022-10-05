<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- bootstrap js -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- bootstrap 5 icon -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	
	<!-- bootstrap css -->
    
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/f7b2a5e0aa.js" crossorigin="anonymous"></script>

	<!-- alert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	
<style type="text/css">
 	div {
        box-sizing: border-box;
       
      }
	.flex-outer-container {
	  margin: 0 auto;
	  max-width: 1180px;
	}
	.flex-inner-container {
	  display: flex;
	  flex-direction: row;
	  
	  flex-wrap: wrap;
	}
	
  	@media (min-width: 600px) {
	  .flex-outer-container {
	    flex-direction: row;
	    flex-wrap: wrap;
	  }
	  .flip {
	    flex-basis: 50%;
	  }
	}
	
	@media (min-width: 900px) {
	  .flip {
	    flex-basis: 20%;
	  }
	}
	
	.flip { 
	  border: 1px solid #f6f7f7; 
	 /* flex-grow: 1; */
  	  width: 200px;
      height: 300px;
      /* perspective: 1100px; */ 
      margin:10px;
	}

	.card {
	  width: 100%; 
	  height: 100%; 
	  position: relative;
	  transition: .4s;
	  transform-style: preserve-3d;
	}	
	
	.front, .back {
	  position: absolute;
	  width: 100%; 
	  height: 100%;
	  backface-visibility: hidden;
	}
	
	.back { 
	 
	  transform: rotateY(180deg);
	}
	
	.flip:hover .card {
	  transform: rotateY(180deg);
	}
</style>
<script type="text/javascript">

$(function(){
	var userId = $('.reviewUser').val();
	console.log(userId);
	$("document").ready(function(){
	 	getUserList(); 
	});	
	 
	
});



	 function getUserList(){
		
		/* var subject = $('.reviewSubject').val();  */
	/* 	console.log(subject); */
		$.ajax({
			type:"get",
			url:"../user/review",
			dataType:"json", 
			success:function(res){
			
				 console.log(res);
				$.each(res,function(i,e){
					var s = "";
					/* s+="<div class='flip'>";
						s+="<div class='card'>"; */
							/* s+="<h6>"+subject+"</h6 >" */
							s+="<img src='"+e.profileImage+"' width=20>"+e.nickname;
						
							$(".reviewUser[userNum="+e.num+"]").html(s);
							console.log(s);
					/* 	s+="</div>";
					s+="</div>"; */
				});
				
			}
		});
	}   
</script>
</head>
<body>
	<input type="hidden" class="reviewUser" value=${dto.userNum }>
	<input type="hidden" class="reviewImage" value="${dto.reviewImageUrl}">
	<input type="hidden" class="reviewSubject" value="${dto.subject }">
	
	<div  align="center">
		<h4>실시간후기</h4>
		<h6 style="color: gray;">고객분들의 실시간 후기를 소개합니다.</h6>
	</div>
	${dto.subject }
	<div class="flex-outer-container">
		<div class="flex-inner-container">
			 <c:forEach var="dto" items="${list }">
 				<div class="flip">
	        		<div class="card" >
	        		
	        			<div class="front" style="overflow: hidden;">
	        				<img src="${dto.reviewImageUrl }" width="250" height="250">
	        				<h6 style="display:inline;">${dto.subject }</h6 >
	        				<p  style="display:inline;"><i class="fas fa-star" style="color: rgb(247, 200, 21);"></i><b>${dto.rating }</b></p>
	        				<p class="reviewUser" userNum="${dto.userNum }"></p>
	        				<!-- <img src= -->
	        			</div>
	        			
	        			
	        			<div class="back">
	        				<h6>${dto.subject }</h6>
	        				<p>${dto.content }</p>
	        			</div>
	        			
	        		</div>
	      		</div>				
			</c:forEach> 
		</div>
    </div>
	<div class="reviewtest"></div>
</body>
</html> 

<!-- <!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>카드 유형03</title>

    <style>
        /* fonts */
        @import url('https://webfontworld.github.io/score/SCoreDream.css');
        .score {
            font-family: 'SCoreDream';
            font-weight: 300;
        }
        /* reset */
        * {
            margin: 0;
            padding: 0;
        }
        a {
            text-decoration: none;
            color: #000;
        }
        img {
            width: 100%;
        }
        h1, h2, h3, h4, h5, h6 {
            font-weight: normal;
        }
        /* common */
        .container {
            width: 1160px;
            padding: 0 20px;
            margin: 0 auto;
            min-width: 1160px;
        }
        .section {
            padding: 120px 0;
        }
        .section > h2 {
            font-size: 50px;
            line-height: 1;
            text-align: center;
            margin-bottom: 20px;
        }
        .section > p {
            font-size: 22px;
            font-weight: 300;
            color: #666;
            text-align: center;
            margin-bottom: 70px;
        }
        /* blind */
        .blind {
            position:absolute;
            clip: rect(0 0 0 0);
            width: 1px;
            height: 1px;
            margin: -1px;
            overflow: hidden;
        }
        /* cardType03 */
        body {
            background-color: #2254C3;
        }
        .card__inner {
            display: flex;
        }
        .card__inner .card {
            padding: 26px;
            width: 33.3333%;
            background-color: #fff;
        }
        .card__inner .card:nth-child(1) {
            border-right: 1px solid #eee;
        }
        .card__inner .card:nth-child(2) {
            border-right: 1px solid #eee;
        }
        .card__header {
            position: relative;
        }
        .card__header img {
            border-radius: 10px;
            box-shadow: 4px 4px 5px 0 rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
        }
        .card__header figcaption {
            position: absolute;
            right: 10px;
            top: 10px;
            padding: 6px 16px;
            border-radius: 50px;
            background-color: #fff;
            text-align: center;
            font-size: 14px;
            color: #7B7B7B;
        }
        .card__contents h3 {
            font-size: 20px;
            line-height: 1.4;
            margin-bottom: 10px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        .card__contents p {
            color: #666;
            font-size: 16px;
            line-height: 1.7;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            margin-bottom: 30px;
        }
        .card__footer {
            display: flex;
            justify-content: flex-end;
        }
        .card__footer h4 {
            text-align: right;
            color: #DD2A2A;
        }
        .card__footer em {
            display: block;
            color: #666;
            font-style: normal;
        }
        .card__footer span {
            width: 40px;
            height: 40px;
            background: #000;
            border-radius: 50%;
            overflow: hidden;
            display: block;
            margin-left: 10px;
            margin-top: -3px;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.25);
        }
    </style>
</head>
<body>
    <section id="cardType03" class="card__wrap Score section">
        <h2 class="blind">미술의 세계</h2>
        <div class="card__inner container">
            <article class="card">
                <figure class="card__header">
                    <img src="img/card_bg03_01.jpg" alt="Architects">
                    <figcaption>Art</figcaption>
                </figure>
                <div class="card__contents">
                    <h3>Spectacular designs of animals in polygonal style</h3>
                    <p>Digital art is an artistic work or practice
                        that uses digital Digital art is an artistic work or practice
                        that uses digital Digital art is an artistic work or practice</p>
                </div>
                <div class="card__footer">
                    <h4>Alex<em>Hesperioidea</em></h4>
                    <span><img src="img/card_bg03_icon01.png" alt=""></span>
                </div>
            </article>
            <article class="card">
                <figure class="card__header">
                    <img src="https://github.com/kkookkss/jogong_data/blob/main/product/%EB%B3%91%EC%B0%AC/thumbnail/%EB%A1%B1%EB%B0%94%EB%94%94%ED%95%84%EB%A1%9C%EC%9A%B0.jpg?raw=true" alt="">
                    <figcaption>Art</figcaption>
                </figure>
                <div class="card__contents">
                    <h3>Spectacular designs of animals in polygonal style</h3>
                <p>Digital art is an artistic work or practice
                    that uses digital Digital art is an artistic work or practice
                    that uses digital Digital art is an artistic work or practice</p>
                </div>
                <div class="card__footer">
                    <h4>Puppy<em>Hesperioidea</em></h4>
                    <span><img src="https://github.com/kkookkss/jogong_data/blob/main/product/%EB%B3%91%EC%B0%AC/thumbnail/%EB%A1%B1%EB%B0%94%EB%94%94%ED%95%84%EB%A1%9C%EC%9A%B0.jpg?raw=true" alt=""></span>
                </div>
            </article>
            
            <article class="card">
                <figure class="card__header">
                    <img src="img/card_bg03_03.jpg" alt="">
                    <figcaption>Art</figcaption>
                </figure>
                <div class="card__contents">
                    <h3>Spectacular designs of animals in polygonal style</h3>
                <p>Digital art is an artistic work or practice
                    that uses digital Digital art is an artistic work or practice
                    that uses digital Digital art is an artistic work or practice</p>
                </div>
                <div class="card__footer">
                    <h4>Cosmos<em>Hesperioidea</em></h4>
                    <span><img src="img/card_bg03_icon03.png" alt=""></span>
                </div>
            </article>
            
             <article class="card">
                <figure class="card__header">
                    <img src="img/card_bg03_03.jpg" alt="">
                    <figcaption>Art</figcaption>
                </figure>
                <div class="card__contents">
                    <h3>Spectacular designs of animals in polygonal style</h3>
                <p>Digital art is an artistic work or practice
                    that uses digital Digital art is an artistic work or practice
                    that uses digital Digital art is an artistic work or practice</p>
                </div>
                <div class="card__footer">
                    <h4>Cosmos<em>Hesperioidea</em></h4>
                    <span><img src="img/card_bg03_icon03.png" alt=""></span>
                </div>
            </article>
            
             <article class="card">
                <figure class="card__header">
                    <img src="img/card_bg03_03.jpg" alt="">
                    <figcaption>Art</figcaption>
                </figure>
                <div class="card__contents">
                    <h3>Spectacular designs of animals in polygonal style</h3>
                <p>Digital art is an artistic work or practice
                    that uses digital Digital art is an artistic work or practice
                    that uses digital Digital art is an artistic work or practice</p>
                </div>
                <div class="card__footer">
                    <h4>Cosmos<em>Hesperioidea</em></h4>
                    <span><img src="img/card_bg03_icon03.png" alt=""></span>
                </div>
            </article>
        </div>
    </section>
</body>
</html> -->