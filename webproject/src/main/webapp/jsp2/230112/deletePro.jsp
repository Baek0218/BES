<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp2/deletePro.jsp</title>
</head>
<body>
<h1>jsp2/deletePro.jsp</h1>
<%
//폼에서 입력한 내용이 서버에 전달 → request 내장객체 저장 ,
//request 한글처리
request.setCharacterEncoding("utf-8");
// request 태그이름에 해당하는 값을 가져오기 → 변수에 저장
int num =Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");
// 1단계 JDBC안에 있는 Driver프로그램 불러오기
// java.lang.Class 자바내장객체 | java.lang : 기본폴더.자동으로 경로인식
// JDBC 프로그램안에 → com\mysql\cj\jdbc\Driver.class파일
Class.forName("com.mysql.cj.jdbc.Driver");
// 2단계 Driver 프로그램 이용해서 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="root";
String dbPass = "1234";
//디비연결해서 연결정보를 저장하는 변수(Connection)  
//jaba.sql.Connection 자바내장객체로 자동완성으로 경로설정 : import="java.sql.Connection"
Connection con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
// 3단계 SQL구문 만들어서 실행할 준비(delete num이랑 name이 동시에 일치)

// ? 채워넣기 
String sql = "delete from student where name = ? and num = ?";
		
// 4단계 SQL구문을 실행(insert,update,delete) ⇒ 결과있으면 결과저장(select)
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1,name); // set 문자열(1번째 물음표, 값 name)
pstmt.setInt(2,num);	// set 정수형 (1번째 물음표, 값 num)
pstmt.executeUpdate();
// 5단계 결과를 출력, 데이터 담기(select)
%>
삭제성공 <%=pstmt %>
<%
// cmd 
// mysql -uroot -p1234 jspdb1 
// select * from student 
%>
</body>
</html>