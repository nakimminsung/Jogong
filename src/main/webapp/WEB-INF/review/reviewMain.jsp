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
	/*   border: 1px solid #f6f7f7;  */
	 /* flex-grow: 1; */
  	  width: 200px;
      height: 300px;
      /* perspective: 1100px; */ 
      margin:10px;
      border-radius: 20px;
	}

	.card-review {
	  width: 100%; 
	  height: 100%; 
	  position: relative;
	  transition: .4s;
	  transform-style: preserve-3d;
      border-radius: 20px;
      border: 1px solid gray;
	}	
	
	.front, .back {
	  position: absolute;
	  width: 100%; 
	  height: 100%;
	  backface-visibility: hidden;
      border-radius: 20px;
	}
	
	.back { 
	 
	  transform: rotateY(180deg);
	}
	
	.flip:hover .card-review {
	  transform: rotateY(180deg);
	}
	
	.reviewBox>img {
    	/* width: 150px;
    	height: 150px; */ 
    	border-radius: 70%;
    	overflow: hidden;
	}
</style>
<script type="text/javascript">

	$(function(){
		var userId = $('.reviewUser').val();
		/* console.log(userId); */
		$("document").ready(function(){
		 	getUserList(); 
		});	
	});
	
	 function getUserList(){
		$.ajax({
			type:"get",
			url:"../user/review",
			dataType:"json", 
			success:function(res){
				/*  console.log(res); */
				$.each(res,function(i,e){
					var s = "";
				 	s+="<div class='reviewBox'>"; 
					s+="<img src='"+e.profileImage+"' width=20>"+e.nickname;
					s+="</div>"; 
					$(".reviewUser[userNum="+e.num+"]").html(s);
					//console.log(s);
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
	        		<div class="card-review" >
	        		
	        			<div class="front" style="overflow: hidden;">
	        				<img src="${dto.reviewImageUrl }" width="250" height="250">
	        				<h6 style="display:inline;">${dto.subject }</h6 >
	        				<p  style="display:inline;"><i class="fas fa-star" style="color: rgb(247, 200, 21);"></i><b>${dto.rating }</b></p>
	        				<p class="reviewUser" userNum="${dto.userNum }"ß></p>
	        				<!-- <img src= -->
	        			</div>
	        			
	        			<div class="back">
	        				<%-- <div onclick="location.href='product/detail?num=${e.num}">
	        					
	        				</div> --%>
	        				<a href="${root }/jogong/product/detail?num=${dto.productNum}">${dto.name }</a>
	        				<fmt:formatDate value="${dto.createdAt}"  pattern="yyyy-MM-dd"/>
	        				
	        			</div>
	        			
	        		</div>
	      		</div>				
			</c:forEach> 
		</div>
    </div>
	
</body>
</html> 