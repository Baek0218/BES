package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;

public class BoardUpdateForm implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardUpdateForm execute()");
		
		int num=Integer.parseInt(request.getParameter("num"));
		
		BoardDAO dao=new BoardDAO();
		
		//file 추가
		BoardDTO dto=dao.getBoard(num);
		
		// dto request 담아서 이동 => board/updateForm.jsp
		request.setAttribute("dto", dto);
		
		ActionForward forward=new ActionForward();
		forward.setPath("board/updateForm.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
