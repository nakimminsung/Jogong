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
	    -webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    font-family: "Poppins","Noto Sans KR",sans-serif;
	    box-sizing: inherit;
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    margin: 0;
	    -webkit-font-smoothing: antialiased;
	    position: relative;
	    background: #fff;
	    z-index: 10;
	    padding: 0 16px;
	    border-top: 1px solid #ebebeb;
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
	.itemList{
	    -webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    font-family: "Poppins","Noto Sans KR",sans-serif;
	    box-sizing: inherit;
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    margin: 0;
	    -webkit-font-smoothing: antialiased;
	    background: #fff;
	    grid-template-columns: repeat(4,1fr);
	    grid-gap: 0;
	    padding: 0;
	    border-bottom: none;
	    margin-top: 0;
	}
	.listRow{
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
	ul{
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
	    -webkit-font-smoothing: antialiased;
	    list-style: none;
	    padding: 0!important;
	    display: grid;
	    grid-template-columns: repeat(4,1fr);
	    grid-gap: 28px;
	    max-width: 1180px;
	    margin: 0 auto;
	}
	.sgItem{
	    -webkit-text-size-adjust: 100%;
	    word-break: normal;
	    tab-size: 4;
	    text-rendering: optimizeLegibility;
	    -webkit-tap-highlight-color: rgba(0,0,0,0);
	    line-height: 1.5;
	    color: rgba(0,0,0,.87);
	    list-style: none;
	    font-family: "Poppins","Noto Sans KR",sans-serif;
	    background-repeat: no-repeat;
	    box-sizing: inherit;
	    border: 0;
	    font-size: 100%;
	    font-weight: 400;
	    vertical-align: baseline;
	    margin: 0;
	    -webkit-font-smoothing: antialiased;
	    padding: 0;
	    box-shadow: none;
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
		<!-- 좌측 필터 -->
		<!-- <div class="leftFilter"></div> -->
		<!-- 좌측 필터 -->
	
		<!-- 옵션 -->
		<div class="brandList">
			<span>총 +a 개</span>
			<div>가격순,등</div>
		</div> 
		<!-- 옵션 끝 -->
	<!--  -->
	<!--  -->
		<!-- 상품목록  -->
	<div class="itemList">	
		<div class="listRow">
			<ul>
				<li class="sgItem">
				<div class='card cardTheme'>
					<img class='card-img-top' src='/jogong/resources/image/21.jpeg' alt='Card image cap'>
					<div class='card-body'>
						<h5 class='card-title'>브랜드명</h5>
						<p class='card-text' style='text-overflow:ellipsis;overflow: hidden;white-space: nowrap;display: block;max-width: 350px;'>상품명</p>
						<p class='card-text'><b>가격</b></p>
					</div>
				</div>
				</li>
				<li class="sgItem">
				<div class='card cardTheme'>
					<img class='card-img-top' src='/jogong/resources/image/21.jpeg' alt='Card image cap'>
					<div class='card-body'>
						<h5 class='card-title'>브랜드명을 입력하세요</h5>
						<p class='card-text' style='text-overflow:ellipsis;overflow: hidden;white-space: nowrap;display: block;max-width: 350px;'>상품명</p>
						<p class='card-text'><b>가격을 입력하세요</b></p>
					</div>
				</div>
				</li>
			</ul>	
		</div>
	</div><!-- 상품목록 끝  -->
		
	</div><!-- 컨텐트 뷰 끝 -->
</div>
</body>
</html>