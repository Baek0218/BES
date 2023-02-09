<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp1/includeMain.jsp</title>
</head>
<body>
	<h1>jsp1/includeMain.jsp</h1>
	<table border="1" width=600 height=600>
		<tr>
			<td><jsp:include page="includeTop.jsp" /></td>
		</tr>
		<tr>
			<td>본문</td>
		</tr>
		<tr>
			<td><jsp:include page="includeBottom.jsp" /></td>
		</tr>
	</table>
</body>
</html>