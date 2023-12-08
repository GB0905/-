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
	String s_id = (String) session.getAttribute("sessionID");
	String post_code = request.getParameter("post_code");
	String comment = request.getParameter("comment");
	String Today = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	
	try{
		Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
		Statement stmt = conn.createStatement();
		if(s_id!=null){
			if(stmt.executeUpdate("INSERT INTO server.comment" +
				"(coment, comm_day, comm_report, post_code, u_nick)" +
				"VALUES('"+comment+"', '"+Today+"', 0, "+post_code+", '"+s_id+"')")==1){
			out.println("<script>alert('댓글이 작성되었습니다.');</script>");
 			out.println("<script> location.replace('./PostBoard.jsp?post_code="+post_code+"'); </script>");
			}
		}
		else{
			out.println("<script>alert('로그인후 이용 가능한 서비스입니다!');</script>");
 			out.println("<script> location.replace('./PostBoard.jsp?post_code="+post_code+"'); </script>");
		}
		
		stmt.close();
		conn.close();
	} catch(Exception e){
		e.printStackTrace();
	}
	%>
</body>
</html>