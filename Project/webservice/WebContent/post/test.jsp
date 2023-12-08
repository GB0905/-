<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
String post_code = request.getParameter("post_code");

String title="";
String thumbnail="";
String cook_time="";
	try {
	Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
	Statement stmt = conn.createStatement();
	
	
	
	ResultSet rs = stmt.executeQuery("select * from server.post where post_code="+1+"");
	while(rs.next()){
		title = rs.getString("post_title");
		thumbnail = rs.getString("thumbnail");
		cook_time = rs.getString("cook_timecode");
	}
	
	stmt.close();
	conn.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
	%>
<%=cook_time %>
</body>
</html>