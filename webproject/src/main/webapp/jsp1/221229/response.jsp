<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/response.jsp</title>
</head>
<body>
<h1>jsp1/response.jsp</h1>
<%
// 자바내장객체 HttpServletReponse.
// 웹애플리케이션 서버 => response 객체생성 기억장소 할당.
// 서버에서 처리한 결과(자바파일을 html로 출력한 파일)를 저장하는 내장객체
// 메서드()종류: setHeader() addCookie() setContnetType() sendRedirect()
// 서버에서 http의 Header값을 변경
// response.setHeader("user-agent", "크롬"); 
// 서버에서 사용자 컴퓨터에 문자값을 저장
// response.addCookie("쿠키값");
// 서버에서 사용자 내용타입을 변경
// response.setContentType("Text/html; charset=UTF-8");
// response.jsp 내용을 전달하고 바로 request.jsp 페이지로 이동 (하이퍼링크)
response.sendRedirect("request.jsp");

%>
</body>
</html>