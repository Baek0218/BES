<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/insertPro.jsp</title>
</head>
<body>
<h1>jsp2/insertPro.jsp</h1>
<% 
// 폼에서 입력한 내용이 서버에 전달 → request 내장객체 저장 ,
// request 한글처리
request.setCharacterEncoding("utf-8");	 
// request 태그이름에 해당하는 값을 가져오기 → 변수에 저장
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
// 1단계 JDBC안에 있는 Driver프로그램 불러오기
// java.lang.Class 자바내장객체 | java.lang : 기본폴더.자동으로 경로인식
// JDBC 프로그램안에 → com\mysql\cj\jdbc\Driver.class파일
Class.forName("com.mysql.cj.jdbc.Driver");
// 2단계 Driver 프로그램 이용해서 디비연결
// java.sql.DriverManager 자바내장객체 
// → DriverManager 자동완성 하면 경로설정 : page import="java.sql.DriverManager"
// DriverManager.getConnection(url, user, password);
// 							   디비주소 디비아이디 디비패스워드
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="root";
String dbPass="1234";
// 디비연결해서 연결정보를 저장하는 변수(Connection)  
// jaba.sql.Connection 자바내장객체로 자동완성으로 경로설정 : import="java.sql.Connection"
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
// 3단계 SQL구문 만들어서 실행할 준비
// 연결정보 con을 이용해서 SQL구문을 만드는 내장객체 생성 : con.prepareStatement(sql) 
// 자바내장객체로 자동완성으로 경로설정 : import="java.sql.PreparedStatement" 
// 보안 취약 구문, 구문 복잡
// String sql="insert into student(num,name) values("+num+",'"+name+"')";
// 보안 좋음, 구문 간단
String sql="insert into student(num,name) values(?,?)";
// ? 채워넣기 
PreparedStatement pstmt =con.prepareStatement(sql); 
pstmt.setInt(1,num); // set 정수형 (1번째 물음표, 값 num)
pstmt.setString(2,name); // set 문자열 (2번째 물음표, 값 name)
// 4단계 SQL구문을 실행(insert,update,delete) ⇒ 결과있으면 결과저장(select)
pstmt.executeUpdate();

// 5단계 결과를 출력, 데이터 담기(select)
%>
입력성공<%=pstmt %>
</body>
</html>