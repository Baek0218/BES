<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/scopePro2.jsp</title>
</head>
<body>
<h1>jsp1/scopePro2.jsp</h1>
<%
//폼에서 입력한 아이디 비밀번호 => 서버에 전달 request내장객체 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
<br>
pageContext 값 : <%=pageContext.getAttribute("page") %><br>
request 값 : <%=request.getAttribute("req") %><br>
session 값 : <%=session.getAttribute("ses") %><br>
application 값 : <%=application.getAttribute("app") %><br>
</body>
</html>