<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/insertForm.jsp</title>
</head>
<body>
<h1>jsp3/deleteForm.jsp</h1>
<%
// db접속하지 않고 id가져오기.
String id = (String)session.getAttribute("id");
// → 자동으로 object로 업캐스팅 되기때문에 원래 기본 String값으로 다운캐스팅 해주면서 불러오기.
%>
	<form action="deletePro.jsp" method = "post">
		아이디 :  <input type ="text" name ="id" value="<%=id %>" readonly><br>
		비밀번호 : <input type ="password" name ="pass"><br>
			     <input type = "submit" value="회원정보삭제">
			    
	</form>
</body>
</html>