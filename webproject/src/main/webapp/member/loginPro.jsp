<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/loginPro.jsp</title>
</head>
<body>
	<h1>member/loginPro.jsp</h1>
	<%
	request.setCharacterEncoding("utf-8");
	// 폼에서 입력한 내용이 서버에 전달 → request 내장객체 저장
	// request 태그이름에 해당하는 값을 가져오기 → 변수에 저장
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	// -230117
	// MemberDAO 객체생성 -> 기억장소 할당
	MemberDAO dao = new MemberDAO();
	// public 리턴할형(boolean | MemberDTO)
	// userCheck(String id,String pass) 메서드 정의  

	
	MemberDTO dto = dao.userCheck(id, pass);
	if (dto != null) {
		// id, pass 일치하면 MemberDTO 바구니에 데이터를 담아서 주소 가져오기.
		// => 세션값 생성 "id",id(페이지 상관없이 값을 유지). main jsp 이동
		session.setAttribute("id", id);
		response.sendRedirect("main.jsp");
	} else {
		// id, pass 틀리면 MemberDTO 빈(null) 바구니를 주소 가져오기.
		// = 주소.userCheck(id,pass)메서드 호출
	%>
	<script type="text/javascript">
		alert("입력정보틀림");
		history.back();
	</script>
	<%
	}
	%>





</body>
</html>