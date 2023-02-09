<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js2/a.jsp</title>
</head>
<body>
<h1>js2/a.jsp</h1>
아이디 : <%=request.getParameter("id") %><br>
	      <!--  저장공간.저장공간에 있는 내용 출력하는 것. -->
비밀번호 : <%=request.getParameter("pass") %><br>
자기소개 : <%=request.getParameter("intro") %><br>
성별 : 
취미 :
학년 : 
</body>
</html>