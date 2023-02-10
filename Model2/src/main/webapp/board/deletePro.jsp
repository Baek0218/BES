<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
// board/deletePro.jsp
// request -> num 파라미터 -> 변수저장
int num = Integer.parseInt(request.getParameter("num"));

// BoardDAO 객체생성
BoardDAO dao = new BoardDAO();

// 리턴할형 없음 deleteBoard(int num)메서드 정의
// deleteBoard(num)메서드 호출 
dao.deleteBoard(num);

// list.jsp 이동
response.sendRedirect("list.jsp");

%>