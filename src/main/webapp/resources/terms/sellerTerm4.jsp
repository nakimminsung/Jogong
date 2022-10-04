<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet"><!-- font -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"><!-- bootstrap 5 -->
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script><!-- bootstrap 5 icon -->
<script src="https://code.jquery.com/jquery-3.5.0.js"></script><!-- jquery -->

<!-- 이용약관 css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/terms.css">

<style type="text/css">
	*{
		
	}

</style>
</head>
<body>
	<div id="agreement_table">
      <h2>조공 개인정보 수집 및 이용에 대한 안내</h2>
      <dl>
        <dt>조공는 판매자회원에게 판매활동과 관련한 서비스 제공을 위하여 아래와 같이 회원의 개인정보를 수집, 활용합니다.</dt>
        <dd>
          <ul>
            <li>
              <p>* 본 수집동의서 상의 용어의 정의는 "조공 이용약관 및 개인정보처리방침"에 준용하며 조공 서비스 제공을 위해서 필요한 최소한의
                개인정보이므로 동의를 해주셔야만 서비스를 이용 하실 수 있습니다.</p>
            </li>
            <li>
              <h3>개인판매자</h3>
              <table class="gray_table">
                <colgroup>
                  <col>
                  <col>
                  <col>
                  <col>
                </colgroup>
                <tbody>
                  <tr>
                    <th>구분</th>
                    <th>목적</th>
                    <th>항목</th>
                    <th>보유기간</th>
                  </tr>
                  <tr>
                    <td rowspan="5">필수정보</td>
                    <td>서비스이용을 위한 이용자식별, 중복가입방지</td>
                    <td>성명, 휴대전화번호, 스토어명, CI(연계정보), DI(중복정보), IP</td>
                    <td rowspan="8">판매자 개인정보는 서비스 제공 기간동안 보유 및 이용하며, 개인정보의 수집 및 이용목적의 달성 시 파기됩니다.
                      단, 내부 지침에 의해 부정거래 방지 및 대응 목적으로 60일간 보관됩니다. 또한, 관계법령에 의해 보존할 경우 그 의무기간 동안
                      보관됩니다.</td>
                  </tr>
                  <tr>
                    <td>계약이행을 위한 연락, 서비스 이용에 따른 정보제공(고지사항 전달, 본인의사 확인, 서비스 관련 상담, 민원사항 처리, 유의사항 등),
                      서비스이용 만족도 조사</td>
                    <td>성명, 이동전화번호, 이메일, 전화번호</td>
                  </tr>
                  <tr>
                    <td>부정이용방지, 비인가 사용 방지, 분쟁조정 해결을 위한 기록보존</td>
                    <td>이름, 이메일, 주소, 이동전화번호, 서비스이용기록, 아이피주소(IP address), 접속로그</td>
                  </tr>
                  <tr>
                    <td>대금결제서비스의 제공, 전자금융기록 보관</td>
                    <td>은행계좌정보(예금주, 계좌번호)</td>
                  </tr>
                  <tr>
                    <td>고객센터 운영 관리</td>
                    <td>고객센터 연락처</td>
                  </tr>
                </tbody>
              </table>
            </li>
            <li>
              <h3>사업자판매자</h3>
              <table class="gray_table">
                <colgroup>
                  <col>
                  <col>
                  <col>
                  <col>
                </colgroup>
                <tbody>
                  <tr>
                    <th>목적</th>
                    <th>항목</th>
                    <th>보유기간</th>
                    <th>보유기간</th>
                  </tr>
                  <tr>
                    <td rowspan="7">필수정보</td>
                    <td>서비스이용을 위한 이용자식별, 사업자 확인, 중복가입방지</td>
                    <td>상호명, 사업자 등록번호, 대표자명, 법인 등록번호, 담당자명, 담당자 휴대전화번호, 스토어명, CI(연계정보),
                      DI(중복정보), IP</td>
                    <td rowspan="8">판매자 개인정보는 서비스 제공 기간동안 보유 및 이용하며, 개인정보의 수집 및 이용목적의 달성 시 파기됩니다.
                      단, 내부 지침에 의해 부정거래 방지 및 대응 목적으로 60일간 보관됩니다. 또한, 관계법령에 의해 보존할 경우 그 의무기간 동안
                      보관됩니다.</td>
                  </tr>
                  <tr>
                    <td>계약이행을 위한 연락, 서비스 이용에 따른 정보제공(고지사항 전달, 본인의사 확인, 서비스 관련 상담, 민원사항 처리, 유의사항 등)</td>
                    <td>대표자명, 담당자명, 사업자등록번호, 사업자 및 담당자 연락처, 이메일주소, 본사소재지</td>
                  </tr>
                  <tr>
                    <td>부정이용방지, 비인가 사용 방지, 분쟁조정 해결을 위한 기록보존</td>
                    <td>대표자명, 담당자명, 관리자 아이디(ID), 사업자 이메일, 주소, 담당자 이메일 주소, 이동전화번호, 서비스이용기록,아이피주소(IP
                      address), 접속로그</td>
                  </tr>
                  <tr>
                    <td>부가가치세법에 따른 세금계산서발행</td>
                    <td>상호, 대표자명, 사업자등록번호, 본사소재지, 업태, 종목</td>
                  </tr>
                  <tr>
                    <td>전자상거래법에 따른 통신판매업 신고</td>
                    <td>통신판매업 신고번호</td>
                  </tr>
                  <tr>
                    <td>대금결제서비스의 제공, 전자금융기록 보관</td>
                    <td>은행계좌정보(예금주, 계좌번호)</td>
                  </tr>
                  <tr>
                    <td>고객센터 운영 관리</td>
                    <td>고객센터 연락처</td>
                  </tr>
                </tbody>
              </table>
            </li>
          </ul>
        </dd>
      </dl>
    </div>
</body>
</html>