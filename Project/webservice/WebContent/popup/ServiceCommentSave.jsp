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
	String q_num = request.getParameter("_num");
	String comment = request.getParameter("_Rcontent");
	String a_id = (String) session.getAttribute("adminID");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234");
		Statement stmt = conn.createStatement();
		stmt.executeUpdate("Update server.question set q_comment='"+comment+"', q_state=1, admin_id = '"+a_id+"' where q_num = "+q_num+"");
		out.println("<script>alert('문의가 정상적으로 처리되었습니다.');</script>");
		out.println("<script> window.close(); </script>");
	} catch(Exception e){
		out.println("<script>alert('오류가 발생했습니다.');</script>");
		out.println("<script> history.go(-1); </script>");
		e.printStackTrace();
	}
%>
</body>
</html>