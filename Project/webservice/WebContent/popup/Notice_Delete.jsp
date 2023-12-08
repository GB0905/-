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
	String noti_num = request.getParameter("noti_num");
	try {
		Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
		Statement stmt = conn.createStatement();
		if(stmt.executeUpdate(
				"delete from server.notice where noti_num = "+noti_num+"") == 1){
			out.println("<script>alert('삭제되었습니다.'); location.replace('../admin/Admin.jsp');</script>");
		} else{
			out.println("<script>alert('비정상적인 접근입니다.'); location.replace('../admin/Aadmin.jsp');</script>");
		}

		stmt.close();
		conn.close();
} catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>