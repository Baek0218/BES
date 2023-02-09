<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/session.jsp</title>
</head>
<body>
<h1>jsp1/session.jsp</h1>
<%
//p195
// 내장객체 자바 HttpSession => 서버 session 객체생성
// => 기억장소 할당 => 서버와 클라이언트 연결정보 저장
// 서버와 클라이언트 연결되면 => 자동으로 객체생성

// 세션 : 연결정보저장 => 연결 만 되어있으면 페이지 상관없이 값을 계속 유지
//                 => 로그인 유지값으로 활용
//                 => 아이디 비밀번호가 일치하면 페이지 상관없이 값을 유지

// session.getId()  session.setAttribute()  session.getAttribute()
//                  session.invalidate()

//서버 세션 기억공간 전체삭제 1. 브라우저 모두 닫기
//                      2. 30분 동안 작업 하지 않으면 세션 삭제
//                      3. session.invalidate() 로그아웃
%>
<!-- 822DEAAADC7D4B17A3F010815D168F03 -->
<!-- 1B98C9589ACA6BB6E4679493F0B53A7E -->
세션Id : <%=session.getId() %><br>
세션생성 시간 : <%=session.getCreationTime() %><br>
세션접근 시간 : <%=session.getLastAccessedTime() %><br>
세션유지 시간 : <%=session.getMaxInactiveInterval() %> 초(30분) <br>
세션유지 시간 2초 변경(2초가 지나면 서버 session기억장소 사라짐)
<%
// session.setMaxInactiveInterval(2);
%>
<br>
세션유지 시간 : <%=session.getMaxInactiveInterval() %> 초(2초) <br>
서버 세션 기억공간 전체삭제  :
<%
// 1B98C9589ACA6BB6E4679493F0B53A7E
// session.invalidate();
%>
<br>
서버 세션 기억공간에 (이름,값) 이름=값 : 
<%
session.setAttribute("sname", "svalue");
%>
<br>
서버 세션 기억공간에 이름에 해당하는 값을 가져오기 :
<%=session.getAttribute("sname") %>
</body>
</html>





