<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="crypt" class="Service_crypt.Descrypt"></jsp:useBean>
<script type="text/javascript" src="./test.js"></script>
	<form action="./test.jsp" method="post">
		<% crypt.Aes_KeyGenerator(session);%>
		<input type="text" id="msg" name="msg">
		<button>보내기</button>
	</form>
</body>
</html>