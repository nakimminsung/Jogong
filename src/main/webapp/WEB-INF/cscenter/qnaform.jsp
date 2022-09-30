<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

</head>

<style>
   body * {
      
   }
   
   .htitle{
	  background-color: #ffd700;
  	  height: 200px;
  	  padding-left: 25%;
  	  padding-top: 80px;
  	  font-family: Jua;
   }
   
   div.ibox {
      margin-top: 1%;
      margin-left: 25%;
	  background-color: white;
      width: 1000px;
      /* font-family: Jua; */
   }
   
   table.form tr {
      height: 80px;
      vertical-align: middle;
   }
   
   button.sub {
      width: 200px;
      height: 50px;
      background-color: #ffd700;
      font-size: 20px;
   }
   
   i.star {
      color: orange;
      font-size: 10px;
   }
   
</style>

<script type="text/javascript">
   $(function () {
      

      //파일첨부 버튼 클릭 trigger
      $(".btnupload").click(function () {
         
         $("#upload").trigger("click");
      });

      //파일을 첨부했을때
      $("#upload").change(function () {
         
         //정규표현식
         var reg = /(.*?)\/(jpg|jpeg|png|bmp|gif)$/;   //확장자 지정하기
         var f=$(this)[0].files[0];   //현재 선택한 파일
         var fn=$(this)[0].files[0].name; //현재 선택한 파일명
         
         
         if(!f.type.match(reg)){
            
              alert("확장자가 이미지파일이 아닙니다");
              return;
            }
         
         $(".filename").text(fn);
   
      }); // change 이벤트 종료      
      
      

      
   }); // function 종료
</script>
<body>
<div style="background-color: white;">

<h2 class="htitle">1:1 문의하기</h2>

   <div class="ibox">
   
      <!-- form action -->
      <form action="qnainsert" method="post" enctype="multipart/form-data">
      
      <!-- 보이진않지만 폼 전송할때 같이 보내야하는 데이터 -->
      <%-- <input type="hidden" name="userNum" value="${sessionScope.loginid}"> --%>
      <input type="hidden" name="userNum" value="1">
      
         <table class="table form" style="border-top: 1px solid gray;" >
            <tr>
               <th style="width: 150px;">문의유형 <i class='fas fa-star-of-life star'></i></th>
               <td>
                  <!-- selQnaCategory -->
                  <select class="form-control" style="width: 300px;" required name="qnaCategoryNum">
                     <option value="" disabled selected style="display: none;">선택해주세요</option>
                     <c:forEach var="dto" items="${list}">
                        <option value="${dto.num}">${dto.name}</option>
                     </c:forEach>
                  </select>
               </td>
            </tr>
            
            <tr>
               <th>주문번호</th>
               <td>   
                  <input type="text" class="form-control ordern" style="width: 100%;"
                   placeholder="주문내역에서 주문번호를 확인 후 입력해주세요" value="" name="orderNum">
               </td>
   
            </tr>
            
            <tr>
               <th>문의 제목 <i class='fas fa-star-of-life star'></i></th>
               <td align="center">
                  <input type="text" class="form-control" style="width: 100%;" name="title" required
                   placeholder="제목을 입력해주세요">
               </td>   
            </tr>
            
            <tr>
               <th>문의 내용 <i class='fas fa-star-of-life star'></i></th>
               <td align="center">
                  <textarea class="form-control" style="width: 100%; height: 300px;" required name="content"
                  placeholder="문의유형을 선택 후 문의내용을 자세하게 작성해주세요."></textarea>
               </td>   
            </tr>
            <tr>
               <td colspan="2" style="text-align: center;">
                  <button type="button" class="btn btn-secondary btnupload">+ 파일 첨부</button>
                  <input type="file" id="upload" name="upload" style="display: none;"><br>
                  <b class="filename"></b>

               </td>
            </tr>
                  
            <tr>
               <th>이메일 주소 <i class='fas fa-star-of-life star'></i></th>
               <td>
                  <input type="email" class="form-control" style="width: 100%" placeholder="예) example@kakao.com"
                   required name="email">
               </td>
            </tr>

            <tr>
               <th colspan="2" style="text-align: center;">
                  <button type="submit" class="btn btn-warning sub">문의 접수</button>
               </th>
            </tr>
            
         </table>
      </form>
      
   </div>
</div>
</body>
<script type="text/javascript">


// 문의 접수 버튼 클릭 이벤트
$(".sub").click(function () {
   
   alert("문의를 등록하시겠습니까?");
   
});


</script>

</html>