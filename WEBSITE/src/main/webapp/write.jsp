<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/form.css">
<title>씨큐브 Java 웹사이트</title>
</head>
<body>
	<jsp:include page="nav.jsp" flush="false"/>
	
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	%>
	
	<div class="layout write-form">
		<h1>글쓰기</h1>
		<form method="post" action="writeAction.jsp">
			<input
				class="title"
				type="text"
				placeholder="글 제목"
				name="boardTitle"
				maxlength="50"
			>
			<textarea placeholder="글 내용" name="boardContent"></textarea>
			<div>
				<input class="submit" type="submit" value="글쓰기">
			</div>
		</form>
	</div>
</body>
</html>