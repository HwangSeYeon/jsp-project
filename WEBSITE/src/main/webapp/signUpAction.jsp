<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter" %>
<%@ include file="loginCheck.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userName" /> <!--  -->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userPasswordCheck" /> <!--  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>씨큐브 Java 웹사이트</title>
</head>
<body>
	<%
	// 
	if (user.getUserName() == null
	|| user.getUserID() == null
	|| user.getUserPassword() == null
	|| user.getUserPasswordCheck() == null) {
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('모든 항목을 입력해주세요.')");
		script.println("history.back()");
		script.println("</script>");
	}
	// 
	else if (!user.getUserPassword().equals(user.getUserPasswordCheck())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('동일한 비밀번호를 입력해주세요.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else {
		UserDAO userDAO = new UserDAO();
		int result = userDAO.signUp(user); // 
		
		// 
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		// 
		else {
			session.setAttribute("userID", user.getUserID()); // 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
		
	}
	
	%>
</body>
</html>
