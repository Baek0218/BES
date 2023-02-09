
<%@page import="com.itwillbs.member.db.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updateForm.jsp</title>
</head>
<body>
	<h1>member/updateForm.jsph1</h1>
	<%
	// request.setCharacterEncoding("utf-8");
	// 회원정보 기준값 id => 세션에 "id"값 저장 되어있음.
	// 세션에서 "id"값을 가져오기 -> 변수저장( 다운캐스팅 이루어짐.)
	// String id = (String) session.getAttribute("id");
 
	// MemberDAO 객체생성 
	// MemberDAO dao = new MemberDAO();
	// MemberDTO dto = getMember(id) 메서드호출
	// MemberDTO dto = dao.getMember(id);
	// 4단계 SQL구문을 실행(select) ⇒ 결과저장(select)

	//next()다음행 -> 리턴값 데이터 있으면 True/ 데이터 없으면 false 
	// 조건이 true 실행문 -> 다음데이터 있으면 true -> 디비 열접근 출력
	MemberDTO dto = (MemberDTO) request.getAttribute("dto"); // 다운캐스팅으로 dto의 값을 가져온다 --getAttribute("dto") 
	%>
	<form action="MemberUpdatePro.me" method="post">

		아이디 : <input type="text" name="id" value="<%=dto.getId()%>" readonly>
		<br> 
		비밀번호 : <input type="password" name="pass"> <br>
		
		이름 : <input type="text" name="name" value="<%=dto.getName()%>">
		<br>
		<input type="submit" value="회원정보수정">
	</form>
	
	<a href="MemberMain.jsp">메인으로 이동</a>

</body>
</html>