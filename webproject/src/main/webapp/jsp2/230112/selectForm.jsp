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
<title>jsp2/selectForm.jsp</title>
</head>
<body>
<h1>jsp2/selectForm.jsp</h1>
<form action="selectPro.jsp" method = "get">

조회 할 학생번호 : <input type ="text" name ="num"><br>
				<br>
			    <input type = "submit" value="학생정보조회">
			    
</form>
</body>
</html>


