<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.board.db.BoardDTO"%>
<%@page import="com.itwillbs.board.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/list.jsp</title>
</head>
<body>
	<%-- <%
	// BoardDAO 객체생성 
	BoardDAO dao = new BoardDAO();
	
	// 한페이지에 보여줄 글개수 설정
	int pageSize = 3; 
	
	// 현 페이지 번호 가져오기 - 처음 들어갔을때 페이지번호가 없으면 무조건 1페이지 설정 
	// http://localhost:8080/webproject/board/list.jsp
	// http://localhost:8080/webproject/board/list.jsp?pageNum=1
	// <a href="list.jsp?pageNum=1">1</a> 이렇게 설정.
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		// 페이지번호가 없으면 1페이지로 설정
		pageNum = "1";
	}
	
	// pageNum -> 숫자변경
	int currentPage = Integer.parseInt(pageNum);
	// 시작하는 행번호 구하기 int startRow = 계산식; --> 계산식 = 알고리즘
	// pageNum(currentPage)  pageSize  -> startRow
	//         1                 10    ->  (1-1)*10+1-> 0*10+1 ->  0+1 ->  1 ~ 10
	//         2                 10    ->  (2-1)*10+1-> 1*10+1 -> 10+1 -> 11 ~ 20
	//         3                 10    ->  (3-1)*10+1-> 2*10+1 -> 20+1 -> 21 ~ 30
	
	int startRow = (currentPage -1) * pageSize + 1 ;
	
	// 끝나는 행번호 구하기 int endRow = 계산식;
	// startRow      pageSize  =>  endRow
	//     1            10     =>  1+10-1    10
	//    11            10     => 11+10-1    20
	//    21            10     => 21+10-1    30
	int endRow = startRow + pageSize -1;
	
	// select * from board order by num desc -- 전체글을 대상으로 내림차순 정렬
	// select * from board order by num desc limit 시작행-1, 몇개 -- MySQL에만 있는 구문(limit)
	
	
	// 리턴할형 ArrayList<MemberDTO> getBoardList(int startRow, int pageSize) 메서드 정의
	// ArrayList<BoardDTO> board List = dao.getBoardList(startRow,pageSize) 메서드 호출
	ArrayList<BoardDTO> BoardList = dao.getBoardList(startRow, pageSize); 
	%> --%>
	<%
	// request 가져온 데이터 담기
	ArrayList<BoardDTO> BoardList = (ArrayList<BoardDTO>) request.getAttribute("boardList");

	int currentPage = (Integer) request.getAttribute("currentPage");
	int startPage = (Integer) request.getAttribute("startPage");
	int pageBlock = (Integer) request.getAttribute("pageBlock");
	int endPage = (Integer) request.getAttribute("endPage");
	int pageCount = (Integer) request.getAttribute("pageCount");
	%>
	<h1>board/list.jsp</h1>
	<h1>
		<a href="writeForm.jsp">글쓰기</a>
	</h1>
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>글쓴이</td>
			<td>제목</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>

		<%
		// 배열접근 -> for -> 배열한칸에 내용 가져오기 -> BoardDTO 저장 -> 출력
		// 5단계 조건이 true 실행문 -> 다음행 데이터 있으면 true -> 열접근 -> 출력
		// 배열 접근 ->for문
		for (int i = 0; i < BoardList.size(); i++) {
			// 배열 한칸에 내용 가져오기 
			BoardDTO dto = BoardList.get(i);
		%>

		<tr>
			<td><%=dto.getNum()%></td>
			<td><%=dto.getName()%></td>

			<td><a href="content.jsp?num=<%=dto.getNum()%>"> <%=dto.getSubject()%></a></td>

			<td><%=dto.getDate()%></td>
			<td><%=dto.getReadcount()%></td>
		</tr>

		<%
		} // for(){}
		%>
	</table>
	<%
	// 한 화면에 보여줄 페이지 개수 설정
	// int pageBlock = 3;

	// 시작하는 페이지번호 구하기
	// currentPage           pageBlock    ->          startPage
	//   1~10( 0~ 9)            10        ->   (-1)/10*10+1->0*10+1-> 0+1->  1
	//  11~20(10~19)            10        ->   (-1)/10*10+1->1*10+1->10+1-> 11
	//  21~30(20~29)            10        ->   (-1)/10*10+1->2*10+1->20+1-> 21
	// int startPage = (currentPage-1)/pageBlock*pageBlock+1;

	// 끝나는 페이지번호 구하기
	// startPage     pageBlock     ->  endPage
	//    1            10          ->    1+10-1 -> 10        
	//   11            10          ->   11+10-1 -> 20
	//   21            10		   ->   21+10-1 -> 30
	// int endPage = startPage + pageBlock -1;

	// 전체글개수 (count) - select count(*) from board;
	// int 리턴할 형 getBoardCount()메서드 정의
	// getBoardCount() 메서드 호출
	// int count = dao.getBoardCount();

	// endPage = 10  <= 전체페이지(pageCount) = 2 
	// 전체페이지(pageCount) 구하기
	// ->전체글의 개수 13 / 글개수10 -> 1페이지 + (0.3 글 남아있으면 1페이지 추가)

	// int pageCount = count/pageSize+(count%pageSize==0?0:1);

	if (endPage > pageCount) {
		endPage = pageCount;
	}

	// 1페이지 이전
	if (currentPage > 1) {
	%>
	<%-- 	<a href="list.jsp?pageNum=<%=currentPage-1%>">[1페이지 이전]</a> --%>
	<%
	}

	// 10페이지 이전
	if (startPage > pageBlock) {
	%>
	<a href="BoardList.bo?pageNum=<%=startPage - pageBlock%>">[10페이지 이전]</a>
	<%
	}

	// 1페이지 다음
	if (currentPage < pageCount) {
	%>
	<a href="BoardList.bo?pageNum=<%=currentPage + 1%>">[1페이지 다음]</a>
	<%
	}

	// 10페이지 다음
	if (endPage < pageCount) {
	%>
	<a href="BoardList.bo?pageNum=<%=startPage + pageBlock%>">[10페이지 다음]</a>
	<%
	}

	for (int i = startPage; i <= endPage; i++) {
	%>
	<a href="BoardList.bo?pageNum=<%=i%>"><%=i%></a>
	<%
	}
	%>

</body>
</html>