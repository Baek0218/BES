<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/session.jsp</title>
</head>
<body>
<%
//p195
// 내장객체 자바 HttpSession -> 서버 session 객체생성  집에가고싶다
// => 기억장소 할당() => 서버와 클라이언트 연결정보 저장
// -> 서버와 클라이언트 연결되면 -> 자동으로 객체생성
// session.getID() session.setAttribute() session.getAttribute()
// session.invalidate()

// 서버 세션 기억공간 전체삭제 1. 브라우저 모두 닫기
// 						 2. 30분 동안 작업 하지 않으면 삭제 
//						 3. session.invalidate() 로그아웃
%>
<!-- 첫접속시 세션ID:536F019AD46F1AE0552F3E10CDEF003E 이거 조회되고,
다른페이지 갔다와도 세션값은 계속 유지되는걸 확인할 수 있다.  -->
<!-- 브라우저 닫고 다시 들어가면 세션ID가 변경됨.
 EE81E6FE75ABE97BEA167812005EEAEA -->
세션ID : <%=session.getId() %><br>
<!-- 세션 만들어진 시간 : 1672284954860. -->
세션생성 시간 : <%=session.getCreationTime() %><br>
<!--세션에 접속된 시간 1672285147408 새로고침하면 계속변경됨 -->
세션접근 시간 : <%=session.getLastAccessedTime() %><br>
세션유지 시간 : <%=session.getMaxInactiveInterval() %> 초(30분)<br>
세션유지 시간 2초 변경(2초가 지나면 서버 session기억장소 사라짐)
<%
//session.setMaxInactiveInterval(2);
%><br>
세션유지 시간 : <%=session.getMaxInactiveInterval() %>초(2초)
서버 세션 기억공간 전체삭제 : 
<%
session.invalidate();
%>
</body>
</html>