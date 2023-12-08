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
	String password = request.getParameter("password");
	String nick = request.getParameter("nick");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String phone = request.getParameter("phone");
try {
	Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
	Statement stmt = conn.createStatement();
	
	stmt.executeUpdate("DELETE FROM server.admin WHERE admin_id='"+email+"'");
		stmt.executeUpdate("INSERT INTO server.user " +
				"(u_id, u_pw, u_nick, u_name, birth, gender, phone)" +
				"VALUES('"+email+"', '"+password+"', '"+nick+"', '"+name+"', '"+birth+"', '"+gender+"', '"+phone+"')");
		out.println("<script>alert('"+nick+"회원을 일반회원으로 강등시켰습니다.');</script>");
		out.println("<script> location.replace('./AdminUsers.jsp'); </script>");
	
	stmt.close();
	conn.close();
} catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>