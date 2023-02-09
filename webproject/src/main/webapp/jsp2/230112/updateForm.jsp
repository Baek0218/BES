<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/updateForm.jsp</title>
</head>
<body>
	<h1>jsp2/updateForm.jsp</h1>

	<form action="updatePro.jsp" method="get">
	
		<!--name 태그의 이름은 테이블의 컬럼명과 동일하게 만들기-->
	
		학생번호 : <input type="text" name="num"> <br> 
	
		수정할 학생이름 : <input type="text" name="name"> <br>		 
					  <input type="submit" value="학생정보수정">
	
	</form>
	
</body>
</html>