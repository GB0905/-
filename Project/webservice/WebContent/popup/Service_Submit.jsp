<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
<title>문의하기</title>
	<link rel="stylesheet" type="text/css" href="../css/ServiceWrite.css" />
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String Today = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	String s_id = (String) session.getAttribute("sessionID");
	String title = request.getParameter("_title");
	String content = request.getParameter("_content");
	try {
		Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from server.question");
		int i = 0;
		while(rs.next()){
			i = rs.getInt("q_num");
		}
		if(stmt.executeUpdate(
				"insert into server.question (q_num, q_title, q_content, q_day, q_state, u_nick)"+
				"values("+(i+1)+" , '"+title+"', '"+content+"', '"+Today+"', 0, '"+s_id+"')") == 1){
			out.println("<script>alert('문의되었습니다.');</script>");
		} else{
			out.println("<script>alert('비정상적인 접근입니다.');</script>");
		}

		//사용객체 연결해제
		rs.close();
		stmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<script> window.close();</script>
</body>
</html>