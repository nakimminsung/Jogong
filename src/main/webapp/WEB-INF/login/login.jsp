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
	*{
		 font-family: 'Jua';
	}
</style>
</head>
<body>
	<div>
		<h4>로그인</h4>
			<input type="text" placeholder="이메일(아이디)" id="loginid" name="id"><br>
			<input type="password" placeholder="비밀번호" id="loginpass"><br>
			<button type="submit" id="loginok">로그인</button>
	</div>	
	<script type="text/javascript">
	$("#loginok").click(function(){
		var id=$("#loginid").val();
		var pass=$("#loginpass").val();

		$.ajax({
			type:"get",
			url:"login",
			dataType:"json",
			data:{"id":id,"pass":pass},
			success:function(res){
				if(res.result=="fail"){
					alert("아이디나 비밀번호가 틀렸습니다");
				}else{
					location.href="http://localhost:9000/jogong/";
				}
						
			},
		});
	});
	</script>
</body>
</html>
