<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// board/updatePro.jsp
// 한글처리
	request.setCharacterEncoding("utf-8");
// request -> num, name, subject, content 파라미터 -> 변수 저장

	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");

// BoardDTO 객체생성
	BoardDTO dto = new BoardDTO();

// set 메서드호출 - num, name, subject, content 값 저장
	dto.setNum(num);
	dto.setName(name);
	dto.setSubject(subject);
	dto.setContent(content);
	
// BoardDAO 객체생성 
	BoardDAO dao = new BoardDAO();

// 리턴할형 없음 updateBoard(BoardDTO dto) 메서드 정의

// updateBoard(dto)메서드 호출
	dao.updateBoard(dto);
// 수정완료 후 list.jsp 이동
	response.sendRedirect("list.jsp");

%>