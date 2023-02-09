<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/insertForm.jsp</title>
</head>
<body>
<h1>jsp2/insertForm.jsp</h1>
<form action="insertPro.jsp" method="get">
<!--name 태그의 이름은 테이블의 컬럼명과 동일하게 만들기-->
학생번호 : <input type="text" name="num"> <br>
학생이름 : <input type="text" name="name"> <br>
<input type="submit" value="학생등록">

</form>
</body>
</html>