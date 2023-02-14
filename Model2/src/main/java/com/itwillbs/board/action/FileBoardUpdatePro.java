package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileBoardUpdatePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FileBoardUpdatePro execute()");
		
		//객체생성
				// 1. request 
				// 2. 웹서버 업로드 폴더 위치 => webapp - upload 폴더 만들기
				String uploadPath=request.getRealPath("/upload");
				System.out.println(uploadPath);
				// 3. 파일크기  10M
				int maxSize=10*1024*1024;
				// 4. 한글처리
		// 5. 업로드 파일이름 동일할때 => 파일이름변경(DefaultFileRenamePolicy)
		MultipartRequest multi=new MultipartRequest
		(request, uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		
		// multi  => num, name, subject, content 파라미터 => 변수 저장 
				int num=Integer.parseInt(multi.getParameter("num"));
				String name=multi.getParameter("name");
				String subject=multi.getParameter("subject");
				String content=multi.getParameter("content");
				//첨부파일
				// 추가 -> 업로드된 파일이름 정보
				String file=multi.getFilesystemName("file");
				// 수정할 업로드 파일이 없으면 기존파일 유지
				if(file==null) {
					file=multi.getParameter("oldfile");
				}
				
				// BoardDTO 객체생성
				BoardDTO dto=new BoardDTO();
				// set메서드호출 num, name, subject, content 저장
				dto.setNum(num);
				dto.setName(name);
				dto.setSubject(subject);
				dto.setContent(content);
				// file 추가
				dto.setFile(file);

				// BoardDAO 객체생성
				BoardDAO dao=new BoardDAO();
				// 리턴할형 없음 fupdateBoard(BoardDTO dto) 메서드 정의
				// fupdateBoard(dto) 메서드 호출
				dao.fupdateBoard(dto);

				// list.jsp 이동
				ActionForward forward=new ActionForward();
				forward.setPath("BoardList.bo");
				forward.setRedirect(true);
				return forward;
	}

}
