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
<title>jsp3/deletePro.jsp</title>
</head>
<body>
	<h1>jsp3/deletePro.jsp</h1>
	<%
	// request 태그이름에 해당하는 값을 가져오기 → 변수에 저장(id,pass)
	String id = (String) request.getParameter("id");
	String pass = (String) request.getParameter("pass");
	// 1단계 JDBC안에 있는 Driver프로그램 불러오기
	Class.forName("com.mysql.cj.jdbc.Driver");

	// 2단계 Driver 프로그램 이용해서 디비연결
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";;
	String dbUser = "root";
	String dbPass = "1234";

	//디비연결해서 연결정보를 저장하는 변수(Connection)  
	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

	// 3단계 SQL구문 만들어서 실행할 준비- (select where id = ? and pass =?)
	String select = "select * from members where id = ? and pass =?";
	// 4단계 SQL구문 실행(select) => 결과저장
	PreparedStatement pstmt = con.prepareStatement(select);
	pstmt.setString(1, id);
	pstmt.setString(2, pass);

	// 5단계 결과를 출력, 데이터 담기(select)
	ResultSet rs = pstmt.executeQuery();

	// if(next()) 다음행 -> 리턴값 있으면 true -> 아이디 비밀번호 일치
	if (rs.next()) {
		// 3단계 SQL구문 만들어서 실행할 준비-(delete where id =?)
		String delete = "delete from members where id =?";
		PreparedStatement pstmt2 = con.prepareStatement(delete);
		pstmt2.setString(1, id);

		// 4단계 SQL구문을 실행(delete)
		pstmt2.executeUpdate();

		// 세션값 초기화
		session.invalidate();
		// main.jsp 이동
		response.sendRedirect("main.jsp");
		//  데이터 없으면 false → 아이디 비밀번호 틀림 : script 뒤로이동
	} else {
	%>
	<script type="text/javascript">
		alert("아이디 비밀번호 틀림");
		back.history();
	</script>
	<%
	}
	%>
</body>
</html>