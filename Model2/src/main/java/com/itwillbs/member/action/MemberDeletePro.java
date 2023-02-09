package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberDeletePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// request 태그이름에 해당하는 값을 가져오기 → 변수에 저장(id,pass)
		String id = (String) request.getParameter("id");
		String pass = (String) request.getParameter("pass");

		// MemberDAO 객체생성 -> 기억장소 할당
		MemberDAO dao = new MemberDAO();

		// MemberDTO dto = dao.userCheck(id, pass) 메서드 호출
		MemberDTO dto = dao.userCheck(id, pass);

		ActionForward forward = null;
		if (dto != null) {
			// id,pass 일치. 리턴값없음 deleteMember(String id) 메서드 정의
			// dao.deleteMember(id)메서드 호출
			dao.deleteMember(id);

			// 회원정보 기준값 id => 세션에 "id"값 저장 되어있음.
			// 세션에서 "id"값을 가져오기 -> 변수저장( 다운캐스팅 이루어짐.)
			HttpSession session = request.getSession(); // - 세션 객체생성

			// 세션값 초기화
			session.invalidate();

			// main.jsp 이동
			// response.sendRedirect("main.jsp");
			forward = new ActionForward();
			forward.setPath("MemberMain.me");
			forward.setRedirect(true); // 주소가 MemberMain.me로 바뀌어야해서 true값 입력.

		}

		// 데이터 없으면 false → 아이디 비밀번호 틀림 : script 뒤로이동
		else {
			
			// <script> : 자바 스크립트 코드!
			response.setContentType("text/html; charset=UTF-8"); // html로 응답하겠다는 뜻
			PrintWriter out = response.getWriter(); // response에 html로 출력할 권한을 받아서 자바로 받아오는 과정.

			out.println("<script type=\'text/javascript\'>"); // html 출력 메서드() 괄호안에 스크립트 명령어 입력 -- 괄호안 작은따옴표 !
			out.println("alert(\'아이디 비밀번호 틀림\');"); // html 출력 메서드() 괄호안에 스크립트 명령어 입력 -- 괄호안 작은따옴표 !
			out.println("history.back();"); // html 출력 메서드() 괄호안에 스크립트 명령어 입력
			out.println("</script>"); // html 출력 메서드() 괄호안에 스크립트 명령어 입력
			out.close(); // html 출력을 여기까지 끝낸다.

			forward = null;
		}
		return forward;
	}

} // 클래스
