<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/scopePro.jsp</title>
</head>
<body>
<h1>jsp1/scopePro.jsp</h1>
<%
//폼에서 입력한 아이디 비밀번호 => 서버에 전달 request내장객체 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
// 내장객체 저장소에 => 값 저장
pageContext.setAttribute("page", "pageContext value");
request.setAttribute("req", "request value");
session.setAttribute("ses", "session value");
application.setAttribute("app", "application value");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
<br>
pageContext 값 : <%=pageContext.getAttribute("page") %><br>
request 값 : <%=request.getAttribute("req") %><br>
session 값 : <%=session.getAttribute("ses") %><br>
application 값 : <%=application.getAttribute("app") %><br>
<!-- http://localhost:8080/webProject
     /jsp1/scopePro.jsp?id=kim&pass=123 -->
<a href="scopePro2.jsp?id=<%=id %>&pass=<%=pass %>">scopePro2.jsp로 이동</a>
<script type="text/javascript">
//	alert("scopePro2.jsp 이동");
	location.href="scopePro2.jsp?id=<%=id %>&pass=<%=pass %>";
</script>
<%
// response.sendRedirect("scopePro2.jsp?id="+id+"&pass="+pass);

// 230110 수업시작.
// java,jsp,forward 이동방식 => jsp 액션태그 forward
// 1. request(요청정보)를 들고 이동
// 2. 주소변경 없이 이동
%>
<jsp:forward page="scopePro2.jsp" />
</body>
</html>



