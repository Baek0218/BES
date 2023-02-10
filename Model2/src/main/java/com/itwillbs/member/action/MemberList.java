package com.itwillbs.member.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberList implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 // MemberDAO 객체생성
		 MemberDAO dao=new MemberDAO();
		 // 리턴할형 ArrayList<MemberDTO>  getMemberList() 메서드 정의 
		 // ArrayList<MemberDTO>  memberList = dao.getMemberList() 메서드 호출
		 ArrayList<MemberDTO> memberList =dao.getMemberList();
		// memberList 데이터 request 담아서 이동
		 request.setAttribute("memberList", memberList);
		//  member/list.jsp 이동
		 ActionForward forward = new ActionForward();
		 forward.setPath("member/list.jsp");
		 forward.setRedirect(false);
		 return forward;
	}
}
