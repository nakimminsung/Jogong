<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   <!-- font -->
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    
    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
   
   <!-- bootstrap 5 icon -->
   <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>

</head>

<style>
   
   body * {
      font-family: Jua;
      font-size: 24px;
      
   }
   
   .ibox {
      margin-top: 5%;
      margin-left: 25%;
       background-color: white;
      width: 1000px;
   }
   
   tr {
      height: 80px;
      vertical-align: middle;
   }
   
   button.sub {
      width: 200px;
      height: 50px;
      font-size: 24px;
   }
   
   
   i.star {
      color: orange;
      font-size: 12px;
      
   }
   
   
</style>
<body>

   <div class="ibox">
   
      <h1>1:1 문의하기</h1><br>
      <%-- <input type="hidden" value="${dto.userNum}"> --%>
      
      <form action="">
         <table class="table" style="border-top: 1px solid black;" >
            <tr>
               <th style="width: 150px;">문의유형 <i class='fas fa-star-of-life star'></i></th>
               <td>

                  <select class="form-control-lg" style="width: 300px;">
                     <option value="" disabled selected style="display: none;">선택해주세요</option>
                     
                     <c:forEach var="name" items="${list}">
                        <option>${name}</option>
                     </c:forEach>
                     
                  </select>
               </td>
            </tr>
            
            <tr>
               <th>주문번호</th>
               <td>
                  <input type="text" class="form-control-lg" style="width: 100%;" placeholder="주문내역에서 주문번호를 확인 후 입력해주세요">
               </td>
   
            </tr>
            
            <tr>
               <th>문의내용 <i class='fas fa-star-of-life star'></i></th>
               <td align="center">
                  <textarea class="form-control-lg" style="width: 100%; height: 300px;"
                  placeholder="문의유형을 선택 후 문의내용을 자세하게 작성해주세요."></textarea>
               </td>   
            </tr>
            <tr>
               <td colspan="2" style="text-align: center;">
                  <button type="button" class="btn btn-secondary sub">+ 파일 첨부</button>
                  <input type="file" style="display: none;">
               </td>
            </tr>
                  
            <tr>
               <th>이메일 주소 <i class='fas fa-star-of-life star'></i></th>
               <td>
                  <input type="email" class="form-control-lg" style="width: 100%" placeholder="예) example@kakao.com">
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
   
</body>
</html>