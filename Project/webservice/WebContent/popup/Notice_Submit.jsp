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
	String Today = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
	String a_id = request.getParameter("admin_id");
	String noti_num = request.getParameter("noti_num");
	String noti_title = request.getParameter("noti_title");
	String noti_content = request.getParameter("noti_content");
	if(a_id == null){
		out.println("<script>alert('로그인 후 사용 가능합니다.');</script>");
		out.println("<script> window.close();</script>");
	}
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
				"insert into server.notice (noti_num, noti_title, noti_content, noti_day, noti_views, admin_id)"+
				"values("+noti_num+" , '"+noti_title+"', '"+noti_content+"', '"+Today+"', 0, '"+a_id+"')") == 1) //아이디 비밀번호 확인
			out.println("<script>alert('공지가 게시되었습니다.');</script>");
		
		else
			out.println("<script>alert('비정상적인 접근입니다.');</script>");
		
		//사용객체 연결해제
		rs.close();
		stmt.close();
		conn.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<script> window.close(); </script>
</body>
</html>