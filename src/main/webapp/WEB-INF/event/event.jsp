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
	
<style>
	a.header-event>span{
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
		 font-family: 'SeoulNamsanM';
		 word-spacing: -1px;
	}
	span.event-title {
		font-size: 27px;
		font-weight: 1000;
	}
	span.event-subtitle {
		font-size: 20px;
		color: #808080;
		position: relative;
		top: -30px;
	}
	div.event-top>hr{
		width: 80px; 
		height: 10px; 
		position: relative; 
		top:-28px; 
		color: #cff0cc; 
		opacity: 1; 
		z-index: -1;
	}
	
	/* 이벤트 목록 */
	div.event-list-result {
		display: flex; 
		width: 100%; 
		padding-top: 20px; 
		flex-wrap: wrap; 
		justify-content: flex-start; 
		align-items: flex-start; 
		margin-top: 10px;
	}
	div.event-object {
		width:25%; 
		display: flex; 
		flex-direction: column; 
		align-items: center; 
		margin-bottom: 50px;
	}
	div.event-object>a>div {
		display: flex; 
		flex-direction: column;
	}
	div.event-object>a>img{
		width: 250px; 
		height: 300px; 
		background-color: #d0d0d0;
	}
	.event-obeject-brand{
		font-size: 13px; 
		color: #808080;
	}
	.event-obeject-title{
		font-size: 15px; 
		font-weight: 1000;
	}
	.card-body{
		max-width: 250px;
		min-height: 100px;
	}
</style>
</head>
<body>
	<div class="event-wrapper" style="display: flex; flex-direction: column; align-items: center; max-width: 1180px; margin: 0 auto; min-height: 1000px; margin-top: 30px;">
		
		<div align="center">
			<h2 style="font-weight: bold; display: flex; flex-direction: column; justify-content: center; align-items: center; width: 100%;">이벤트</h2>
			<hr style="width: 100px; height: 10px; position: relative; top: -22px; color: #cff0cc; opacity: 1; z-index: -1;">
			<span style="color: gray; margin-top: -5px; font-size: 20px">조공에서 준비한 다양한 이벤트🤗</span>
		</div>
		
		<!-- <div class="event-top" style="display: flex; flex-direction: column; justify-content: center; align-items: center; width: 100%;">
			<span class="event-title">이벤트</span>
			<hr>
			<span class="event-subtitle">조공에서 준비한 다양한 이벤트🤗</span>
		</div> -->
		<div class="event-middle" style=" width:100%; display:flex; justify-content: space-between; padding: 0 25px;">
			<div class="event-count"></div>
			<div class="event-option">
				<select class="form-select event-select" name="sort">
					<option value="createdAt desc" selected>최신순</option>
					<option value="readCount desc">인기순</option>
				</select>
			</div>
		</div>
		<div class="event-list-result">
		</div>
		<div class="event-detail-result">
		</div>
	</div>
</body>
<script>
	$(function(){
		eventList("createdAt desc")
		
		$(".event-select").change(function(){
			var sort=$(this).val();
			eventList(sort)
		});
	});
	
	function eventList(sort){
		var s="";
		$.ajax({
			type: "get",
			url: "../event/list",
			data:{"sort":sort},
			dataType: "json",
			success:function(res){
				$.each(res, function(i,elt) {
					s += "<div class='event-object'>";
					s += "<a href='#' class='card'>";
					s += "<img class='card-img-top' src='"+elt.thumbnailImageUrl+"'>";
					s += "<div class='card-body'>";
					s += "<span class='event-obeject-brand'>"+elt.brand+"</span>";
					s += "<span class='event-obeject-title card-title'>"+elt.subject+"</span>";
					s += "</div>";
					s += "</a>";
					s += "</div>";
				});
				$("div.event-list-result").html(s);
			}
		});
	}
</script>
</html> 