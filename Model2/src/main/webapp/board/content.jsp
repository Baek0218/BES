<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/content.jsp</title>
</head>
<body>
	<%
	// http://localhost:8080/webproject/board/content.jsp?num=2

	// request에 저장된 num 파라미터값 가져오기   
	int num = Integer.parseInt(request.getParameter("num"));

	// BoardDAO 객체생성
	BoardDAO dao = new BoardDAO();

	// 리턴할형 BoardDTO getBoard(int num) 메서드 정의
	// BoardDTO dto = dao.getBoard(num) 메서드 호출
	BoardDTO dto = dao.getBoard(num);
	String id = (String) session.getAttribute("id");
	%>
	<h1>글내용 [로그인 : <%=id %>]</h1>
	<table border="1">
		<tr>
			<td>글번호</td>
			<td><%=dto.getNum()%></td>
		</tr>
		
		<tr>
			<td>작성자</td>
			<td><%=dto.getName()%></td>
		</tr>
		
		<tr>
			<td>글제목</td>
			<td><%=dto.getSubject()%></td>
		</tr>
		
		<tr>
			<td>글내용</td>
			<td><%=dto.getContent()%></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=dto.getReadcount()%></td>
		</tr>
		
		<tr>
			<td>작성일</td>
			<td><%=dto.getDate()%></td>
		</tr>
		<tr>
			<td colspan="2">
				<%
				// 로그인 -> 세션값 있음
				if (id != null) {
					// 세션값 = 글쓴이 -> 일치 -> 자기자신 쓴 글(글수정, 글삭제 보이기)
					if (id.equals(dto.getName())) {
				%> 
				<input type="button" value="글수정"
				 onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">

				<input type="button" value="글삭제"
				 onclick="location.href='deletePro.jsp?num=<%=dto.getNum()%>'">
				
				<%
				}
				}
				%>
				<input type="button" value="글목록" onclick="location.href='list.jsp'">
			</td>
		</tr>
	</table>
</body>
</html>