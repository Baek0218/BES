<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/insertForm.jsp</title>
</head>
<body>
<h1>member/insertForm.jsp</h1>
<!-- http://localhost:8080/Model2/InserForm.me -->
<!-- http://localhost:8080/Model2/InsertPro.me -->
	<form action="MemberInsertPro.me" method = "post">

		아이디 :  <input type ="text" name ="id"><br>
		비밀번호 : <input type ="password" name ="pass"><br>
		이름 :    <input type ="text" name ="name"><br>
			     <input type = "submit" value="회원가입">
			    
	</form>
</body>
</html>