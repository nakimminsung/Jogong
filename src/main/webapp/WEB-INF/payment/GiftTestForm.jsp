<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<div style="margin: 30px 30px;">
		<form action="payview" method="post">
			<table class="table table-bordered" style="width: 300px;">
				<tr>
					<th width="120" style="background-color: orange;">상품명</th>
					<td>
						<input type="text" name="sangpum" class="form-control" required="required" style="width: 150px;">
					</td>
				</tr>
				<tr>
					<th width="120" style="background-color: lightgray;">상품 가격</th>
					<td>
						<input type="number" name="price" class="form-control" required="required" style="width: 150px;">
					</td>
				</tr>
				
				<tr>
					<th width="120" style="background-color: lightgray;">상품 개수</th>
					<td>
						<input type="number" name="count" class="form-control" required="required" style="width: 150px;">
					</td>
				</tr>
				
				<tr>
					<th width="120" style="background-color: lightgray;">받는사람</th>
					<td>
						<input type="text" name="to_member_id" class="form-control" required="required" style="width: 150px;">
					</td>
				</tr>
				
				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-outline-danger">서버저장</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>