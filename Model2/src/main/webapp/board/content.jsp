<%@page import="com.itwillbs.board.db.BoardDTO"%>
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
	//  http://localhost:8080/webProject/board/content.jsp?num=2
	// request 에 저장된 num 파라미터값 가져오기
	// int num=Integer.parseInt(request.getParameter("num"));
	// // BoardDAO 객체생성
	// BoardDAO dao=new BoardDAO();
	// // 리턴할형 BoardDTO  getBoard(int num) 메서드 정의 
	// // BoardDTO  dto = dao.getBoard(num) 메서드 호출
	// BoardDTO dto=dao.getBoard(num);
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");

	BoardDTO dto = (BoardDTO) request.getAttribute("dto");
	%>
	<h1>
		글내용 [로그인 :
		<%=id%>]
	</h1>
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
			<td>글쓴날짜</td>
			<td><%=dto.getDate()%></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=dto.getReadcount()%></td>
		</tr>
		<tr>
			<td>글제목</td>
			<td><%=dto.getSubject()%></td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td><a href="upload/<%=dto.getFile()%>" download><%=dto.getFile()%></a>
				<img src="upload/<%=dto.getFile()%>" width="100" height="100">
			</td>
		</tr>
		<tr>
			<td>글내용</td>
			<td><%=dto.getContent()%></td>
		</tr>
		<tr>
			<td colspan="2">
				<%
				// 로그인 => 세션값 있음
				if (id != null) {
					// 세션값  , 글쓴이  => 일치 => 자기자신 쓴 글(글수정, 글삭제 보이기)
					if (id.equals(dto.getName())) {
				%> 
				<input type="button" value="글수정" onclick="location.href='BoardUpdateForm.bo?num=<%=dto.getNum()%>'">
				<input type="button" value="글삭제" onclick="location.href='BoardDeletePro.bo?num=<%=dto.getNum()%>'">

				<input type="button" value="파일 글수정" onclick="location.href='FileBoardUpdateForm.bo?num=<%=dto.getNum()%>'">
				<%
				}
				}
				%> <input type="button" value="글목록" onclick="location.href='BoardList.bo'">
			</td>
		</tr>
	</table>
</body>
</html>