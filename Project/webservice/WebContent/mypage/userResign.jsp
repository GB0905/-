<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
try {
	Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
	Statement stmt = conn.createStatement();
	
	if(stmt.executeUpdate("DELETE FROM server.`user` WHERE u_id='"+email+"'")==1){
		out.println("<script>alert('회원을 강제탈퇴시켰습니다.');</script>");
		out.println("<script> location.replace('./AdminUsers.jsp'); </script>");
	}
	
	stmt.close();
	conn.close();
} catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>