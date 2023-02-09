<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/loginMain.jsp</title>
</head>
<body>
<h1>jsp1/loginMain.jsp</h1>
<%=session.getAttribute("id") %>님 로그인 하셨습니다.
<a href="logout.jsp">로그아웃</a>

</body>
</html>

