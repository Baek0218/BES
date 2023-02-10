package com.itwillbs.member.action;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberFrontController extends HttpServlet {
	// 주소매핑
	// 가상주소 http://localhost:8080/Model2/InsertForm.me

	// 메서드 호출 => 자동으로 메서드 호출할려면
	// => 처리담당자(서블릿) 만들기=> 자동으로 doGet() doPost() service() 호출

	// 메서드 오버라이딩 alt shift s -> v
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MemberFrontController doGet()");
		// 방식 상관없이 호출
		doProcess(request, response);
	}// doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MemberFrontController doPost()");
		// 방식 상관없이 호출
		doProcess(request, response);
	}// doPost()

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MemberFrontController doProcess()");
		// 주소매핑
		// 가상주소 http://localhost:8080/Model2/InsertForm.me
		// /InsertForm.me 가상주소 뽑아오기
		System.out.println("뽑은 가상주소 : " + request.getServletPath());
		String sPath = request.getServletPath();

		// 이동정보를 저장하는 자바파일 선언
		ActionForward forward = null;
		// 부모 인터페이스 틀 선언
		Action action = null;

		if (sPath.equals("/MemberInsertForm.me")) {
			System.out.println("가상주소 /InsertForm.me => 실제페이지 member/insertForm.jsp 이동");
			// 실제페이지 member/insertForm.jsp 이동
//			response.sendRedirect("member/insertForm.jsp");

			// 주소가 변경되지 않고 request, response 가지고 이동
//			RequestDispatcher dispatcher=
//					request.getRequestDispatcher("member/insertForm.jsp");
//			dispatcher.forward(request, response);

			// 이동정보를 저장하는 자바파일 객체생성
			forward = new ActionForward();
			forward.setPath("member/insertForm.jsp");
			forward.setRedirect(false);

		} else if (sPath.equals("/MemberInsertPro.me")) {
			System.out.println("가상주소 /MemberInsertPro.me => 실제자바파일 연결");
			// 실제페이지 (처리)자바 InsertPro.java<=>(디비)자바
			// 패키지 com.itwillbs.member.action
			// 파일이름 InsertPro.java
			// execute(HttpServletRequest request, HttpServletResponse response) 메서드 정의

			// 부모 = 자식 객체생성
			action = new MemberInsertPro();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 주소 변경되면서 이동
//			response.sendRedirect("MemberLoginForm.me");

		} else if (sPath.equals("/MemberLoginForm.me")) {
//			 member/loginForm.jsp 이동
			// 주소가 변경되지 않고 request, response 가지고 이동
//			RequestDispatcher dispatcher=
//					request.getRequestDispatcher("member/loginForm.jsp");
//			dispatcher.forward(request, response);

			// 이동정보 저장
			forward = new ActionForward();
			forward.setPath("member/loginForm.jsp");
			forward.setRedirect(false);

		} else if (sPath.equals("/MemberLoginPro.me")) {
			// 자바객체 생성 -> 메서드 호출
			// 패키지 com.itwillbs.member.action
			// 파일이름 LoginPro.java
			// execute2(HttpServletRequest request, HttpServletResponse response) 메서드 정의

			// 0209
			// 객체생성
			// 부모 인터페이스 = new 자식 MemberLoginPro.java
			// 예외처리 forward이동정보(리턴값) = execute 메서드 호출
			action = new MemberLoginPro();
			try {
				forward = action.execute(request, response);
				// forward가 일치하면 이동해라 - null 이면 이동은 안하지만 자바스크립트 구문을 받아온다.

			} catch (Exception e) {
				e.printStackTrace();

			}

		} else if (sPath.equals("/MemberMain.me")) {
			// member/main.jsp 주소변경 없이 이동
//			RequestDispatcher dispatcher=
//					request.getRequestDispatcher("member/main.jsp");
//			dispatcher.forward(request, response);

			// 이동정보 저장
			forward = new ActionForward();
			forward.setPath("member/main.jsp");
			forward.setRedirect(false);

		} else if (sPath.equals("/MemberLogout.me")) {
			action = new MemberLogout();

			try {
				forward = action.execute(request, response);
				// forward가 일치하면 이동해라 - null 이면 이동은 안하지만 자바스크립트 구문을 받아온다.

			} catch (Exception e) {
				e.printStackTrace();

			}

		} else if (sPath.equals("/MemberInfo.me")) { // 이동할때는 '/' 붙이면 안됨! /=root
			action = new MemberInfo();

			try {
				// forward가 일치하면 이동해라 - null 이면 이동은 안하지만 자바스크립트 구문을 받아온다.
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();

			}
		} else if (sPath.equals("/MemberUpdateForm.me")) {
			action = new MemberUpdateForm();

			try {
				// forward가 일치하면 이동해라 - null 이면 이동은 안하지만 자바스크립트 구문을 받아온다.
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();

			}
		} else if (sPath.equals("/MemberUpdatePro.me")) {
			action = new MemberUpdatePro();

			try {
				// forward가 일치하면 이동해라 - null 이면 이동은 안하지만 자바스크립트 구문을 받아온다.
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();

			}
		} else if (sPath.equals("/MemberDeleteForm.me")) {

			// 이동정보 저장
			forward = new ActionForward();
			forward.setPath("member/deleteForm.jsp");
			forward.setRedirect(false);
			
		} else if(sPath.equals("/MemberDeletePro.me")) {
			action = new MemberDeletePro();

			try {
				// forward가 일치하면 이동해라 - null 이면 이동은 안하지만 자바스크립트 구문을 받아온다.
				forward = action.execute(request, response);

			} catch (Exception e) {
				e.printStackTrace();

			}
		} else if(sPath.equals("/MemberList.me")) {
			action = new MemberList();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 이동 => 이동정보( 주소정보, 이동방식)=> 이동정보 저장하는 자바파일
//		String path ="주소정보";
//		boolean isRedirect = true;
		// 이동정보 자바파일 있는지 확인
		if (forward != null) {
			// 이동방식비교
			if (forward.isRedirect() == true) {
				response.sendRedirect(forward.getPath());

			} else {
				// forward.isRedirect()==false // RequestDispatcher -> 아무것도 안들고 이동. dispatcher
				// -> 값을 들고 이동
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}

	}// doProcess()

}// 클래스
