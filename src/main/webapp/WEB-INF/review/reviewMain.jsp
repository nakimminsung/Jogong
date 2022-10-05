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
</style>
</head>
<body>
	<h1>reviewMain</h1>
<%-- 	<div class="searcharea" style="width:100%; text-align: center;">
		<form action="list">
			<div class="input-group" style="width:450px;">
				<!-- <select class="from-select" style="width:150px;" name="searchcolumn">
					<option value="subject">제목</option>
					<option value="id">아이디</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
				</select> -->
				&nbsp;&nbsp;&nbsp;
				<input type="text" name="searchword" class="form-control" style="width:140px;"
					placeholder="검색단어" value="${param.searchword }">
				<button type="submit" class="btn btn-success">검색</button>
			</div>
		</form>
		<a href="list?searchcolumn=id&searchword=${sessionScope.loginid }">내가쓴글</a>
	</div>
	
	<div class="boardlist" style="margin-top: 10px;">
		<h3 class="alert alert-danger">총 ${totalCount }개의 글이 있습니다</h3>
		<br><br>
		<table class="table table-bordered">
			<tr style="background-color: #ddd">
				<th style="width: 50px;">번호</th>
				<th style="width:350px;">제목</th>
				<td style="width:80px;">작성자</td>
				<td style="width:120px;">작성일</td>
				<td style="width:50px;">조회</td>
				<td style="width:50px;">좋아요</td>
			</tr>
		 	<c:if test="${totalCount == 0 }">
				<tr>
					<td colspan="6" align="center">
						<h4>등록된 글이 없습니다</h4>
					</td>
				</tr>	
			</c:if>
			<c:if test="${totalCount > 0 }">
				<c:forEach var="dto" items="${list }">
					<tr>
						<td align="center">${no }</td>
						<c:set var="no" value="${no-1 }"/>
						<td>
							
							
							<a href="detail?num=${dto.num }&currentPage=${currentPage}" style="color:black;">
								${dto.subject }
								<c:if test="${dto.photo!='no' }">
									<i class="fa fa-file-picture-o" style="color:gray;"></i>
								</c:if>
								
							
							</a>
						</td>
						<td align="center">${dto.name }</td>
						<td align="center">
							<fmt:formatDate value="${dto.createdAt }"  pattern="yyyy-MM-dd"/>
						</td>
						<td align="center">${dto.readcount }</td>
						<td align="center">${dto.likes }</td>
					</tr>
				</c:forEach>
			</c:if> 
			
			<!-- 글쓰기 버튼은 로그인을 해야만 보인다 -->
			<c:if test="${sessionScope.loginok!=null }">
				<tr>
					<td colspan="6" align="right">
						<button type="button" class="btn btn-outline-success"
							onclick="location.href='form'">글쓰기</button>
					</td>
				</tr>
			</c:if> 
		</table>
	</div>
	
	
	
	
	
	<div class="paging" style="margin-left:200px;">
		<ul class="pagination">
			<c:if test="${startPage>1 }">
				<li class="page-item"><a href="list?currentPage=${startPage-1 }" class="page-link">이전</a></li>
			</c:if>
			
			<!-- 페이지 번호 -->
			<c:forEach var="pp" begin="${startPage }" end="${endPage }">
				<c:if test="${pp==currentPage }">
					<li class="page-item active"><a class="page-link" href="list?currentPage=${pp }">${pp }</a></li>
				</c:if>
				<c:if test="${pp!=currentPage }">
					<li class="page-item"><a class="page-link" href="list?currentPage=${pp }">${pp }</a></li>
				</c:if>	
			</c:forEach>
			
			
			<c:if test="${endPage<totalPage }">
				<li class="page-item"><a href="list?currentPage=${endPage+1 }" class="page-link">다음</a></li>	
			</c:if>
		</ul>
	</div> --%>
</body>
</html>

