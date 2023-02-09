<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/pro4.jsp</title>
</head>
<body>
<h1>jsp1/pro4.jsp</h1>
<%
/* http://localhost:8080/webproject/jsp1/pro4.jsp
?id=ddf&pass=fas&name=asdf&age=1&gender=여
hobby=여행&hobby=게임&hobby=축구 ==> 배열변수로 받아지는 것  
&grade=2등&memo=asd  */
// 사용자가 입력한 내용을 http가 들고가서 서버에 전달하면 
// 서버에 request저장공간에 요청정보 저장 
// post방식 일때 => request 한글처리 
//변수 = request 저장된 요청정보 가져오기
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String age=request.getParameter("age");
String gender=request.getParameter("gender");
//String hobby=request.getParameter("hobby");
String hobby[]=request.getParameterValues("hobby");
String grade=request.getParameter("grade");
String memo=request.getParameter("memo");

//int a = Integer.parseInt(age);

%>

아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
이름 : <%=name %><br>
나이 : <%=age %><br>
성별 : <%=gender %><br>
취미 : <% 
// hobby.length -> null.length ->에러발생 
// null이 아닌경우에 에러발생하지않게 만들기 (if문추가)
		if(hobby != null){
			 for(int i = 0; i<hobby.length;i++){
		%> 
		 		<%=hobby[i] %>
		 <% 
			 }
		}
		 %><br>
등급 : <%=grade %><br>
메모 : <%=memo %><br>
</body>
</html>