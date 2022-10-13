<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- JSTL list 사이즈 구하는 것 관련 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet"><!-- font -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"><!-- bootstrap 5 -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script><!-- bootstrap 5 icon -->
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script><!-- jquery -->
    
</head>
<style>

	@font-face {
	    font-family: 'SeoulNamsanM';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulNamsanM.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	a.menu-qna {
	    color:#000 !important;
	}
	body * {
		font-size: 15px;
	}
	div.qna-wrapper {
		width: 100%;
		height: 100%;
		margin-bottom: 100px;
	}
	div.qna-top {
		padding: 25px 0;
		position:sticky;
		top:100px;
		background-color: white;
		height: 90px;
	}
	div.qna-top>hr{
		width: 110px; 
		height: 10px; 
		position: relative; 
		top:-28px; 
		color: #cff0cc; 
		opacity: 1; 
		z-index: -1;
	}
	b.qna-top-b2 {
		font-size: 25px;
		font-weight: 1000;
	}
	
	
</style>
<body>
	<div class="qna-wrapper">
	
		<!-- 상단 -->
		<div class="qna-top">
			<b class="qna-top-b2">문의 내역</b>
			<hr>
		</div>
		
		<!-- 내용 -->
		<div class="qna-result" style="width: 100%; height: 800px;">
		
			<!-- 일반 유저 user -->
			<c:if test="${sessionScope.loginid!=null}">
			
			<table class="table table-borderd">
				<tr style="text-align: center; background-color: #f5f5f5;">
					<th style="width: 150px;">문의 유형</th>
					<th style="width: 350px; text-align: left;">문의 제목</th>
					<th style="width: 150px;">처리 상태</th>
					<th style="width: 150px;">등록일</th>
				</tr>
				
				
			
				
				<!-- list 가 0이 아닐때 -->
				<c:if test="${fn:length(qnaList)!=0}">
				
					<c:forEach var="s" items="${qnaList}">
					
						<tr style="text-align: center; border-top: 2px solid gray; font-weight: bold;">
							<td>${s.name}</td>
							<td style="text-align: left;">${s.title}</td>
							<td>
								<c:if test="${s.qnaStatus=='답변대기중'}">
									<span style="color: red;">${s.qnaStatus}</span>
								</c:if>
								
								<c:if test="${s.qnaStatus!='답변대기중'}">
									<span style="color: #1C8FED;">${s.qnaStatus}</span>
								</c:if>
							</td>
							<td><fmt:formatDate value="${s.createdAt}" pattern="yyyy-MM-dd"/></td>
						</tr>
						
						<tr valign="middle">
							<td style="text-align: center;">Q</td>
							<td colspan="3">
								<pre style="font-family: SeoulNamsanM; font-size: 14px;">${s.content}</pre>
							</td>
						</tr>
	
	
						<c:if test="${s.qnaStatus!='답변대기중'}">
						<tr>
							<td style="vertical-align: middle; text-align: center; background-color: #cff0cc;">A</td>
							<td colspan="3">
								이메일로 답변 완료된 문의입니다.
							</td>
						</tr>
						</c:if>
					
					</c:forEach>
				
				</c:if>
				
				
				<!-- 문의 내역이 없을때 -->
				<c:if test="${fn:length(qnaList)==0}">
				<tr>
					<td colspan="4" style="text-align: center;">
						<h5>문의 내역이 없습니다</h5>
					</td>
				</tr>
				</c:if>
			
			</table>
			
			</c:if> <!-- 일반 user 종료 -->
			
			
			
			<!-- 판매자 계정 seller -->
			<c:if test="${sessionScope.loginid_seller!=null}">
				<br><br>
				<h5>판매자 계정은 영업 담당자를 통해 문의해주시기 바랍니다.</h5>
			</c:if>
		</div>
	</div>	
</body>
</html>