package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberUpdateForm implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		// 회원정보 기준값 id => 세션에 "id"값 저장 되어있음.
		// 세션에서 "id"값을 가져오기 -> 변수저장( 다운캐스팅 이루어짐.)
		HttpSession session = request.getSession(); // - 세션 객체생성
		String id = (String) session.getAttribute("id");
		
		// MemberDAO 객체생성 -> 기억장소 할당
		MemberDAO dao = new MemberDAO();
		
		// MemberDTO dto = dao.getMember(id)메서드 호출
		MemberDTO dto  = dao.getMember(id); //- Object형
		
		// dto 정보를 들고 가기(request 정보를 담아가기)
		request.setAttribute("dto", dto); // "id" ="dto"
		
		//member/updateForm.jsp 주소 변경없이(false) 이동
		ActionForward forward = new ActionForward();
		forward.setPath("member/updateForm.jsp"); // 이동경로
		forward.setRedirect(false); // 주소 변경없이 이동해야해서 false
		return forward; // 이동정보 리턴 : forward 가 이동경로 를 나타내서 return forward
		
		
	}

}
