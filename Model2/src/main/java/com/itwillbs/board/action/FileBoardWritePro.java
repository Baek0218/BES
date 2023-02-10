package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileBoardWritePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("FileBoardWritePro  execute()");
		// 파일 업로드 프로그램 설치  
		//  http://www.servlets.com/cos/
		//  cos.jar 다운 -> WEB-INF - lib - cos.jar
		
		// 객체생성
		// 1. request
		// 2. 웹서버 업로드 폴더 위치 -> webapp - upload 폴더 만들기
		String uploadPath = request.getRealPath("/upload");
		System.out.println(uploadPath);
		// 3. 파일크기
		int maxSize = 10*1024*1024;
		// 4. 한글처리
		// 5. 업로드 파일이름 동일할 때 -> 파일이름변경(DefaultFileRenamePolicy())
		
		MultipartRequest  multi = new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		
		return null;
	}

}
