<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>payment</title>
	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	
	<!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    
    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/payment.css">
	
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<script type="text/javascript">
var banner = "";
var card = "";
var message ="";
	$(function() {
		$(document).on("click",".message",function() {
	 		var message = $(this).attr("value");
	 		$("#mms_send_msg").val(message);
	 		
	 	 	$("#msg_sample").text(message);
		});
	/* 	$(".message").click(function() {
	 		var message = $(this).attr("value");
	 		$("#mms_send_msg").text(message);
	 	 	$("#msg_sample").text(message);
		}); */ 
		
		$(".bannerImg").click(function () {
			 banner = $(this).attr("src");
			
			$("img#previewBanner").attr("src",banner);
		});
		
		$(".cardImg").click(function () {
			 card = $(this).attr("src");
			
			$("img#previewTemplate").attr("src",card);
		});
		
	 	$(document).ready(function(){
            $("#mms_send_msg").on('keyup keypress',function(){
				
            	$("#msg_sample").text($(this).val());
            });
        });
	 	
	 
	});
</script>
<body>
<div class="paymain">
        <div class="new-order">
            <div class="subcontents">
                <h1>선물 발송·결제</h1>
                <h2>선물 꾸미기</h2>
                <p style="visibility:hidden" id="to_buyer_name">${buyer_name}</p>
                <div class="justify-cont col-type01">
                    <!-- 테마와 배너 선택 -->
                    <div class="theme_all">

                        <div class="theme">

                            <!-- 테마 선택-->
                        <!--     <div class="head-tab">
                                <h3>테마</h3>
                                <ul class="tab-type01 _tab">
                                    <li><a href="#1-1" class="on">감사</a></li>
                                    <li><a href="#1-2" class="on">축하</a></li>
                                    <li><a href="#1-3" class="on">응원</a></li>
                                    <li><a href="#1-4" class="on">시즈널</a></li>
                                    <li><a href="#1-5" class="on">결혼</a></li>
                                    <li><a href="#1-6" class="on">조문</a></li>
                                </ul>
                            </div> -->
                            <!-- 테마 선택 끝-->
                            
                           <!--  <hr class="line"> -->

                            <!-- 배너-->
                            <div class="row-type01">

                                <!-- 배너영역 id t1~ -->
                                <div class="tabArea" id="t1-1" style="display: block;">
                                <div class="justify-cont col-type02">

                                    <!-- 배너 선택 -->
                                        <div class="banner_choice">
                                            <h4>배너</h4>
                                            <div class="scrollBox">
                                                <div class="deco-list">
                                                    <ul class="banner-div" id="msg_banner">
                                                        <li><img src="/jogong/resources/giftimage/banner/1.jpg" alt="배너이미지"></li>
                                                        <li><img src="/jogong/resources/giftimage/banner/2.jpg" alt="배너이미지" class="bannerImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/banner/3.jpg" alt="배너이미지" class="bannerImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/banner/4.jpg" alt="배너이미지" class="bannerImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/banner/5.jpg" alt="배너이미지" class="bannerImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/banner/6.jpg" alt="배너이미지" class="bannerImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/banner/7.jpg" alt="배너이미지" class="bannerImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/banner/8.jpg" alt="배너이미지" class="bannerImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/banner/9.jpg" alt="배너이미지" class="bannerImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/banner/10.jpg" alt="배너이미지" class="bannerImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/banner/11.jpg" alt="배너이미지" class="bannerImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/banner/12.jpg" alt="배너이미지" class="bannerImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/banner/13.jpg" alt="배너이미지" class="bannerImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/banner/14.jpg" alt="배너이미지" class="bannerImg"></li>
                                                        <li><img src="/jogong/resources/giftimage/banner/15.jpg" alt="배너이미지" class="bannerImg"></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    <!-- 배너 선택 종료--> 

                                    <!-- 카드 선택-->
                                        <div class="card_choice">
                                            <h4>카드</h4>
                                            <div class="scrollBox">
                                                <div class="deco-list">
                                                    <ul class="card-div" id="msg_card">
                                                        <li><img src="/jogong/resources/giftimage/card/a1.jpg" alt="카드 이미지" class="cardImg" value="1"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a2.jpg" alt="카드 이미지" class="cardImg" value="2"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a3.jpg" alt="카드 이미지" class="cardImg" value="3"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a4.jpg" alt="카드 이미지" class="cardImg" value="4"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a5.jpg" alt="카드 이미지" class="cardImg" value="5"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a6.jpg" alt="카드 이미지" class="cardImg" value="6"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a7.jpg" alt="카드 이미지" class="cardImg" value="7"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a8.jpg" alt="카드 이미지" class="cardImg" value="8"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a9.jpg" alt="카드 이미지" class="cardImg" value="9"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a10.jpg" alt="카드 이미지" class="cardImg" value="10"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a11.jpg" alt="카드 이미지" class="cardImg" value="11"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a12.jpg" alt="카드 이미지" class="cardImg" value="12"></li>
                                                        <li><img src="/jogong/resources/giftimage/card/a13.jpg" alt="카드 이미지" class="cardImg" value="13"></li>
                                                      
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    <!-- 카드 선택 종료 -->

                                </div>
                                </div>

                                <!-- 배너영역 id t1~ 끝-->
                            </div>
                            <!--배너-->
                            
                        </div>

                        <!-- 메세지 영역-->
                        <div class="head-tab">
                        <h3>메세지</h3>
                        <ul class="tab-tabtype01 _tab02" id="msg_cate">
                            <li>
                                <a href="#none" id="m-18" class="message" value="선물이 도착했어요~">기본</a>
                            </li>
                            <li>
                                <a href="#none" id="m-19" class="message" value="결혼 축하해~ 이제 지옥길만 남았구나">결혼</a>
                            </li>
                            <li>
                                <a href="#none" id="m-20" class="message" value="생일축하드립니다! 행복하세요">생일</a>
                            </li>
                            <li>
                                <a href="#none" id="m-21" class="message" value="명국짱에게 무한한 감사를!!">감사</a>
                            </li>
                            <li>
                                <a href="#none" id="m-22" class="message"value="찾아와주셔서 감사합니다 좋은 하루 되세요">조문</a>
                            </li>
                            <li>
                                <a href="#none" id="m-23" class="message" value="무야호~ 당첨되었구먼~~">당첨</a>
                            </li>
                        </ul>
                        </div>
                        <div class="msg-area">
                            <input type="text" id="mms_send_msg">
                        </div> 
                        <!-- 메세지 영역 끝--> 
                        
                    </div>
                    <!-- 테마와 배너 선택 끝 -->

                    <!-- 샘플이미지-->
                    <div class="sample">
                        <div class="inner">
                            <div class="imgBox">
                                <span class="topImg">
                                    <img id="previewBanner" src="/jogong/resources/giftimage/banner/1.jpg" alt="꾸미기배너">
                                </span>
                                <div class="pin">
                                    <div class="col-half">
                                        <div class="giftImg">
                                            <img src="image/21.jpeg" alt="카드 이미지">
                                        </div>
                                        <div class="cardImg">
                                            <img id="previewTemplate" src="/jogong/resources/giftimage/card/a1.jpg" alt="꾸미기 템플릿">
                                        </div>
                                    </div>
                                    <div class="bacord">
                                        <img src="/jogong/resources/image/decobanner04.gif" alt="바코드">
                                    </div>
                                </div>
                            </div>

                            <!--텍스트 박스-->
                            <p id="msg_sample"></p>

                        </div>
                    </div>
                    <!-- 샘플이미지 끝-->
                </div>
            </div>
        </div>
    </div>
<div class="outer">
        <div id="inner1">
            <h3>선물 상품 정보</h3>
            <div class="gift-info row-type03">
                <div>
                    <img src="image/cake.jpg" alt="스트로베리 초콜릿 생크림" width="100px" ; height="100px">
                </div>
                <div class="gift-info-desc">
                    <span>투썸플레이스</span>
                    <p><strong id="sangpum">${sangpum}</strong></p>
                    <p class="count" id="count">총 선물 수 <strong><span class="phoneCnt">${count}</span> 개</strong></p>
                </div>
                <div class="tag">

                </div>
            </div>
            <div class="row-type03">
                <div class="row-type04" id="point_box">
                    <h4>보유 포인트</h4>
                    <p class="form-type01 btn-area" id="point_box_area">
                        <span><em class="fc-01" id="gs_point">0</em> 원</span>
                        <a href="javascript:giftishowPointUse()" id="giftishowPointChk" class="btn-type-c">전액사용</a>
                        <input type="text" id="giftishowUsePoint" value="0">
                    </p>
                </div>

                <div class="row-type04" id="asiana_exist" style="display: none;">
                    <h4>아시아나클럽</h4>
                    <p class="form-type01 btn-area justify-cont align-c">
                        <em><span>회원번호 :</span><span id="asiana_user_no_text"></span></em>
                        <em>
                            <a href="javascript:openAsianaPop();" class="btn-type-c">변경</a>
                            <a href="javascript:deleteAsianaNo();" class="btn-type-c">삭제</a>
                        </em>
                    </p>
                </div>
                <div class="row-type04" id="asiana_not_exist" style="display: none;">
                    <h4>아시아나클럽</h4>
                    <p class="form-type01 btn-area justify-cont align-c">
                        <em><span>회원번호 :</span><span>아시아나클럽 회원번호를 등록해 주세요.</span></em>
                        <a href="javascript:openAsianaPop();" class="btn-type-c">등록</a>
                    </p>
                </div>
            </div>

            <div class="row-type03 ">
                <div data-v-8215c5a4="" class="section_title">
                    <h3 data-v-8215c5a4="" class="title_txt">결제 방법</h3>
                </div>
                <div data-v-8215c5a4="" class="section_content">
                    <div data-v-8215c5a4="" class="simple_payment">
                        <h4 data-v-8215c5a4="" class="method_title">
                            <div data-v-8215c5a4="" class="main_title">간편 결제 <span data-v-8215c5a4=""
                                    class="sub_title">일시불</span></div>
                        </h4>
                        <div data-v-29138675="" data-v-8215c5a4="" class="card_list">
                            <div data-v-29138675="" class="main_card disabled"><a data-v-29138675="" href="#"
                                    class="regist_link">
                                    <p>카드를 등록해주세요</p>
                                </a></div>
                            <div data-v-29138675="" class="other_card" style="display: none;">
                                <ul data-v-29138675="" class="other_card_list"></ul>
                            </div>
                        </div>
                    </div>
                    <div data-v-8215c5a4="" class="general_payment">
                        <h4 data-v-8215c5a4="" class="method_title">
                            <div data-v-8215c5a4="" class="main_title"><strong data-v-8215c5a4="">일반 결제</strong> <span
                                    data-v-8215c5a4="" class="sub_title">일시불・할부</span></div>
                        </h4>
                        <div data-v-35b707e2="" data-v-8215c5a4="" class="pay_method" id="card">
                            <div data-v-35b707e2="" class="pay_item" id="normalpay" value="html5_inicis">
                                <div data-v-35b707e2="" class="pay_box">
                                    <div data-v-35b707e2="" class="pay_title">
                                        <p data-v-35b707e2="" class="main_title">신용/체크카드</p>
                                    </div>
                                </div>
                            </div>
                            <div data-v-35b707e2="" class="pay_item" id="quickpay" value="danal">
                                <div data-v-35b707e2="" class="pay_box">
                                    <div data-v-35b707e2="" class="pay_title">
                                        <p data-v-35b707e2="" class="main_title">핸드폰결제</p>
                                    </div>
                                </div>
                            </div>
                            <div data-v-35b707e2="" class="pay_item" id="kakaopay" value="kakaopay">
                                <div data-v-35b707e2="" class="pay_box">
                                    <div data-v-35b707e2="" class="pay_title">
                                        <p data-v-35b707e2="" class="main_title">카카오페이</p>
                                    </div><img data-v-35b707e2="" src="image/kakaopay.jpg" alt="카카오페이" class="pay_img">
                                </div>
                            </div>
                            <div data-v-35b707e2="" class="pay_item" id="tosspay" value="tosspay" >
                                <div data-v-35b707e2="" class="pay_box">
                                    <div data-v-35b707e2="" class="pay_title">
                                        <p data-v-35b707e2="" class="main_title">토스</p>
                                    </div><img data-v-35b707e2="" src="image/tosspay.jpg" alt="토스" class="pay_img">
                                </div>
                            </div>
                        </div>
                        <div data-v-2e66a968="" data-v-8215c5a4="" class="pay_benefit">
                            <h5 data-v-2e66a968="" class="benefit_title">결제 혜택</h5>
                            <ul data-v-2e66a968="" class="benefit_list">
                                <li data-v-2e66a968="" class="benefit_item"><img data-v-2e66a968=""
                                        src="image/계좌이체.png"
                                        alt="계좌 이체" class="benefit_img">
                                    <p data-v-2e66a968="" class="benefit_desc"><span data-v-2e66a968="" class="blind">계좌
                                            이체</span>결제 시 최대 5만 포인트 적립 </p><a data-v-2e66a968="" href="" target="_blank"
                                        class="btn_more">더보기</a>
                                </li>
                                <li data-v-2e66a968="" class="benefit_item"><img data-v-2e66a968=""
                                        src="image/tosspay.jpg"
                                        alt="토스" class="benefit_img" >
                                    <p data-v-2e66a968="" class="benefit_desc"><span data-v-2e66a968=""
                                            class="blind">토스</span>첫 결제시 3천원 캐시백 </p><a data-v-2e66a968=""
                                        href="tosspay.jpg" target="_blank" class="btn_more">더보기</a>
                                </li>
                                <li data-v-2e66a968="" class="benefit_item"><img data-v-2e66a968=""
                                        src="image/paycopay.jpg"
                                        alt="페이코" class="benefit_img">
                                    <p data-v-2e66a968="" class="benefit_desc"><span data-v-2e66a968=""
                                            class="blind">페이코</span>페이코 포인트로 결제 시 5% 적립 </p><a data-v-2e66a968=""
                                        href="paycopay.jpg" target="_blank" class="btn_more">더보기</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row-type03 ">
                <div class="acco-single _acco">
                    <div class="acco-tt">
                        <div class="cbWrap">
                            <input type="checkbox" id="buy_agree">
                            <label for="buy_agree"><i></i> <strong><span class="fc-01">[필수]</span> 구매확인 및
                                    동의</strong></label>
                        </div>
                        <a href="#" class="trigger"><i class="btn-acco closed"></i></a>
                    </div>
                    <div class="acco-cont">
                        <div>
                            구매하시는 상품의 정보 및 가격, 배송정보를 확인하였으며, 구매에 동의하십니까?<br>
                            [전자상거래법 제8조 제2항]
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="inner2">
            <div class="box-type01">
                <h3>최종 결제 금액</h3>
                <table class="t-head">
                    <tbody>
                        <tr>
                            <th>상품 금액</th>
                            <td><strong id="total_sale_price">${price}</strong> 원</td>
                        </tr>
                        <tr>
                            <th>할인 금액</th>
                            <td><span id="payDetail_discount">-0</span> 원</td>
                        </tr>
                        <tr>
                            <th>포인트</th>
                            <td><span id="payDetail_gspoint">-0</span> 원</td>
                        </tr>
                    </tbody>
                </table>
                <table class="t-foot">
                    <tbody id="pay_method_name">
                        <tr>
                            <th>결제 수단</th>
                            <td id="pg_name">신용카드</td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>결제 금액</th>
                            <td><strong id="final_price">
                          <%--   <%
                            	int price = Integer.parseInt(request.getParameter("price"));
                            	int count = Integer.parseInt(request.getParameter("count"));
                            	
                            	int totalcount = price * count;
                            %> --%>
                            </strong>${totalprice} 원</td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="btn-type02" id="paying">결제</div>
        </div>
    </div>
<hr>
	
<script type="text/javascript">
/*$(document).ready(function(){ 
 	 $("").click(function(){ 
    	payment(); //버튼 클릭하면 호출 
    }); 
 	 
=======
	</div>

	<script type="text/javascript">
$(document).ready(function(){ 
 	 $("#iamportPayment").click(function(){ 
    	payment(); //버튼 클릭하면 호출 
    }); 
>>>>>>> 0ec93a028332c017ace3eb56df7c4f9cf45ed7d6
	$("#iamportPayment2").click(function(){ 
		danal();
    }); 
 	 
	$("").click(function(){ 
		kg();
<<<<<<< HEAD
    }); 
	$("").click(function(){ 
=======
    });
	$("#iamportPayment4").click(function(){ 
>>>>>>> 0ec93a028332c017ace3eb56df7c4f9cf45ed7d6
		toss();
    }); 
})*/

var customdata = JSON.parse('{"member_id":"${to_member_id}","count":"${count}"}');
const rand = Math.random();
//버튼 클릭하면 실행
function payment(data) {
    IMP.init('imp20164668');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
    IMP.request_pay({// param
        pg: "kakaopay.TC0ONETIME", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
        pay_method: "card", //지불 방법
        merchant_uid: rand, //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
        name : '${sangpum}', //결제창에 노출될 상품명
        amount: ${totalprice},
        buyer_name : "김민성",
        custom_data : customdata,
    }, function (rsp) { // callback
        if (rsp.success) {
        	   alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid+ "결제완료"+"count:"+rsp.custom_data.count+"받는사람:"+rsp.custom_data.member_id);
               
               jQuery.ajax({
                   url: "test.action",
                   method: "POST",
     			dataType:"json",
                   data: {
                       "imp_uid": rsp.imp_uid,
                       "merchant_uid": rsp.merchant_uid,
                       "name" : rsp.name,
                       "amount" : rsp.paid_amount,
                       "buyer_name" : rsp.buyer_name,
                       "pg" : rsp.pg_provider,
                       "pay_method" : rsp.pay_method,
                       "custom_data" : rsp.custom_data,
/*             		   "banner" : rsp.banner, 
            		   "message" : rsp.message*/                   	}
                   });
         } else {
             alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
             var msg = "결제에 실패했습니다"
             msg = "에러내용:" + rsp.error_msg;
             
             alert(msg);
         }
     });
}

function danal(data) {
	IMP.init('imp20164668');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
	IMP.request_pay({
		pg : 'nice',
	    pay_method : 'phone',
	    merchant_uid: "0099", //상점에서 생성한 고유 주문번호
	    name : '주문명:결제테스트',
	    amount : 1000,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	}, function (rsp) { // callback
        if (rsp.success) {
        	 alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid+ "결제완료");
               
               jQuery.ajax({
                   url: "test.action",
                   method: "POST",
     			dataType:"json",
                   data: {
                       "imp_uid": rsp.imp_uid,
                       "merchant_uid": rsp.merchant_uid,
                       "name" : rsp.name,
                       "amount" : rsp.paid_amount,
                       "buyer_name" : rsp.buyer_name,
                       "pg" : rsp.pg_provider,
                       "pay_method" : rsp.pay_method
                   	}
                   });
         } else {
             alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
             var msg = "결제에 실패했습니다"
             msg = "에러내용:" + rsp.error_msg;
             
             alert(msg);
         }
     });
}


function kg(data) {
	IMP.init('imp20164668');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
	IMP.request_pay({
		pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid: "0099", //상점에서 생성한 고유 주문번호
	    name : '주문명:결제테스트',
	    amount : 100,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	}, function (rsp) { // callback
        if (rsp.success) {
        	 alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid+ "결제완료");
               
               jQuery.ajax({
                   url: "test.action",
                   method: "POST",
     			dataType:"json",
                   data: {
                       "imp_uid": rsp.imp_uid,
                       "merchant_uid": rsp.merchant_uid,
                       "name" : rsp.name,
                       "amount" : rsp.paid_amount,
                       "buyer_name" : rsp.buyer_name,
                       "pg" : rsp.pg_provider,
                       "pay_method" : rsp.pay_method
                   	}
                   });
         } else {
             alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
             var msg = "결제에 실패했습니다"
             msg = "에러내용:" + rsp.error_msg;
             
             alert(msg);
         }
     });
}
 
function toss(data) {
	IMP.init('imp20164668');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
	IMP.request_pay({
		pg : 'tosspay',
	    pay_method : 'card',
	    merchant_uid: "0099", //상점에서 생성한 고유 주문번호
	    name : '주문명:결제테스트',
	    amount : 100,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
}, function (rsp) { // callback
      if (rsp.success) {
    	  
    	  alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid+ "결제완료");
          
          jQuery.ajax({
              url: "test.action",
              method: "POST",
			dataType:"json",
              data: {
                  "imp_uid": rsp.imp_uid,
                  "merchant_uid": rsp.merchant_uid,
                  "name" : rsp.name,
                  "amount" : rsp.paid_amount,
                  "buyer_name" : rsp.buyer_name,
                  "pg" : rsp.pg_provider,
                  "pay_method" : rsp.pay_method
              	}
              });
       } else {
    	   alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
           var msg = "결제에 실패했습니다"
           msg = "에러내용:" + rsp.error_msg;
           
           alert(msg);
       }
   });
}


var div2 = document.getElementsByClassName("pay_box");

function handleClick(event) {
    console.log(event.target);
    // console.log(this);
    // 콘솔창을 보면 둘다 동일한 값이 나온다

    console.log(event.target.classList);

    if (event.target.classList[1] === "clicked") {
        event.target.classList.remove("clicked");
    } else {
        for (var i = 0; i < div2.length; i++) {
            div2[i].classList.remove("clicked");
        }

        event.target.classList.add("clicked");
    }
}

function init() {
    for (var i = 0; i < div2.length; i++) {
        div2[i].addEventListener("click", handleClick);
        console.log(this)
    }
}

init();

 var payed = document.getElementById("paying");
payed.onclick = function () {
    const selected = document.querySelector('.pay_box.clicked').parentNode;
    const val = selected.getAttribute('value');
    
    if(val=='kakaopay'){
    	payment();
    }else if(val=='tosspay'){
    	toss();            	
    }else if(val=='html5_inicis'){
    	kg();
    }else if(val=='danal'){
   		danal(); 	
    }
} 
/* var payed = document.getElementById("paying");
payed.onclick = function () {
    const selected = document.querySelector('.pay_box.clicked').parentNode;
    console.log(selected);
    const val = selected.getAttribute('value');
    console.log(val);
}
*/
</script>
</body>
</html>