<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>씨큐브 Java 웹사이트</title>
</head>
<body>
	<%
	//
	session.invalidate();
	%>
	<script>
		location.href = 'index.jsp';
	</script>
</body>
</html>
