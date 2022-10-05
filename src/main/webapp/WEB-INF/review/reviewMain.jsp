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

</script>
</head>
<body>
	<div  align="center">
		<h4>실시간후기</h4>
		<h6 style="color: gray;">고객분들의 실시간 후기를 소개합니다.</h6>
	</div>
	<div class="flex-outer-container">
		<div class="flex-inner-container">
			<c:forEach var="dto" items="${list }">
 				<div class="flip">
	        		<div class="card" >
	        			<div class="front" style="overflow: hidden;">
	        				<img src="${dto.reviewImageUrl }" width="250" height="250">
	        				<h6 align="center" >${dto.subject }</h6>
	        				<p align="right"><i class="fas fa-star" style="color: rgb(247, 200, 21);"></i><b>${dto.rating }</b></p>
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
<%-- 	<div  align="center">
		<h4>실시간후기</h4>
		<h6 style="color: gray;">고객분들의 실시간 후기를 소개합니다</h6>
	</div>
	<c:forEach var="dto" items="${list }">
		
		<tr>
			<td align="center">${no }</td>
			<c:set var="no" value="${no-1 }"/>
			<td>
	
				<!-- 답글일 경우 답글 이미지 넣기 -->
				<c:if test="${dto.relevel>0 }">
					<img src="../image/re.png">
				</c:if>
				<a href="detail?num=${dto.num }&currentPage=${currentPage}" style="color:black;">
					${dto.subject }
					<c:if test="${dto.photo!='no' }">
						<i class="fa fa-file-picture-o" style="color:gray;"></i>
					</c:if>
					
					<!-- 댓글이 0개 이상인경우에 댓글 갯수 출력 -->
					<c:if test="${dto.acount>0 }">
						<b style="color:red;">[${dto.acount }]</b>
					</c:if>
				</a>
			</td>
			<td align="center">${dto.name }</td>
			<td align="center">
				<fmt:formatDate value="${dto.writeday }"  pattern="yyyy-MM-dd"/>
			</td>
			<td align="center">${dto.readcount }</td>
			<td align="center">${dto.likes }</td>
		</tr>
	</c:forEach> --%>
</body>
</html>