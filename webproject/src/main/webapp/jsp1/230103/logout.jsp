<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/logout.jsp</title>
</head>
<body>
<h1>jsp1/logout.jsp</h1>
<%
//연결정보를 저장하는 내장객체 session 삭제
session.invalidate();

// 순서1 이동
// response.sendRedirect("login.jsp");
%>
<!-- // 순서2 이동 -->
<script type="text/javascript">
alert("로그아웃");
location.href="login.jsp";
</script>
</body>
</html>


