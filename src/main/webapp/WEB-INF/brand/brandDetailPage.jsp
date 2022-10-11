<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	.brandTop{
		-webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    background-repeat: no-repeat;
	    box-sizing: inherit;
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    margin: 0;
	    -webkit-font-smoothing: antialiased;
	    top: 0;
	    width: 100%;
	    border-bottom: 10px solid #ebebeb;
	    position: relative;
	    padding: 0 16px;
	}
	
	brandTop_inner{
	    -webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    box-sizing: inherit;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    -webkit-font-smoothing: antialiased;
	    position: relative;
	    background: #fff;
	    display: flex;
	    align-items: center;
	    max-width: 1180px;
	    margin: 0 auto;
	    padding: 28px 0 40px;
	    border: 0;
	}
	.brandTop_logo{
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    background-repeat: no-repeat;
	    box-sizing: inherit;
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    margin: 0;
	    padding: 0;
	    -webkit-font-smoothing: antialiased;
	    margin-right: 24px;
	}
	.brandTop_logo img{
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    margin: 0;
	    padding: 0;
	    -webkit-font-smoothing: antialiased;
	    background-size: cover;
	    background-position: 50%;
	    width: 120px;
	    border-radius: 24px;
	}
	.brandTop_content{
		-webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    background-repeat: no-repeat;
	    box-sizing: inherit;
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    margin: 0;
	    -webkit-font-smoothing: antialiased;
	    padding: 0;
	}
	.brandTop_name{
	    -webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    background-repeat: no-repeat;
	    border: 0;
	    vertical-align: baseline;
	    margin: 0;
	    padding: 0;
	    -webkit-font-smoothing: antialiased;
	    box-sizing: border-box;
	    margin-bottom: 16px;
	    font-weight: 600;
	    font-size: 28px;
	}
	.brandTop_desc{
		-webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    background-repeat: no-repeat;
	    border: 0;
	    vertical-align: baseline;
	    margin: 0;
	    padding: 0;
	    -webkit-font-smoothing: antialiased;
	    box-sizing: border-box;
	    margin-bottom: 16px;
	    font-weight: 500;
	    margin-top: 12px;
	    font-size: 16px;
	}
	.content{
	    -webkit-text-size-adjust: none;
	    -webkit-font-smoothing: antialiased;
	    font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,나눔고딕,Segoe UI,Helveica,Arial,Malgun Gothic,Dotum,sans-serif;
	    color: #222;
	    box-sizing: border-box;
	    -webkit-tap-highlight-color: transparent;
	    display: flex;
	    position: relative;
	    margin: 0 auto;
	    padding: 0 40px 80px;
	    max-width: 1280px;
	}
	
	.leftFilter{
	    -webkit-text-size-adjust: none;
	    -webkit-font-smoothing: antialiased;
	    font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,나눔고딕,Segoe UI,Helveica,Arial,Malgun Gothic,Dotum,sans-serif;
	    color: #222;
	    box-sizing: border-box;
	    -webkit-tap-highlight-color: transparent;
	    margin: 0;
	    padding: 0;
	    width: 210px;
	    margin-right: 10px;
	    padding-right: 10px;
	    overflow-x: hidden;
	    overflow-y: auto;
	}
	.brandList{
	    -webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    font-family: "Poppins","Noto Sans KR",sans-serif;
	    background-repeat: no-repeat;
	    box-sizing: inherit;
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    padding: 0;
	    -webkit-font-smoothing: antialiased;
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	    max-width: 1180px;
	    margin: 32px auto;
	}
	.brandList span{
	   	-webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    background-repeat: no-repeat;
	    border: 0;
	    vertical-align: baseline;
	    margin: 0;
	    padding: 0;
	    -webkit-font-smoothing: antialiased;
	    box-sizing: border-box;
	    font-family: "Poppins","Noto Sans KR",sans-serif;
	    font-weight: 500;
	    font-size: 18px;
	}
	.brandList div{
	    -webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    font-family: "Poppins","Noto Sans KR",sans-serif;
	    background-repeat: no-repeat;
	    box-sizing: inherit;
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    margin: 0;
	    padding: 0;
	    -webkit-font-smoothing: antialiased;
	}
	
	.productTheme{
		width:90%;
		display: grid;  
  		grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  		margin-bottom: 30px;
	}
	
	.cardTheme>img.card-img-top{ 
		height: 17rem;
	}
	
	.tp{
		margin-left: 50px;
		margin-bottom: 30px;
		cursor: pointer;
	}
	
	.tp>img{
		border-radius: 20%;
	}
	
	.tp>img:hover{
		background-color: #EEEEEE;
		border-radius: 20%;
	}
	
	.themeProduct{
		margin-top: 50px;
		margin-bottom: 50px;
	}
	
	.cardTheme { 
		display:none; 
	}
	
	.cardTheme>div.card-body:hover{
		background-color: #f6f7f7;
		cursor: pointer;
	}	
	
	.loadProduct{
		border-style: solid;
		width: 500px;
   		height: 49px;
    	padding-top: 2px;
    	border: 1px solid #ddd;
    	font-size: 13px;
    	line-height: 45px;
    	color: #222;
    	background-color: white;
	}
	
	.cardTheme{
		margin-left: 30px;
		margin-top:30px;
	}
	
	.tagList>img{
		width: 50px;
	}
	
	div.tagList{
		background-color: #94E3f7;
	}
</style>
</head>
<body>
<div class="brand_layout">

	<!-- 상단에 브랜드 노출 -->
	<div class="brandTop">
		<div class="brandTop_inner input-group">
			<div class="brandTop_logo">
				<img alt="로고썸네일" src="/jogong/resources/image/21.jpeg">
			</div>
			<div class="brandTop_content">
				<p class="brandTop_name">브랜드 이름</p>
				<p class="brandTop_desc">설명</p>
			</div>
		</div>
	</div>
	<!-- 상단에 브랜드 노출 끝 -->
	
	<!--  -->
	<!--  -->
	
	<!-- 컨텐트 뷰 -->
	<div class="content">
	
	<!--  -->
	<!--  -->
	
		<!-- 좌측 필터 -->
		<div class="leftFilter"></div>
		<!-- 좌측 필터 -->

	<!--  -->
	<!--  -->
	
		<!-- 옵션 -->
		<div class="brandList">
			<span>총 +a 개</span>
			<div>가격순,등</div>
		</div> 
		<!-- 옵션 끝 -->
		
	<!--  -->
	<!--  -->
		<!-- 상품목록  -->
		<div class='card cardTheme'>
			<img class='card-img-top' src='/jogong/resources/image/21.jpeg' alt='Card image cap'>
			<div class='card-body'>
				<h5 class='card-title'>브랜드명</h5>
				<p class='card-text' style='text-overflow:ellipsis;overflow: hidden;white-space: nowrap;display: block;max-width: 350px;'>상품명</p>
				<p class='card-text'><b>가격</b></p>
			</div>
		</div>
		<!-- 상품목록 끝  -->
		
	</div><!-- 컨텐트 뷰 끝 -->
</div>
</body>
</html>