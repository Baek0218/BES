<%@page import="com.itwillbs.member.db.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.member.db.MemberDAO"%>
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
<title>member/list.jsp</title>
</head>
<body>
	<h1>member/list.jsp</h1>
	<%
	// MemberDAO 객체생성, 리턴할 형 getMemberList() 메서드 정의
	MemberDAO dao = new MemberDAO();
	
	// dao.deleteMember(id) 메서드 호출
	// MemberDAO 객체생성, 리턴할 형 ArrayList<MemberDTO> getMemberList() 메서드 정의
	// ArrayList<MemberDTO> memberList = dao.getMemberList() 메서드 호출
	ArrayList<MemberDTO> memberList = dao.getMemberList();
	%>
	
	<table border=1>
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>가입날짜</td>
		</tr>
		
		<%
		// 5단계 조건이 true 실행문 -> 다음행 데이터 있으면 true -> 열접근 -> 출력
		// 배열 접근 ->for문
		for(int i = 0; i<memberList.size();i++){
			// 배열 한칸에 내용 가져오기 
			MemberDTO dto=memberList.get(i);
		%>
		
		<tr>
			<td><%=dto.getId()%></td>
			<td><%=dto.getPass()%></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getDate()%></td>
		</tr>
		
		<%
		}
		%>

	</table>
</body>
</html>