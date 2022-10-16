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
		height: 300px;
		
		text-align: center;
		
		padding-top: 70px;
	}
</style>
</head>
<body>

	<div class="all">
		
		<h3>아이디 찾기</h3>
		
		<div class="textbox">
	  		&nbsp;&nbsp;&nbsp;
	  		이름 : <input class="userName" type="text" required="required" placeholder="이름을 입력하세요"/><br>
	  		연락처 : <input class="userPhone" oninput="autoHyphen2(this)" required="required"
	  		 placeholder="010-0000-0000" maxlength="13" minlength="12" style="margin-top: 5px;"/>
		</div><br><br>
	   	<button type="button" class="btn btn-outline-secondary">아이디 찾기</button>
	   	
	</div>
	
</body>

<script type="text/javascript">
	$(function () {
		$(".btn").click(function () {
			var nickname=$(".userName").val();
			var phone=$(".userPhone").val();
			//alert(nickname+"/"+phone);
			 $.ajax({
				type:"post",
				dataType:"json",
				url:"checkId",
				data:{"nickname":nickname,"phone":phone},
				success:function(res){
					if(res.emailCheck=="success"){
						alert("찾으시려는 아이디: "+res.email);
						close();
					}else{
						alert("아이디를 찾을 수 없습니다");
						$(".userName").val("");
						$(".userPhone").val("");
					}
				}
			}); 
		});
	})//function
	
	//휴대폰 하이픈 정규식
	const autoHyphen2 = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
	

	
	
	
</script>

</html>
