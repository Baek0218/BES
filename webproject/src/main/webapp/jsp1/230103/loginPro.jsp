<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/loginPro.jsp</title>
</head>
<body>
<h1>jsp1/loginPro.jsp</h1>
<%
// login 폼에서 입력한 내용을 서버에 전달하면
// 서버 request내장객체 태그이름=값으로 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
%>
폼에서 입력한 아이디 : <%=id %><br>
폼에서 입력한 비밀번호 : <%=pass %><br>
<%
//데이터베이스 저장된 아이디 admin , 비밀번호 p123
String dbId="admin";
String dbPass="p123";
%>
데이터베이스에서 입력한 아이디 : <%=dbId %><br>
데이터베이스에서 입력한 비밀번호 : <%=dbPass %><br>
<%
// 기본자료형 비교         숫자 == 숫자  
// 참조형 비교(문자열 비교)  문자열.equals(문자열)
if(id.equals(dbId) && pass.equals(dbPass)){
	out.println("아이디 비밀번호 일치");
	// 아이디 비밀번호 일치 => 권한부여 
// 			            => 연결만 되어있으면 페이지 상관없이 값을 유지 
			//          => 세션값을 부여
	session.setAttribute("id", id);
	// loginMain.jsp  이동
	response.sendRedirect("loginMain.jsp");
}else {
	out.println("아이디 비밀번호 틀림");
	// 아이디 비밀번호 틀림
	// 뒤로이동 
	%>
	<script type="text/javascript">
		alert("아이디 비밀번호 틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html>




