package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberLoginPro implements Action {
	// 추상메서드 무조건 재정의
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberLoginPro execute()");

		// 폼에서 입력한 내용이 서버에 전달 => request 내장객체 저장
		// request 태그이름에 해당하는 값을 가져오기 => 변수에 저장
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		// MemberDAO 객체생성=> 기억장소 할당
		MemberDAO dao = new MemberDAO();
		
		// MemberDTO dto = 주소.userCheck(id,pass)메서드 호출
		MemberDTO dto = dao.userCheck(id, pass);
		
		// ActionForward 객체 생성 (이동정보 저장할 수 있게 선언만 먼저하기)
		ActionForward forward = null;
		
		if (dto != null) {
			// id, pass 일치하면 MemberDTO 바구니에 데이터 담아서 가져오기
			// => 세션값 생성 "id",id(페이지 상관없이 값을 유지) , main.jsp 이동
			HttpSession session = request.getSession();
			session.setAttribute("id", id);

//		    response.sendRedirect("main.jsp");
			// 이동정보 저장.
			forward = new ActionForward(); // 이동정보를 저장할 수 있게 객체생성. 
			forward.setPath("MemberMain.me");
			forward.setRedirect(true); // id,pass일치하면 forward() 정보를 담아서 메인으로 이동하기.
			
		} else {
			// id, pass 틀리면 MemberDTO 빈(null) 바구니 가져오기
			// => script "아이디 비밀번호 틀림" 뒤로이동
			
			// 자바에서 html(자바스크립트) 동작 하게끔 코드 생성하기 - 서버에서 자바스크립트에 응답할때 어떤 내용을 응답할건지 적기.
			// --> js코드로 응답할수 있게 적어야한다. -> 자바에서 사용할 수 있게 아래처럼 세팅을 해준다. 
			
			response.setContentType("text/html; charset=UTF-8"); // html로 응답하겠다는 뜻
			PrintWriter out =response.getWriter(); // response에 html로 출력할 권한을 받아서 자바로 받아오는 과정. 
			
			out.println("<script type=\'text/javascript\'>"); // html 출력 메서드() 괄호안에 스크립트 명령어 입력 -- 괄호안 작은따옴표 !
			out.println("alert(\'아이디 비밀번호 틀림\');"); // html 출력 메서드() 괄호안에 스크립트 명령어 입력 -- 괄호안 작은따옴표 !
			out.println("history.back();"); // html 출력 메서드() 괄호안에 스크립트 명령어 입력
			out.println("</script>"); // html 출력 메서드() 괄호안에 스크립트 명령어 입력
			out.close(); // 출력을 여기까지해서 끝낸다.
			
//		    <script type="text/javascript">
//				alert("아이디 비밀번호 틀림");
//				history.back();
//		    </script>
			// 이동정보 - 뒤로 이동하게 만들어야한다. -> 자바스크립트 방식으로 이동하게 만들기
			forward = null; 
		}
		return forward; // 이동정보를 return. -- 컨트롤러로 리턴이 되어진다.
	}

}
