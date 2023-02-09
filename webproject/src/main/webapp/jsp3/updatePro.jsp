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
<title>jsp3/updatePro.jsp</title>
</head>
<body>
	<h1>jsp3/updatePro.jsp</h1>
	<%
	//폼에서 입력한 내용이 서버에 전달 → request 내장객체 저장 ,
	//request 한글처리
	request.setCharacterEncoding("utf-8");
	// request 태그이름에 해당하는 값을 가져오기 → 변수에 저장(id,pass,name)
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");

	// 1단계 JDBC안에 있는 Driver프로그램 불러오기
	Class.forName("com.mysql.cj.jdbc.Driver");
	// 2단계 Driver 프로그램 이용해서 디비연결
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
	String dbUser = "root";
	String dbPass = "1234";

	//디비연결해서 연결정보를 저장하는 변수(Connection)  
	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

	// 3단계 SQL구문 만들어서 실행할 준비-(select where id =? and pass=?)
	String select = "select * from members where id =? and pass =?";

	// 4단계 SQL구문을 실행(select)⇒ 결과있으면 결과저장
	PreparedStatement pstmt = con.prepareStatement(select);
	pstmt.setString(1, id);
	pstmt.setString(2, pass);

	// 5단계 결과를 출력, 데이터 담기(select)
	ResultSet rs = pstmt.executeQuery();
	// if next() 다음행 → 리턴값 데이터 있으면 True → 아이디 비밀번호 일치
	// → 3단계 pstmt2 sql 구문 만들어서 실행할 준비(update set name =? where id =?) 
	// → 4단계 sql구문을 실행 update -> main.jsp 이동 (이름이 수정되는것 확인하기.)
	//  데이터 없으면 false → 아이디 비밀번호 틀림 : script 뒤로이동

	if (rs.next()) {
		String update = "update members set name =? where id =?";
		PreparedStatement pstmt2 = con.prepareStatement(update);
		pstmt2.setString(1, name);
		pstmt2.setString(2, id);

		pstmt2.executeUpdate(); //4단계 실행
	
		response.sendRedirect("main.jsp"); // 메인이동
	} else {
	%>
	<script>
		alert("아이디 비밀번호 틀림");
		back.history();
	</script>
	<%
	}
	%>
</body>
</html>