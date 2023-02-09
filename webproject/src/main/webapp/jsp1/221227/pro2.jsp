<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/pro2.jsp</title>
</head>
<body>
<!-- http://localhost:8080/webProject/jsp1/pro2.jsp?id=kim&pass=1111 
서버 내장객체 request에 요청정보 저장
request 태그정보를 가져오는 메서드 getParameter("태그이름")
가져온 정보는 String 형 
-->
<%
String sid=request.getParameter("id");
String spass=request.getParameter("pass");
%>
<h1>jsp1/pro2.jsp</h1>
아이디 : <%=sid %>
비밀번호 : <%=spass %><br>

</body>
</html>





