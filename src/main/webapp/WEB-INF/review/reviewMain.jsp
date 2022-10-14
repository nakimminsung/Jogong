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
	a.header-review>span{
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
		font-size: 15px;
		font-family: 'SeoulNamsanM';
		word-spacing: -1px;
	}
	
 	div {
        box-sizing: border-box;
       
      }
	.flex-outer-container {
	  margin: 0 auto;
	  max-width: 1180px;
	  padding-left:70px;
	  
	}
	.flex-inner-container {
	  display: flex;
	  flex-direction: row;
    	margin-top: 15px;
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
  	  width: 200px;
      height: 310px;
      margin:20px;
      border-radius: 20px;
	}

	.card-review {
	  width: 100%; 
	  height: 100%; 
	  position: relative;
	  transition: .4s;
	  transform-style: preserve-3d;
      border-radius: 20px;
      border: 1px solid #f6f7f7;
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
    	border-radius: 70%;
    	overflow: hidden;
	}
	
	.reviewBox {
    	position: absolute;
    	right: 20px;
	}
	
	.back {
		position: relative;
	}
	
	.backBottom {
    	position: absolute;
    	bottom: 2px;
    	padding-left: 10px;
	}
	
	.backBottom>a:hover {
    	color: #add0bb;
	}
	
	.frontInfo{ 
		padding-left: 10px;
	}
	
</style>
<script type="text/javascript">

	$(function(){
		var userId = $('.reviewUser').val();
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
				$.each(res,function(i,e){
					var s = "";
				 	s+="<div class='reviewBox'>"; 
					s+="<img src='"+e.profileImage+"' width=20>"+e.nickname;
					s+="</div>"; 
					$(".reviewUser[userNum="+e.num+"]").html(s);
				});
			}
		});
	}   
	 
	 function getProductList(price){                                                             
			var s = "";
			$.ajax({
				type:"get",
				url:"product/list",
				data:{"price":price},
				dataType:"json", 
				success:function(res){
					console.log(res);
					$.each(res,function(i,e){
							s+="<div class='card cardPrice' onclick=\"location.href='product/detail?num="+e.num+"'\">";
							s+="<img class='card-img-top' src='"+ e.thumbnailImageUrl+"' alt='Card image cap'>";
							s+="<div class='card-body'>";
								s+="<h5 class='card-title'>"+e.brand+"</h5>";
								s+="<p class='card-text' style='text-overflow:ellipsis;overflow: hidden;white-space: nowrap;display: block;max-width: 350px;'>"+e.name+"</p>";
								s+="<p class='card-text'><b>&#8361;"+e.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"</b></p>";
							s+="</div>";
						s+="</div>";
					});
					$("div.productPrice").html(s);
				}
			});
		}

</script>
</head>
<body>
	<input type="hidden" class="reviewUser" value=${dto.userNum }>
	<input type="hidden" class="reviewImage" value="${dto.reviewImageUrl}">
	<input type="hidden" class="reviewSubject" value="${dto.subject }">
<div class="reviewInner" style="margin-top: 30px">
	<div align="center">
		<h2 style="font-weight: bold; display: flex; flex-direction: column; justify-content: center; align-items: center; width: 100%;">실시간후기</h2>
		<hr style="width: 140px; height: 10px; position: relative; top: -22px; color: #cff0cc; opacity: 1; z-index: -1;">
		<span style="color: gray; margin-top: -5px; font-size: 20px">고객분들의 실시간 후기를 소개합니다.</span>
	</div>
	${dto.subject }
	<div class="flex-outer-container">
		<div class="flex-inner-container">
			 <c:forEach var="dto" items="${list }">
 				<div class="flip">
	        		<div class="card-review" >
	        			<div class="front" style="overflow: hidden;">
	        				    <c:if test="${dto.reviewImageUrl==null}"> 
            						<img src="${dto.thumbnailImageUrl }" width="250" height="250" style="margin:0px;">
       			 				</c:if>
       			 				
       			 				<c:if test="${dto.reviewImageUrl !=null }">
       			 					<img src="${dto.reviewImageUrl }" width="250" height="250" style="margin:0px;" onerror="this.src='${dto.thumbnailImageUrl }';">
       			 				</c:if>
	        				<div class="frontInfo">
		        				<h6 style="display:inline;">${dto.subject }</h6 >
		        				<p  style="display:inline; position: absolute;"><i class="fas fa-star" style="color: rgb(247, 200, 21);"></i><b>${dto.rating }</b></p>
		        				<p class="reviewUser" userNum="${dto.userNum }"></p>
	        				</div>
	        			</div>
	        			
	        			<div class="back">
	        				<h5 style="text-align:center; font-weight: 900;">${dto.subject }</h5 >
	        				<div class="backTop">
	        					<p style="color: gray; text-align: left;">${dto.content }</p>
	        				</div>
	        				<div class="backBottom" style="position: left;">
	        					<a href="${root }/jogong/product/detail?num=${dto.productNum}" style='text-overflow:ellipsis;overflow: hidden;white-space: nowrap;display: block;max-width: 190px;'>${dto.name }</a>
	        					<div class="reviewDate">
	        						<fmt:formatDate value="${dto.createdAt}"  pattern="yyyy-MM-dd"/>
	        					</div>
	        				</div>
	        			</div>
	        		</div>
	      		</div>				
			</c:forEach> 
		</div>
    </div>
</div>    
</body>
</html> 