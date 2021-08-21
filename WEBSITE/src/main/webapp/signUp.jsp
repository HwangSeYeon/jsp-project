<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/form.css">
<title>웹사이트</title>
</head>
<body>
	<jsp:include page="nav.jsp" flush="false"/>
	
	<div class="layout form">
		<h1>회원가입</h1>
		<form method="post" action="signUpAction.jsp">
			<input
				type="text"
				id="userName"
				name="userName"
				placeholder="이름"
				minlength="2"
				maxlength="20"
			>
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
			<input
				type="password"
				id="userPasswordCheck"
				name="userPasswordCheck"
				placeholder="비밀번호확인"
				minlength="4"
				maxlength="20"
			>
			<input class="submit" type="submit" value="회원가입">	
		</form>
	</div>
</body>
</html>
