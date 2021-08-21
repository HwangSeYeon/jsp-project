<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/form.css"> <!--  -->
<title>씨큐브 Java 웹사이트</title>
</head>
<body>
	<jsp:include page="nav.jsp" flush="false"/> <!--  -->
	
	<div class="layout form">
		<h1>로그인</h1>
		<!--  -->
		<form method="post" action="loginAction.jsp">
			<input
				type="text"
				id="userID"
				name="userID"
				placeholder="아이디"
				minlength="4"
				maxlength="20"
			>
			<input
				type="password"
				id="userPassword"
				name="userPassword"
				placeholder="비밀번호"
				minlength="4"
				maxlength="20"
			>
			<input class="submit" type="submit" value="로그인"> <!--  -->
		</form>
	</div>
</body>
</html>
