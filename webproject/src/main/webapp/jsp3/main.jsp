<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/main.jsp</title>
<!-- 
<script type="text/javascript">
 	function fun() {
		location.href = "logout.jsp"
	}
</script> -->
</head>
<body>
	<h1>jsp3/main.jsp</h1>
	<%
	// session.getAttribute("id",모든 참조형값); → 업캐스팅으로 형변환 이루어진다.
	// 자식 = 업캐스팅된 부모 (다운캐스팅 명시적으로 형변환)
	String id = (String) session.getAttribute("id");

	// 세션값이 없으면(세션값이 null이면) -> loginForm.jsp로 이동
	if (id == null) {
		response.sendRedirect("loginForm.jsp");
	}
	%>
	<%=id%>님 로그인 하셨습니다.
	<br>
	<br>
	<!-- <input type="button" value="로그아웃" onclick="fun()">  -->
	<a href="logout.jsp">로그아웃</a><br>
	<a href="info.jsp">회원정보조회</a><br>
	<a href="updateForm.jsp">회원정보수정</a><br>
	<a href="deleteForm.jsp">회원정보삭제</a><br>
	<%
	// 로그인 한 회원 if문 (id != null){}
	if(id != null){

		// admin인 경우, 회원목록이 보이게 if문
		if(id.equals("admin")){ 
		%>
		<a href="list.jsp">회원목록</a><br>
		<% 	
		}
	}
	%>

</body>
</html>