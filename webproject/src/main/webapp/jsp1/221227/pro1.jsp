<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/pro1.jsp</title>
</head>
<body>
<!-- http://localhost:8080/webProject/jsp1/pro1.jsp?id=kim 
사용자가 입력한 요청정보를 서버에 전달하면 request객체생성 기억장소 할당
jsp 내장객체 request 요청정보 저장
request.멤버변수   request.메서드() 
//  태그 name이름 = 태그 value값    id=kim 
request.getParameter("태그이름") 
:request 저장 공간에서 태그이름 id 를 찾아서 value 값을 가져오는 메서드
--> 
<h1>jsp1/pro1.jsp</h1>
아이디 : <%=request.getParameter("id") %>
</body>
</html>



