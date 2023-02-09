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
<title>jsp3/updateForm.jsp</title>
</head>
<body>
	<h1>jsp3/updateForm.jsph1</h1>
	<%
	request.setCharacterEncoding("utf-8");
	// 회원정보 기준값 id => 세션에 "id"값 저장 되어있음.
	// 세션에서 "id"값을 가져오기 -> 변수저장( 다운캐스팅 이루어짐.)
	String id = (String) session.getAttribute("id");

	// 1단계 JDBC안에 있는 Driver프로그램 불러오기
	Class.forName("com.mysql.cj.jdbc.Driver");
	// 2단계 Driver 프로그램 이용해서 디비연결
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
	String dbUser = "root";
	String dbPass = "1234";

	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
	// 3단계 SQL구문 만들어서 실행할 준비(select조건 where id =?) 
	String sql = "select * from members where id = ?";

	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	// 4단계 SQL구문을 실행(select) ⇒ 결과저장(select)
	//5단계 결과를 출력, 데이터 담기(select)
	ResultSet rs = pstmt.executeQuery();

	//next()다음행 -> 리턴값 데이터 있으면 True/ 데이터 없으면 false 
	// 조건이 true 실행문 -> 다음데이터 있으면 true -> 디비 열접근 출력

	if (rs.next()) {
	%>
	<form action="updatePro.jsp" method="post">

		아이디 : <input type="text" name="id" value="<%=id%>" readonly>
		<br> 
		비밀번호 : <input type="password" name="pass"> <br>
		
		이름 : <input type="text" name="name" value="<%=rs.getString("name")%>">
		<br>
		<input type="submit" value="회원정보수정">
	</form>
	<%
	}
	%><br>
	<a href="main.jsp">메인으로 이동</a>

</body>
</html>