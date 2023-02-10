package com.itwillbs.board.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;

public class BoardWritePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardWritePro execute()");
		
		// board/writePro.jsp 
		// request 한글처리
		request.setCharacterEncoding("utf-8");
		// request name, subject, content 가져와서 변수에 저장
		int readcount = 0;
		Timestamp date = new Timestamp(System.currentTimeMillis());

		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		// BoardDTO 객체생성
		BoardDTO dto = new BoardDTO();

		// set메서드 호출해서 값 저장
		// dto.setNum(num); 
		dto.setName(name);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setReadcount(readcount);
		dto.setDate(date);

		// 패키지 board 파일이름 BoardDAO 
		// 리턴할형없음 insertBoard(BoardDTO dto) 메서드정의
		// BoardDAO 객체생성
		BoardDAO dao = new BoardDAO();

		// insertBoard(dto) 메서드 호출, num setInt(1)
		dao.insertBoard(dto);

		// response.sendRedirect("list.jsp");
		ActionForward forward = new ActionForward();
		forward.setPath("BoardList.bo");
		forward.setRedirect(true);
		return forward;
	}

}
