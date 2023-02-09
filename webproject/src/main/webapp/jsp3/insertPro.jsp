<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/insertPro.jsp</title>
</head>
<body>
<h1>jsp3/insertPro.jsp</h1>
<%
// 폼에서 입력한 내용이 서버에 전달 → request 내장객체 저장
// request한글처리
request.setCharacterEncoding("utf-8");

// request 태그이름에 해당하는 값을 가져오기 → 변수에 저장
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");

// 가입날짜 → 시스템 날짜
// jaba.sql.Timestamp 자방내장객체 → 날짜
Timestamp date = new Timestamp(System.currentTimeMillis());

//1단계 JDBC안에 있는 Driver프로그램 불러오기
Class.forName("com.mysql.cj.jdbc.Driver");

// 2단계 Driver 프로그램 이용해서 디비연결
String dbUrl = "jdbc:mysql://localhost:3306/jspdb1";
String dbUser = "root";
String dbPass = "1234";

Connection con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
// 3단계 SQL구문 만들어서 실행할 준비(insert) 
// ? 채워넣기 
String sql = "insert into members(id,pass,name,date) values(?,?,?,?)";

// 4단계 SQL구문을 실행(insert,update,delete)  
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pass);
pstmt.setString(3, name);
pstmt.setTimestamp(4, date);

pstmt.executeUpdate();


//----230113 수업 로그인이동부터 시작
// 로그인 이동
response.sendRedirect("loginForm.jsp");

// 5단계 결과를 출력, 데이터 담기(select)
%>
회원가입성공<%=pstmt %>
</body>
</html>