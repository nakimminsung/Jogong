<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    
    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- bootstrap 5 icon -->
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	
	<style>
		div.footer-right b{
			font-size: 11px;
			color: gray;
		}
		div.footer-right div{
			margin-bottom: -3px;
		}
		div.footer-left b{
			font-size: 30px;
			color: gray;
		}
		div.footer-link a{
			font-size: 13px;
		}
		div.footer-link a{
			font-size: 13px;
			color: gray;
			cursor: pointer;
		}
		img {
			margin-top: 10px;
		}
	</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
	<div class="footer-wrapper" style="width: 100%; display: flex; justify-content: center;">
		<div class="footer-content" style=" max-width: 1180px; width: 100%; display: flex; justify-content: center; padding: 10px 0;">
			<div class="footer-left" style="width: 20%; text-align: right; padding-right: 10px;">
				<b style="font-size: 20px;">조공</b>
			</div>
			<div class="footer-right" style="width: 80%;">
				<div>
					<b>(주)조공 : 김병찬</b>&nbsp;&nbsp;
					<b>주소 : 서울특별시 강남구 역삼동 테헤란로5길 7 위워크</b>
					<div class="footer-link" style="display: inline; float: right;">
						<a>고객센터</a>
						&nbsp;|&nbsp;
						<a>이용약관</a>
						&nbsp;|&nbsp;
						<a>개인정보처리방침</a>
						&nbsp;|&nbsp;
						<a>지식재산관보호센터</a>
					</div>
				</div>
				<div>
					<b>사업자등록번호 : 120-81-47525</b>&nbsp;&nbsp;
					<b>통신판매업신고번호 : 제2022 - 서울 - 0011호</b>&nbsp;&nbsp;
					<b>호스팅 사업자 : (주)조공</b>
				</div>
				<div><b>구매안전서비스 : 가입사실확인이메일 : cs.gift@kakaocorp.com고객센터 : 1544-2431 (통화료 발생 / 평일 09:00~19:00)  톡상담하기 (평일 09:00~19:00)</b></div>
				<div><b>©jogong Corp. All rights reserved</b></div>
				<img src="https://gift-s.kakaocdn.net/dn/gift/images/m640/img_pcfamily.png">
			</div>
	    </div>
	</div>
</body>
</html>