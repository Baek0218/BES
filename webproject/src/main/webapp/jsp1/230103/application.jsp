<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/application.jsp</title>
</head>
<body>
<h1>jsp1/application.jsp</h1>
<%
// 웹서버(웹애플리케이션서버) : 객체생성 => 기억장소 할당
// application : 서버의 정보를 저장하는 내장객체
//             : 서버 start 하면 application 기억장소 할당
//             : 서버 stop 하면 application 기억장소 삭제
//             : 서버 당 1개 application 기억장소 생성
// application.멤버변수 application.메서드()
%>
서버 정보 : <%=application.getServerInfo() %><br>
서버 물리적 경로 : <%=application.getRealPath("/") %><br>
<%
// out 내장객체 : 출력정보를 저장
out.println("웹 출력 정보 저장");
// System.out.println("콘솔 출력");
%>
출력 정보를 저장하는 기억장소 크기 : <%=out.getBufferSize() %><br>
출력 정보를 사용하고 남은 기억장소 크기 : <%=out.getRemaining() %><br>
<%
// 출력 마감
out.close();
out.println("마감하고 출력"); //에러발생
// pageContext : 현 페이지 정보를 저장하는 내장객체
//        : 페이지가 이동하면 기존 페이지 정보를 사라지고 새로운 페이지 정보 저장

// 기억장소 유지 기간 (Scope 값 유지 영역)
// pageContext      => 하나의 페이지 값만 유지
// request,response => 요청정보 값 유지
// session          => 연결만 되어있으면 페이지 상관없이 값 유지
// application      => 서버가 start되어 있는 동안 값 유지 

%>
</body>
</html>



