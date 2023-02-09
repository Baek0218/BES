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
<title>jsp2/selectPro.jsp</title>
</head>
<body>
<h1>jsp2/selectPro.jsp</h1>
<% 
int num = Integer.parseInt(request.getParameter("num"));
// 1단계 JDBC안에 있는 Driver프로그램 불러오기
Class.forName("com.mysql.cj.jdbc.Driver");

// 2단계 Driver 프로그램 이용해서 디비연결
String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
String dbUser = "root";
String dbPass = "1234";

Connection con = DriverManager.getConnection(dbUrl,dbUser,dbPass);

// 3단계 SQL구문 만들어서 실행할 준비(delete num이랑 name이 동시에 일치)
String sql = " select * from student where num = ? ";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1,num);
// 4단계 SQL구문을 실행(insert,update,delete) ⇒ 결과있으면 결과저장(select)
ResultSet rs = pstmt.executeQuery();

// 5단계 결과를 출력, 데이터 담기(select)
//  next() : 현재 위치 X → 리턴값 데이터 있으면 True / 데이터 없으면 false 
// 조건이 True이면 실행문 → 다음행 데이터가 있으면 열에 접근을 한다.
 %>
<table border ="1">

	<tr>
	
		<td>학생번호</td>
		<td>학생이름</td>
		
	</tr>
<% 
if(rs.next()){
	%>

	<tr>
		<td><%=rs.getInt("num") %></td>
		<td><%=rs.getString("name") %></td>
	</tr>
<% 
}
%>
</table>
</body>
</html>



