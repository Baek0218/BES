package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberUpdatePro implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 폼에서 입력한 내용이 서버에 전달 → request 내장객체 저장 ,
		// request 한글처리
		request.setCharacterEncoding("utf-8");
		// request 태그이름에 해당하는 값을 가져오기 → 변수에 저장(id,pass,name)
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");

		// 수정할 내용을 바구니 객체생성 -> 바구니에 저장
		MemberDTO updateDto = new MemberDTO();
		updateDto.setId(id);
		updateDto.setPass(pass);
		updateDto.setName(name);

		// MemberDAO 객체생성
		MemberDAO dao = new MemberDAO();

		// MemberDTO dto = userCheck(id,pass) 메서드 호출
		MemberDTO dto = dao.userCheck(id, pass);
		
		// forward 객체생성 전 변수선언.
		ActionForward forward = null;
		
		if (dto != null) {
			// 아이디,비밀번호 일치 -> 바구니 주소 가져오기
			// 리턴값 없음.updateMember(MemberDTO updateDto) 메서드 정의
			// dao.updateMember(updateDto) 메서드 호출
			dao.updateMember(updateDto);
			// ->main.jsp 이동
			// response.sendRedirect("main.jsp"); -- 주소를 바꾸면서 이동하겠다. response.sendRedirect
			forward = new ActionForward();
			forward.setPath("MemberMain.me");
			forward.setRedirect(true);

		} else {
			// 데이터 없으면 false -> 아이디,비밀번호 틀림
			// 아이디,비밀번호 틀리면 -> 빈 바구니 주소 가져오기

			// <script> : 자바 스크립트 코드!
			response.setContentType("text/html; charset=UTF-8"); // html로 응답하겠다는 뜻
			PrintWriter out =response.getWriter(); // response에 html로 출력할 권한을 받아서 자바로 받아오는 과정. 
			
			out.println("<script type=\'text/javascript\'>"); // html 출력 메서드() 괄호안에 스크립트 명령어 입력 -- 괄호안 작은따옴표 !
			out.println("alert(\'아이디 비밀번호 틀림\');"); // html 출력 메서드() 괄호안에 스크립트 명령어 입력 -- 괄호안 작은따옴표 !
			out.println("history.back();"); // html 출력 메서드() 괄호안에 스크립트 명령어 입력
			out.println("</script>"); // html 출력 메서드() 괄호안에 스크립트 명령어 입력
			out.close(); // html 출력을 여기까지 끝낸다.
			
			forward = null;
		}
		return forward; // 이동정보 리턴 : forward 가 이동경로 를 나타내서 return forward
	}

}
