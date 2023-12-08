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
<%
	
	String msg_cypher = request.getParameter("msg_cypher");
	byte[] byte_cypher2 = (byte[]) session.getAttribute("cyphertext");
	byte[] byte_cypher = msg_cypher.getBytes();
	String msg = crypt.Aes_DECRYPT(session, byte_cypher);
	String msg2 = crypt.Aes_DECRYPT(session, byte_cypher2);
	out.println("<p>cypher:" + byte_cypher);
	out.println("<p>msg: " + msg);
	out.println("<p>cypher:" + byte_cypher2);
	out.println("<p>msg: " + msg2);
%>
</body>
</html>