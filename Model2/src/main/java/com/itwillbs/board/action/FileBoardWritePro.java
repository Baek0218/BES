package com.itwillbs.board.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileBoardWritePro implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FileBoardWritePro execute()");
		// 파일 업로드  프로그램 설치
		// http://www.servlets.com/cos/
		// cos.jar 다운 => WEB-INF - lib - cos.jar
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
		
// multi 업로드 정보 => 디비 저장 
// multi name, subject,content 가져와서 변수에 저장
String name=multi.getParameter("name");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
int readcount=0;
Timestamp date=new Timestamp(System.currentTimeMillis());
// 추가 -> 업로드된 파일이름 정보
String file=multi.getFilesystemName("file");

// 패키지 board  파일이름 BoardDTO 
// 멤버변수  num, name, subject, content, readcount, date
// set get 만들기
// BoardDTO 객체생성
BoardDTO dto=new BoardDTO();
// set메서드 호출해서 값 저장
dto.setName(name);
dto.setSubject(subject);
dto.setContent(content);
dto.setReadcount(readcount);
dto.setDate(date);
// file 추가
dto.setFile(file);

// 패키지 board  파일이름 BoardDAO
// 리턴할형없음 insertBoard(BoardDTO dto) 메서드 정의
// BoardDAO 객체생성
BoardDAO dao=new BoardDAO();
// insertBoard(dto) 메서드 호출 => 첫번째 ?  pstmt.setInt(1, 1));
dao.insertBoard(dto);

// 글목록 list.jsp 
//response.sendRedirect("list.jsp");
ActionForward forward=new ActionForward();
forward.setPath("BoardList.bo");
forward.setRedirect(true);
return forward;

	}
}
