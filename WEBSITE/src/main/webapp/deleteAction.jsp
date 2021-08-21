<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>씨큐브 Java 웹사이트</title>
</head>
<body>
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
	
	int boardID = 0;
	if (request.getParameter("boardID") != null) {
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}
	if (boardID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	Board board = new BoardDAO().getBoard(boardID);
	if (!userID.equals(board.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else {
		BoardDAO boardDAO = new BoardDAO();
		int result = boardDAO.delete(boardID);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글 삭제에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'board.jsp'");
			script.println("</script>");
		}
	}
	%>
</body>
</html>