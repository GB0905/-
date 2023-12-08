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
	
	String comm_num = request.getParameter("comm_num");
	String post_code = request.getParameter("post_code");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select comm_report from server.comment where comm_num ="+comm_num+"");
		rs.next();
		int pre_repo = rs.getInt("comm_report");
		stmt.executeUpdate("Update server.comment set comm_report="+(pre_repo+1)+" where comm_num = "+comm_num+"");
		
		rs.close();
		stmt.close();
		conn.close();
	} catch(Exception e){
		e.printStackTrace();
	}
	out.println("<script>alert('신고가 접수되었습니다.');</script>");
	out.println("<script> location.replace('./PostBoard.jsp?post_code="+post_code+"'); </script>");
	%>
</body>
</html>