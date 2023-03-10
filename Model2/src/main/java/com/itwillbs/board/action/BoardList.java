package com.itwillbs.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;

public class BoardList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardList execute()");
		// 디비 데이터 가져오기
		BoardDAO dao = new BoardDAO();
		
		int pageSize = 3; 
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1) * pageSize + 1 ;
		int endRow = startRow + pageSize -1;
		
		ArrayList<BoardDTO> BoardList = dao.getBoardList(startRow, pageSize); 
		
		int pageBlock = 3;
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage + pageBlock -1;
		
		int count = dao.getBoardCount();
		int pageCount = count/pageSize+(count%pageSize==0?0:1);
		
		if(endPage > pageCount ){
			endPage = pageCount;
		}
		
		
		// request 가져온 데이터 담기
		request.setAttribute("boardList", BoardList);
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		
		// 이동
		ActionForward forward = new ActionForward();
		forward.setPath("board/list.jsp");
		forward.setRedirect(false); // 주소값이 안바뀌면서 이동하겠다.
 		
		return forward;
	}

}
