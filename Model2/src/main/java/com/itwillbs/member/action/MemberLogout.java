package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogout implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLogout execute()");
		
		// 세션값 초기화 -1 : 세션값 불러오기
		HttpSession session = request.getSession();
		// 세션값 초기화 -2 : 세션값 초기화 시키기
		session.invalidate();
		
		// MemberMain.me로 주소 변경하면서 이동.
		// => .jsp == false 주소가 안바뀌면서 이동하니까 false | .me == true 주소가 바뀌면서 이동하니까 true
		ActionForward forward = new ActionForward();
		forward.setPath("MemberMain.me");
		forward.setRedirect(true);
		return forward;
		
		//
	}

}
