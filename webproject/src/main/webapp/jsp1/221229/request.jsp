<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/request.jsp</title>
</head>
<body>
<h1>jsp1/request.jsp</h1>
 <!--사용자 컴퓨터에서 http가 들고간 정보(서버,사용자,연결,쿠키,태그파라미터)를
서버에 request 요청정보 저장.
서버 물리적 경로 : <%=request.getRealPath("/") %> 여기 노란줄 에러는 
잘 사용안한다는 뜻이라서 신경쓸 필요없다.
   -->
서버이름정보 : <%=request.getServerName() %><br>
서버포트정보 : <%=request.getServerPort() %> <br>
프로젝트주소 : <%=request.getContextPath() %> <br>
나머지 주소 : <%=request.getServletPath() %><br>
URI 주소 : <%=request.getRequestURL() %><br>
URI 주소 : <%=request.getRequestURI() %><br>
사용자 주소 : <%=request.getRemoteAddr() %><br>
프로토콜 : <%=request.getProtocol() %><br>
데이터 전송방식 : <%=request.getMethod() %><br>
서버 물리적 경로 : <%=request.getRealPath("/") %><br>
http헤더정보(접속한 브라우저 종류) : <%=request.getHeader("user-agent") %><br>
</body>
</html>