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
<style type="text/css">
	@font-face {
    font-family: 'SeoulNamsanM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulNamsanM.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	body * {
		 font-family: 'SeoulNamsanM';
		 word-spacing: -1px;
	}
	.all{
		width: 100%;
		height: 330px;
		
		text-align: center;
		
		padding-top: 50px;
	}
</style>
</head>
<body>
<div class="all">
	<h3>비밀번호 찾기</h3>
	<hr style="width: 130px; height: 10px; position: relative; top:-25px; left:156px; color: #cff0cc; opacity: 1; z-index: -1;">
	<form class = "content" action="pw_auth.me" method="post">
		<div class="textbox">
	  		&nbsp;&nbsp;&nbsp;이름:<input id="text" name=nickname required="required" type="text" placeholder="이름" />
 		</div>
		<div class="textbox">
  			아이디:<input id="email" name=email placeholder="이메일 형식"/>
		</div><br>
   			<input type="submit" class="btn btn-outline-secondary" id="check" value="비밀번호찾기">
	</form>
</div>
</body>
</html>
