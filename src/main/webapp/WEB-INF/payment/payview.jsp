<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    
    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<style type="text/css">
</style>
</head>
<body>
	<div>
		<h2>IAMPORT 결제</h2>
<!-- 		<li>
			<button id="iamportPayment" type="button">카카오페이 결제</button>
		</li>
		<li>
			<button id="iamportPayment2" type="button">휴대폰 결제</button>
		</li> 
		<li>
			<button id="iamportPayment3" type="button">KG이니시스</button>
		</li> -->
		<li>
			<button id="iamportPayment4" type="button">토스</button>
		</li>
	</div>
	
<script type="text/javascript">
$(document).ready(function(){ 
/* 	 $("#iamportPayment").click(function(){ 
    	payment(); //버튼 클릭하면 호출 
    }); 
	$("#iamportPayment2").click(function(){ 
		danal();
    }); 
	$("#iamportPayment3").click(function(){ 
		kg();
    }); */
	$("#iamportPayment4").click(function(){ 
		toss();
    }); 
})
/* //버튼 클릭하면 실행
function payment(data) {
    IMP.init('imp20164668');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
    IMP.request_pay({// param
        pg: "kakaopay.TC0ONETIME", //pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
        pay_method: "card", //지불 방법
        merchant_uid: "0003", //가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
        name: "음식", //결제창에 노출될 상품명
        amount: 100, //금액
        buyer_email : "testiamport@naver.com", 
        buyer_name : "홍길동",
        buyer_tel : "01012341234"
    }, function (rsp) { // callback
        if (rsp.success) {
            alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid);
            jQuery.ajax({
                url: "test.action",
                method: "POST",
  			dataType:"json",
                data: {
                    "imp_uid": rsp.imp_uid,
                    "merchant_uid": rsp.merchant_uid,
                    "name" : rsp.name,
                    "amount" : rsp.amount,
                    "buyer_name" : rsp.buyer_name,
                    "pg" : rsp.pg,
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

function danal(data) {
	IMP.init('imp20164668');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
	IMP.request_pay({
		pg : 'nice',
	    pay_method : 'phone',
	    merchant_uid: "0003", //상점에서 생성한 고유 주문번호
	    name : '주문명:결제테스트',
	    amount : 1000,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	}, function (rsp) { // callback
        if (rsp.success) {
            alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid);
            jQuery.ajax({
                url: "test.action",
                method: "POST",
  			dataType:"json",
                data: {
                    "imp_uid": rsp.imp_uid,
                    "merchant_uid": rsp.merchant_uid,
                    "name" : rsp.name,
                    "amount" : rsp.amount,
                    "buyer_name" : rsp.buyer_name,
                    "pg" : rsp.pg,
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
	    merchant_uid: "0003", //상점에서 생성한 고유 주문번호
	    name : '주문명:결제테스트',
	    amount : 100,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
	}, function (rsp) { // callback
        if (rsp.success) {
            alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid+ "/ name : "+rsp.name);
            
            jQuery.ajax({
                url: "test.action",
                method: "POST",
  			dataType:"json",
                data: {
                    "imp_uid": rsp.imp_uid,
                    "merchant_uid": rsp.merchant_uid,
                    "name" : rsp.name,
                    "amount" : rsp.amount,
                    "buyer_name" : rsp.buyer_name,
                    "pg" : rsp.pg,
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
 */
function toss(data) {
	IMP.init('imp20164668');//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
	IMP.request_pay({
		pg : 'tosspay',
	    pay_method : 'card',
	    merchant_uid: "0012", //상점에서 생성한 고유 주문번호
	    name : '주문명:결제테스트',
	    amount : 100,
	    buyer_email : 'iamport@siot.do',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456'
}, function (rsp) { // callback
      if (rsp.success) {
    	  
          alert("완료 -> imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : " +rsp.merchant_uid+ "/ amount : "+rsp.amount);
          
          jQuery.ajax({
              url: "test.action",
              method: "POST",
			dataType:"json",
              data: {
                  "imp_uid": rsp.imp_uid,
                  "merchant_uid": rsp.merchant_uid,
                  "name" : rsp.name,
                  "amount" : rsp.amount,
                  "buyer_name" : rsp.buyer_name,
                  "pg" : rsp.pg,
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
</script>
</body>
</html>