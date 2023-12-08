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
	String nick = request.getParameter("change_nick");
	String E_mail = request.getParameter("_E_mail");
try {
	Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/server","root","1234"); //데이터베이스 연결
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("Select u_nick from server.`user` where u_nick='"+nick+"'");
	if(rs.next()){
		out.println("<script>alert('이미 사용중인 닉네임 입니다.');</script>");
		out.println("<script> location.replace('./mypage.jsp'); </script>");
	} else if(nick==null || (nick.trim()).equals("") ){
			out.println("<script>alert('닉네임을 입력해주세요.');</script>");
			out.println("<script> location.replace('./mypage.jsp'); </script>");
	} else if(stmt.executeUpdate("Update server.`user` set u_nick = '"+nick+"' WHERE u_id='"+E_mail+"'")==1){
		out.println("<script>alert('닉네임을 "+nick+"로 변경하였습니다.');</script>");
		out.println("<script> location.replace('./mypage.jsp'); </script>");
		session.setAttribute("sessionID", nick);
	}
	
	stmt.close();
	conn.close();
} catch(Exception e){
	e.printStackTrace();
}
%>
</body>
</html>