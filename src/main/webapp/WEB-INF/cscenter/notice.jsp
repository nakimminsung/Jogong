<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">   

 <link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<style type="text/css">
	*{
		 font-family: 'Jua';
		 
	}
	.ncontent{
	background-color: #f5f5f5; 
	padding-left: 40px; 
	padding-top: 15px;
	padding-bottom: 5px;
	
	}
	
</style>
<script type="text/javascript">

	function toggleNotice(num) {
		//alert(a);
		$("#ncontent"+num).toggle();
		
		  if($("#ncontent"+num).is(":visible")){
			  $("#title"+num).css("background-color","#FFF064");
			  $("#icon"+num).html("<i class='fas fa-angle-up'></i>");
		  }else {
			  $("#title"+num).css("background-color","white");
			  $("#icon"+num).html("<i class='fas fa-angle-down'></i>");
		}
		
	}
	
</script>
</head>
<body>
<div style="background-color: white;">
<h3 class="alert alert-secondary" style="width: 100%">공지사항</h3>

	<table class="table">
		
		<c:forEach var="dto" items="${notice}">
			<tr>
				<td> 
					<div id="title${dto.num }" onclick="toggleNotice('${dto.num }')" style="cursor: pointer; padding-top: 10px;padding-bottom: 10px;padding-left: 5px;">
						<span id="icon${dto.num }"><i class='fas fa-angle-down'></i></span>&emsp;&nbsp;
						<span style="font-size: 13px; color: gray;"><fmt:formatDate value="${dto.createdAt}" pattern="yyyy-MM-dd"/></span><br>&emsp;&emsp;
						<span>${dto.title }</span><br>
					</div> 
					 <div id="ncontent${dto.num }" style="display: none;" class="ncontent">
					 	<pre style="font-size: 15px;">${dto.content }</pre>
					 </div>	
					
				</td>
			</tr>
	</c:forEach>
		<tr>
			<td style="border: none;text-align: center;">
				<br>
				<button type="button" class="btnqna btn btn-outline-info" onclick="location.href='../cscenter/faq'">뒤로가기</button>	
			</td>
		</tr>	
	</table>
</div>
</body>
</html>
