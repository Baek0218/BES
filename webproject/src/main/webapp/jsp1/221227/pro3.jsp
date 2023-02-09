<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/pro3.jsp</title>
</head>
<body>
<h1>jsp1/pro3.jsp</h1>
<%
// get방식 : 기본 전송방식 , 주소줄에 보이면서 전달하는 방식(id=kim&pass=1111)
//           서버 단에서 한글이 기본 설정이 되어있음
// post방식 : form 태그에서 만 선택해서 데이터 전달하는 방식
//           주소줄에 안보이면서 http에 본문 안에 담아서 전달하는 방식
//            보안상 좋은 방식 (pass를 포함하고 있으면 선택하는 방식)
//           서버 단에서 한글 설정이 안 되어있음 
//            => request사용하기 전에 한글 설정 작업 필요

// http (HyperText Transfer Protocol) : 요청, 응답 하는 통신규약
//http요청메시지       시작라인    : 주소줄(id=kim&pass=1111)
//                 헤더(Header) : 설정정보
//                  본문(Body)  : 요청메시지   

//http응답메시지       시작라인    : 주소줄
//                 헤더(Header) : 설정정보
//                  본문(Body)  : 응답메시지
request.setCharacterEncoding("utf-8");

String id=request.getParameter("id");
String pass=request.getParameter("pass");
String age=request.getParameter("age");
String name=request.getParameter("name");


//문자열(참조형) => 정수형(기본자료형) 숫자 변경  => 형변환 안됨
int a = Integer.parseInt(age);
%>
아이디 : <%=id %><br>
비밀번호 :<%=pass %><br>
이름 : <%=name %><br>
문자열 나이 : <%=age+100 %><br> <!-- 100은 아무숫자나 넣은것. -->
정수형으로 변경된 나이 :<%=a+100 %><br> 
</body>
</html>





