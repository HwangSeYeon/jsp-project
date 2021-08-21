<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/nav.css"> <!--  -->
<title>씨큐브 Java 웹사이트</title>
</head>
<body>
	<%
	String userID = null;
	// 
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	
	<div class="navbar">
		<!-- Navigation bar Logo -->
		<div class="navbar-main" onClick="location.href='index.jsp'"> <!--  -->
			<!-- Navigation bar Icon -->
			<div class="navbar-logo">
				<div class="logo-blue"></div>
				<div class="logo-black"></div>
			</div>
			<!-- Navigation bar Title -->
			<div class="navbar-title">
				<%
				// 
				if (userID == null) {
				%>
				<span>씨큐브 Java 웹사이트</span>
				<%
				} else { // 
				%>
				<span><%= userID %>님의 Java 웹사이트</span>
				<%
				}
				%>
			</div>
		</div>
		
		<!-- Navigation bar Menu -->
		<div class="navbar-menu">
		 	<!-- 로그인 여부와 상관없이 볼 수 있음 -->
			<a href="board.jsp">게시판</a>
			<%
			//
			if (userID == null) {
			%>
			<a href="login.jsp">로그인</a>
			<a href="signUp.jsp">회원가입</a>		
			<%
			} else { //
			%>
			<a href="logoutAction.jsp">로그아웃</a>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>
