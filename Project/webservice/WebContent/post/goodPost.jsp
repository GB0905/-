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
	String Today = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	try{
		if(s_id != null){
		Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT post_code, u_nick FROM server.good where post_code="+post_code+" and u_nick='"+s_id+"'");
		if(rs.next()){
			System.out.println("딜리트안됨");
			stmt.executeUpdate("DELETE FROM server.good WHERE post_code="+post_code+" AND u_nick='"+s_id+"'");
			out.println("<script>alert('좋지 않아요...?');</script>");
 			out.println("<script> location.replace('./PostBoard.jsp?post_code="+post_code+"'); </script>");
		} else{
			System.out.println("인서트안됨");
			stmt.executeUpdate("INSERT INTO server.good (post_code, u_nick) VALUES("+post_code+", '"+s_id+"')");
			out.println("<script>alert('좋아요!');</script>");
 			out.println("<script> location.replace('./PostBoard.jsp?post_code="+post_code+"'); </script>");
		} 
		rs.close();
		stmt.close();
		conn.close();
		}
		else{
			out.println("<script>alert('로그인후 이용 가능한 서비스입니다!');</script>");
 			out.println("<script> location.replace('./PostBoard.jsp?post_code="+post_code+"'); </script>");
		}
		
	} catch(Exception e){
		e.printStackTrace();
	}
	%>
</body>
</html>